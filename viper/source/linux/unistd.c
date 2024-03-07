#include<viper/linux/unistd.h>

#ifdef _WIN32

#include<windows.h>

unsigned int sleep(unsigned int seconds) {
   unsigned int durration = seconds * 1000;

   FILETIME utc = { 0 };
   SYSTEMTIME start = { 0 };
   SYSTEMTIME end = { 0 };

   GetSystemTimeAsFileTime(&utc);
   FileTimeToSystemTime(&start);

   Sleep(durration);

   GetSystemTimeAsFileTime(&utc);
   FileTimeToSystemTime(&end);

   if (end.wYear > start.wYear || (end.wYear == start.wYear && end.wDayOfYear > start.wDayOfYear)) {
        // Handle the case where the date changes during sleep
        return 0;
   }

  
   if (end < (start + durration)) {
      return (end - (start + durration)) / 1000;
   }

   return 0;
}

unsigned int usleep(useconds_t usec) {
   FILETIME utc = { 0 };
   SYSTEMTIME start = { 0 };
   SYSTEMTIME end = { 0 };

   GetSystemTimeAsFileTime(&utc);
   FileTimeToSystemTime(&start);

   Sleep(usec);

   GetSystemTimeAsFileTime(&utc);
   FileTimeToSystemTime(&end);

   if (end.wYear > start.wYear || (end.wYear == start.wYear && end.wDayOfYear > start.wDayOfYear)) {
        // Handle the case where the date changes during sleep
        return 0;
   }

  
   if (end < (start + usec)) {
      return (end - (start + usec)) / 1000;
   }

   return 0;
}

int isatty(int fd) {
   return _isatty(fd);
}

#endif /* _WIN32 */
