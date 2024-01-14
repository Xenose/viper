#include<fcntl.h>
#include<sys/mman.h>
#include<unistd.h>
#include<errno.h>

#include<viper/core/file/file.h>
#include<viper/core/debug/logger.h>

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

   ViperLogDebug("File loaded [ %s ]", path);
ERROR_EXIT:
   return 0;
}
