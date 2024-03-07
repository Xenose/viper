#ifndef __header_viper_linux_mman__
#define __header_viper_linux_mman__

#ifndef _WIN32
   #include<sys/mman.h>
#else


#include<stdlib.h>
#include<viper/linux/types.h>

#define MAP_FAILED NULL

#define PROT_READ	0x0001
#define PROT_WRITE	0x0002

#define MAP_SHARED		0x0001
#define MAP_PRIVATE		0x0002

extern int munmap(void* addr, size_t length);
extern void* mmap(void* addr, size_t length, int prot, int flags, int fd, off_t offset);
	
#endif /* _WIN32 */

#endif /* __header_viper_linux_mman__ */
