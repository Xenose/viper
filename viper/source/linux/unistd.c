#include<viper/linux/unistd.h>

#ifdef _WIN32

#include<Windows.h>

unsigned int sleep(unsigned int seconds) {
   unsigned int durration = seconds * 1000;

   FILETIME utc = { 0 };
   SYSTEMTIME start = { 0 };
   SYSTEMTIME end = { 0 };

   GetSystemTimeAsFileTime(&utc);
   FileTimeToSystemTime(&start, &utc);

   Sleep(durration);

   GetSystemTimeAsFileTime(&utc);
   FileTimeToSystemTime(&end, &utc);


   return 0;
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
