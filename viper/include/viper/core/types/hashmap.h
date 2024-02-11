#ifndef __header_viper_core_types_hashmap__
#define __header_viper_core_types_hashmap__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>
#include<viper/core/types/dynamic_array.h>

typedef struct {
   ViperStructType_t sType;

   u64 type; // the type of hashmap
   ViperDynamicArray_t* data;
} ViperHashmap_t;

#endif /* __header_viper_core_types_hashmap__ */
