#ifndef __header_viper_linux_sched__
#define __header_viper_linux_sched__

#ifndef _WIN32
   #include<sched.h>
#else

#define CLONE_THREAD		0x0001
#define CLONE_SIGHAND		0x0002
#define CLONE_FILES			0x0004
#define CLONE_VM			0x0008

extern int clone(int (*fn)(void* ptr), void* stack, int flags, void* arg, ...);

#endif /* _WIN32 */

#endif /* __header_viper_linux_sched__ */
