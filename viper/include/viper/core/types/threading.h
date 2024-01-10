#ifndef __header_viper_types_threading__
#define __header_viper_types_threading__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

typedef struct {
   ViperStructType_t sType;
} ViperThreadingWorker_t;

typedef struct {
   ViperStructType_t sType;
   
   i64 workCount;
   ViperThreadingWorker_t* work;
} ViperThreadingForeman_t;

#endif /* __threading_viper_types_threading__ */
