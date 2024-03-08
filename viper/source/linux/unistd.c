#include<viper/linux/unistd.h>
#include<viper/linux/time.h>

#ifdef _WIN32

#include<Windows.h>

unsigned int sleep(unsigned int seconds) {
	int64_t out = 0;
   struct timespec tp0 = { 0 };
   struct timespec tp1 = { 0 };
   unsigned int durration = seconds * 1000;

   clock_gettime(CLOCK_MONOTONIC, &tp0);
   Sleep(durration);
   clock_gettime(CLOCK_MONOTONIC, &tp0);

   out = ((int64_t)seconds) - (tp1.tv_sec - tp0.tv_sec);
   return 0 > out ? 0 : (unsigned int)out;
}

unsigned int usleep(useconds_t usec) {
   FILETIME utc = { 0 };
   SYSTEMTIME start = { 0 };
   SYSTEMTIME end = { 0 };

   GetSystemTimeAsFileTime(&utc);
   FileTimeToSystemTime(&start, &utc);

   Sleep(usec);

   GetSystemTimeAsFileTime(&utc);
   FileTimeToSystemTime(&end, &utc);

   return 0;
}

int isatty(int fd) {
   return _isatty(fd);
}

#endif /* _WIN32 */
