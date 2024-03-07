#ifndef __header_viper_linux_time__
#define __header_viper_linux_time__

#ifndef _WIN32
   #include<time.h>
#else

#include<Windows.h>
#include<viper/linux/types.h>

struct timespec {
	time_t tv_sec;
	long tv_nsec;
};

enum {
	CLOCK_REALTIME = 1,
	CLOCK_MONOTONIC,
	CLOCK_PROCESS_CPUTIME_ID,
	CLOCK_THREAD_CPUTIME_ID,
};

#endif /* _WIN32 */

#endif /* __header_viper_linux_fcntl__ */
