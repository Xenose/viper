
#include<unistd.h>
#include<viper/core/platform/io.h>

i64 ViperWrite(i64 fd, void* const buffer, u64 bytes) {
   return write(fd, buffer, bytes);
}
