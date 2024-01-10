#ifndef __header_viper_benchmark_debug__
#define __header_viper_benchmark_debug__

#include<stdint.h>
#include<viper/debug/logger.h>
#include<viper/types/benchmark.h>

#define ViperBenchmark(FUNC) { \
   ViperBenchmark_t __internal_bench = { 0 }; \
   ViperBenchmarkStart(&__internal_bench); \
   { FUNC; } \
   ViperBenchmarkStop(&__internal_bench); \
   ViperLogNotice("Benchmark %s [ %i sec ] [ %i micro ] [ %i nano ]", \
      #FUNC, __internal_bench.seconds, __internal_bench.microSeconds, __internal_bench.nanoSeconds); \
   }

extern int64_t ViperBenchmarkStart(ViperBenchmark_t* bench);
extern int64_t ViperBenchmarkStop(ViperBenchmark_t* bench);

#endif /* __header_viper_benchmark_debug__ */
