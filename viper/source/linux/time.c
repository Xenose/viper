#include<viper/linux/time.h>

int clock_getres(clockid_t clockid, struct timespec* res) {
	return 0;
}

int clock_gettime(clockid_t clockid, struct timespec* tp) {
	return 0;
}

int clock_settime(clockid_t clockid, const struct timespec* tp) {
	return 0;
}
