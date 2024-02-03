#ifndef __header_viper_core_debug_benchmark__
#define __header_viper_core_debug_benchmark__

#include<viper/core/types/benchmark.h>

#define ViperBenchmark(bench, code) ViperBenchmarkStart(bench); { code; } ViperBenchmarkStop(bench)
#define ViperBenchmarkPrint(bench, text, code) ViperBenchmark(bench, (code)); \
   printf(text " :: %li seconds %li micro %li nano\n", (bench)->seconds, (bench)->secondsMicro, (bench)->secondsNano);

extern i8 ViperBenchmarkStart(ViperBenchmark_t* bench);
extern i8 ViperBenchmarkStop(ViperBenchmark_t* bench);

#endif /* __header_viper_core_debug_benchmark__ */
