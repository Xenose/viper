#ifndef __header_viper_core_debug_benchmark__
#define __header_viper_core_debug_benchmark__

#include<stdio.h> // marked as unused, but its used by the macro

// Start of internal libraries
#include<viper/core/types/benchmark.h>

#define ViperBenchmark(bench, code) ViperBenchmarkStart(bench); { code; } ViperBenchmarkStop(bench)
#define ViperBenchmarkPrint(bench, text, code) ViperBenchmark(bench, (code)); \
   printf(text " :: %li seconds %li micro %li nano\n", (bench)->seconds, (bench)->secondsMicro, (bench)->secondsNano);

extern i8 ViperBenchmarkStart(ViperBenchmark_t* bench);
extern i8 ViperBenchmarkStop(ViperBenchmark_t* bench);

/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define Benchmark       ViperBenchmark
#define BenchmarkPrint  ViperBenchmarkPrint 

#define BenchmarkStart  ViperBenchmarkStart
#define BenchmarkStop   ViperBenchmarkStop

#endif /* VIPER_USE_NAMESPACE */

#endif /* __header_viper_core_debug_benchmark__ */
