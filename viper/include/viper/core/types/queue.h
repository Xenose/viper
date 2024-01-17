#ifndef __header_viper_core_types_queue__
#define __header_viper_core_types_queue__

#include<viper/core/types/defines.h>
#include<viper/core/types/dynamic_array.h>

typedef struct {
   ViperStructType_t sType;
   i64 insertIndex;
   i64 currentIndex;
	i64 count;
   ViperDynamicArray_t data;
} ViperQueue_t;

#endif /* __header_viper_core_types_queue__ */
