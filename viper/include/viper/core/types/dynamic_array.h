#ifndef __header_viper_core_types_dynamic_array__
#define __header_viper_core_types_dynamic_array__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

typedef struct {
   ViperStructType_t sType;
   ViperStructType_t storedType;

   u64 count;
   u64 size;
   void* ptr;
} ViperDynamicArray_t;

#endif /* __header_viper_core_types_dynamic_array__ */
