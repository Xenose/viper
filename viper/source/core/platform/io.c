
#ifndef _WIN32
	#include<unistd.h>
#endif /* _WIN32 */

#include<fcntl.h>
#include<viper/core/platform/io.h>

i64 ViperWrite(i64 fd, void* const buffer, u64 bytes) {
   return write(fd, buffer, bytes);
}

i64 ViperOpen(cc* fullpath, int flags, u64 modes) {
   i64 fd = open(fullpath, flags, modes);
   return fd;
}
