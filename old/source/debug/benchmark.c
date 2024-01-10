#include<errno.h>
#include<stdint.h>
#include<time.h>
#include<viper/debug/benchmark.h>


int64_t ViperBenchmarkStart(ViperBenchmark_t* bench) {
   struct timespec t = { 0 };

   if (-1 == clock_gettime(CLOCK_MONOTONIC_RAW, &t)) {
      return errno;
   }

   bench->seconds = t.tv_sec;
   bench->nanoSeconds = t.tv_nsec;

   return 0;
}

int64_t ViperBenchmarkStop(ViperBenchmark_t* bench) {
   struct timespec t = { 0 };

   if (-1 == clock_gettime(CLOCK_MONOTONIC_RAW, &t)) {
      return errno;
   }

   bench->seconds = t.tv_sec - bench->seconds;
   bench->nanoSeconds = t.tv_nsec - bench->nanoSeconds;

   if (0 > bench->nanoSeconds) {
      bench->seconds--;
      bench->nanoSeconds += 1e9;
   }

   bench->microSeconds = bench->nanoSeconds / 1000;
   bench->nanoSeconds -= bench->microSeconds * 1000;

   return 0;
}
