#ifndef __header_viper_core_types_benchmark__
#define __header_viper_core_types_benchmark__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

typedef struct {
   ViperStructType_t sType;
   i64 seconds;
   i64 secondsMicro;
   i64 secondsNano;
} ViperBenchmark_t;

#endif /* __header_viper_core_types_benchmark__ */
