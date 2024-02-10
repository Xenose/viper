#include<fcntl.h>
#include<sys/mman.h>
#include<unistd.h>
#include<errno.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include<viper/core/file/file.h>
#include<viper/core/debug/logger.h>

#include<viper/core/platform/io.h>

i8 ViperFileUnload(ViperFile_t* file) {
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

i8 ViperFileLoad(ViperFile_t* file) {
   ViperFile_t* f = file;
   ViperBuffer_t* b = NULL;

   if (NULL == f) {
      ViperLogWarning("Null value for file was given");
      goto ERROR_EXIT;
   }
   
   if (VIPER_FILE_FLAG_LOADED & f->flags) {
      ViperFileUnload(file);
      b->length = lseek(f->fd, 0, SEEK_END);
   }

   b = &f->buffer;
   b->ptr = mmap(NULL, b->length, PROT_READ, MAP_SHARED, f->fd, 0);

   if (MAP_FAILED == b->ptr) {
      ViperLogError("mmap failed [ %e ]", errno);
      goto ERROR_EXIT;
   }

   f->flags |= VIPER_FILE_FLAG_LOADED;
   return 0;
ERROR_EXIT:
   return -1;
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

   if (NULL == f) {
      ViperLogError("Null file provieded");
      goto ERROR_EXIT;
   }
   
   if (VIPER_FILE_FLAG_OPEN & f->flags) {
      ViperFileClose(file);
   }

   b = &file->buffer;
   
   f->fd = ViperOpen(fullpath, flags, mode);
   b->length = lseek(f->fd, 0, SEEK_END);

   if (0 >= b->length) {
      ViperLogError("Failed lseek [ %e ]", errno);
      goto ERROR_EXIT;
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
      goto ERROR_EXIT;
   }

   return 0;
ERROR_EXIT_CLOSE:
   ViperFileClose(file);
ERROR_EXIT:
   ViperLogError("Failed to open/load file [ %s ]", fullpath);
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

