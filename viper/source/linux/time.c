#include<errno.h>
#include<viper/linux/time.h>

static LARGE_INTEGER __lastClock = { 0 };

int clock_getres(clockid_t clockid, struct timespec* res) {
	return 0;
}

int clock_gettime(clockid_t clockid, struct timespec* tp) {
	int64_t seconds = 0;
	int64_t nseconds = 0;
	LARGE_INTEGER ct = { 0 };

REDO:
	if (0 == QueryPerformanceCounter(&ct)) {
		goto ERROR_EXIT;
	}
	
	seconds = ct.QuadPart / 1000000000LL;
	nseconds = ct.QuadPart - (seconds * 1000000000LL);
	
	switch(clockid) {
		case CLOCK_MONOTONIC:
			if (ct.QuadPart < __lastClock.QuadPart) {
				goto REDO;
			}

			__lastClock = ct;
		case CLOCK_REALTIME:
			tp->tv_sec = seconds;
			tp->tv_nsec = nseconds;
			break;
		case CLOCK_PROCESS_CPUTIME_ID:
			break;
		case CLOCK_THREAD_CPUTIME_ID:
			break;
		default:
			errno = EINVAL;
			goto ERROR_EXIT;
	}

	return 0;
ERROR_EXIT:
	return -1;
}

int clock_settime(clockid_t clockid, const struct timespec* tp) {
	return 0;

}
