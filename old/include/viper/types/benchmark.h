#ifndef __header_viper_benchmark_types__
#define __header_viper_benchmark_types__

#include<stdatomic.h>
#include<viper/types/typedefs.h>
#include<viper/types/structs.h>

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;
   
   int64_t nanoSeconds;
   int64_t microSeconds;
   int64_t seconds;
} ViperBenchmark_t;

#endif /* __header_viper_benchmark_types__ */
