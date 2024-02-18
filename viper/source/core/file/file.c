#include<errno.h>
#include<fcntl.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/mman.h>
#include<unistd.h>
#include<sys/stat.h>

#include<viper/core/file/file.h>
#include<viper/core/debug/logger.h>

#include<viper/core/platform/io.h>
#include<viper/core/memory/allocator.h>

i8 __ViperFileUnloadLoop(ViperFile_t* file) {
}

i8 __ViperFileUnloadMunmap(ViperFile_t* file) {
   ViperFile_t* f = file;
   ViperBuffer_t* b = NULL;

   if (NULL == f) {
      ViperLogWarning("Null value for file was given");
      goto ERROR_EXIT;
   }

   b = &f->buffer;
   munmap(b->ptr, b->length);
   f->flags &= ~VIPER_FILE_FLAG_LOADED;
   return 0;
ERROR_EXIT:
   return -1;
}

static i8 __ViperFileLoadMap(ViperFile_t* file) {
   ViperFile_t* f = file;
   ViperBuffer_t* b = NULL;
   
   struct stat stats = { 0 };

   if (NULL == f) {
      ViperLogWarning("Null value for file was given");
      goto ERROR_EXIT;
   }
   
   if (VIPER_FILE_FLAG_LOADED & f->flags) {
      ViperFileUnload(file);

      if (-1 == fstat(f->fd, &stats)) {
         ViperLogError("Failed fstat [ fd : %i ] [ error : %e ]", f->fd, errno);
         goto ERROR_EXIT;
      }

      b->length = stats.st_size;
   }

   b = &f->buffer;
   b->ptr = mmap(NULL, b->length, PROT_READ, MAP_SHARED, f->fd, 0);

   if (MAP_FAILED == b->ptr) {
      ViperLogError("mmap failed [ fd : %i ] [ length : %i ] [ error : %e ]", f->fd, b->length, errno);
      goto ERROR_EXIT;
   }

   f->flags |= VIPER_FILE_FLAG_LOADED;
   return 0;
ERROR_EXIT:
   return -1;
}

static i8 __ViperFileLoadLoop(ViperFile_t* file) {
   ViperBuffer_t* b = &file->buffer;
   void* tmp = NULL;
   u64 current = 0;
   u64 total = 0;
   u64 stepSize = 0;

   do {
      total += current;
      stepSize += 4096;
      tmp = ViperRealloc(b->ptr, stepSize);

      if (NULL == tmp) {
         ViperLogWarning("Failed to realloc memory [ %e ]", errno);
         break;
      }

      b->ptr = tmp;
   } while ((current = read(file->fd, b->ptr, stepSize)));

   tmp = ViperRealloc(b->ptr, total + 1);

   if (NULL == tmp) {
      ViperLogWarning("Failed to realloc memory [ %e ]", errno);
      return -1;
   }

   b->ptr = tmp;
   b->str[total] = '\0';
   b->length = total + 1;
   return 0;
}

i8 ViperFileUnload(ViperFile_t* file) {
   if (file->flags & VIPER_FILE_FLAG_SYSTEM) {
      // This is slower then mmap
      return __ViperFileUnloadLoop(file);
   }

   return __ViperFileUnloadMunmap(file);
}



i8 ViperFileLoad(ViperFile_t* file) {
   if (file->flags & VIPER_FILE_FLAG_SYSTEM) {
      // This is slower then mmap
      return __ViperFileLoadLoop(file);
   }

   return __ViperFileLoadMap(file);
}

i8 ViperFileClose(ViperFile_t* file) {
   ViperFile_t* f = file;

   if (NULL == file) {
      goto ERROR_EXIT;
   }

   if (VIPER_FILE_FLAG_LOADED & f->flags) {
      if (0 != ViperFileUnload(f)) {
         ViperLogWarning("Failed to unload file %s", f->name);
      }
   }

   return 0;
ERROR_EXIT:
   return 0;
}

i8 ViperFileOpen(ViperFile_t* file, cc* fullpath, u64 flags, u64 mode) {
   ViperFile_t* f = file;
   ViperBuffer_t* b = NULL;

   struct stat stats = { 0 };

   if (NULL == f) {
      ViperLogError("Null file provieded");
      goto ERROR_EXIT;
   }

   if (VIPER_FILE_FLAG_OPEN & f->flags) {
      ViperFileClose(file);
   }

   memset(file, 0, sizeof(ViperFile_t));
   b = &file->buffer;
   f->fd = ViperOpen(fullpath, flags, mode);

   if (-1 == f->fd) {
      ViperLogWarning("Failed to open file [ %s ]", fullpath);
      goto ERROR_EXIT;
   }

   if (-1 == fstat(f->fd, &stats)) {
      ViperLogError("Failed fstat [ fd : %i ] [ error : %e ]", f->fd, errno);
      goto ERROR_EXIT;
   }

   ViperLogDebug("Length is %i", stats.st_size);
   
   b->length = stats.st_size;

   if (0 == b->length) {
      ViperLogDebug("Possible special file switching loading method");
      f->flags |= VIPER_FILE_FLAG_SYSTEM;
   }

   f->flags |= VIPER_FILE_FLAG_OPEN;
   return 0;
ERROR_EXIT:
   return -1;
}

i8 ViperFileOpenLoad(ViperFile_t* file, cc* fullpath, u64 flags, u64 mode) {
   if (0 != ViperFileOpen(file, fullpath, flags, mode)) {
      goto ERROR_EXIT;
   }

   if (0 != ViperFileLoad(file)) {
      goto ERROR_EXIT_CLOSE;
   }

   return 0;
ERROR_EXIT_CLOSE:
   ViperFileClose(file);
ERROR_EXIT:
   return -1;
}

i64 ViperFileWrite(ViperFile_t* restrict file, cc* restrict data) {
   i64 written = 0;

   if (NULL == file || NULL == data) {
      ViperLogError("Null value provieded");
      goto ERROR_EXIT;
   }

   written = write(file->fd, data, strlen(data));

   if (-1 == written) {
      ViperLogError("Write failed [ %e ]", errno);
      goto ERROR_EXIT;
   }

   // Reloading file
   if (VIPER_FILE_FLAG_LOADED & file->flags) {
      if (0 != ViperFileLoad(file)) {
         goto ERROR_EXIT;
      }
   }

   return written;
ERROR_EXIT:
   return -1;
}

i8 ViperFileDelete(ViperFile_t* file) {
   return 0;
}

i8 ViperFileCreate(ViperFile_t* file) {
   return 0;
}

i8 ViperFileGetPremissions(ViperFile_t* file) {
   return 0;
}

i8 ViperFileSetPremissions(ViperFile_t* file) {
   return 0;
}

