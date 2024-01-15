#include<fcntl.h>
#include<sys/mman.h>
#include<unistd.h>
#include<errno.h>
#include<stdio.h>
#include<stdlib.h>

#include<viper/core/file/file.h>
#include<viper/core/debug/logger.h>


#ifdef __linux__

i8 ViperFileLoad(ViperFile_t* file, const char* path) {
   u64 length = 0;
   void* ptr = NULL;
   int fd = -1;

   if (-1 == (fd = open(path, O_RDONLY))) {
      ViperLogError("Failed open [ %e ]", errno);
      goto ERROR_EXIT;
   }

   if (0 >= (length = lseek(fd, 0, SEEK_END))) {
      ViperLogError("Failed lseek [ %e ]", errno);
      goto ERROR_EXIT;
   }
   
   if (MAP_FAILED == (ptr = mmap(NULL, length, PROT_READ, MAP_SHARED, fd, 0))) {
      goto ERROR_EXIT;
   }

   if (-1 == close(fd)) {
      ViperLogError("Failed to close file descriptor [ %e ]", errno);
      goto ERROR_EXIT;
   }

   file->buffer.bytes = length;
   file->buffer.ptr = ptr;

ERROR_EXIT:
   return 0;
}

i8 ViperFileUnload(ViperFile_t* file) {
   if  (-1 == munmap(file->buffer.ptr, file->buffer.bytes)) {
      goto ERROR_EXIT;
   }
   
   file->buffer.bytes = 0;

   return 0;
ERROR_EXIT:
   return -1;
}

#else

i8 ViperFileLoad(ViperFile_t* file, const char* path) {
   int length = 0;
   FILE* fd = fopen(path, "rb");

   if (NULL == fd) {
      ViperLogWarning("failed to open file [ %s ]", path);
      goto ERROR_EXIT;
   }

   if (0 != fseek(fd, 0, SEEK_END)) {
      ViperLogError("fseek failed"); 
      goto ERROR_EXIT_CLOSE;
   }

   length = ftell(fd);
   rewind(fd);

   if (0 == length) {
      ViperLogWarning("file is length 0");
      goto ERROR_EXIT_CLOSE;
   }

   file->buffer.ptr = calloc(length, sizeof(u8));

   if (NULL == file->buffer.ptr) {
      ViperLogError("malloc failed [ %e ]", errno);
      goto ERROR_EXIT_CLOSE;
   }

   fread(file->buffer.ptr, length, 1, fd);

   fclose(fd);
   file->buffer.bytes = length;
   return 0;
ERROR_EXIT_CLOSE:
   fclose(fd);
ERROR_EXIT:
   return -1;
}

i8 ViperFileUnload(ViperFile_t* file) {
   free(file->buffer.ptr);
   file->buffer.bytes = 0;
   return 0;
}

#endif
