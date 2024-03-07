#ifndef __header_viper_linux_unistd__
#define __header_viper_linux_unistd__

#ifndef _WIN32

#include<unistd.h>

#else

extern unsigned int sleep(unsigned int seconds);
extern unsigned int usleep(useconds_t usec);
extern int isatty(int fd);

#endif /* _WIN32 */

#endif /* __header_viper_linux_unistd__ */
