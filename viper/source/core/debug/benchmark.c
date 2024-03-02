#include<time.h>
#include<errno.h>
#include<viper/core/debug/benchmark.h>

#ifndef _WIN32

i8 ViperBenchmarkStart(ViperBenchmark_t* bench) {
   struct timespec t = { 0 };

   if (-1 == clock_gettime(CLOCK_MONOTONIC_RAW, &t)) {
      return errno;
   }

   bench->seconds = t.tv_sec;
   bench->secondsNano = t.tv_nsec;

   return 0;
}

i8 ViperBenchmarkStop(ViperBenchmark_t* bench) {
   struct timespec t = { 0 };

   if (-1 == clock_gettime(CLOCK_MONOTONIC_RAW, &t)) {
      return errno;
   }

   bench->seconds = t.tv_sec - bench->seconds;
   bench->secondsNano = t.tv_nsec - bench->secondsNano;

   if (0 > bench->secondsNano) {
      bench->seconds--;
      bench->secondsNano += 1e9;
   }

   bench->secondsMicro = bench->secondsNano / 1000;
   bench->secondsNano -= bench->secondsMicro * 1000;

   return 0;
}

# else // TODO fix windows version

i8 ViperBenchmarkStart(ViperBenchmark_t* bench) {
    return 0;
}

i8 ViperBenchmarkStop(ViperBenchmark_t* bench) {
    return 0;
}

#endif 