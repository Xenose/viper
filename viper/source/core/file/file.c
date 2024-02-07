#include<fcntl.h>
#include<sys/mman.h>
#include<unistd.h>
#include<errno.h>
#include<stdio.h>
#include<stdlib.h>

#include<viper/core/file/file.h>
#include<viper/core/debug/logger.h>

#include<viper/core/platform/io.h>

i8 ViperFileOpen(ViperFile_t* file, cc* fullpath, u64 flags, u64 mode) {
   ViperFile_t* f = file;
   ViperBuffer_t* b = NULL;

   if (NULL == f) {
      ViperLogError("Null file provieded");
      goto ERROR_EXIT;
   }

   b = &file->buffer;
   
   f->fd = ViperOpen(fullpath, flags, mode);
   b->length = lseek(f->fd, 0, SEEK_END);

   if (0 >= b->length) {
      ViperLogError("Failed lseek [ %e ]", errno);
      goto ERROR_EXIT;
   }

ERROR_EXIT:
   return 0;
}

i8 ViperFileLoad(ViperFile_t* file, const char* path) {
   return 0;
}

i8 ViperFileUnload(ViperFile_t* file) {
   return 0;
}

i8 ViperFileClose(ViperFile_t* file) {
   ViperFile_t* f = file;

   if (NULL != file) {
      goto ERROR_EXIT;
   }

   if (0 != ViperFileUnload(f)) {
      ViperLogWarning("Failed to unload file %s", f->name);
   }
   
   return 0;
ERROR_EXIT:
   return 0;
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

