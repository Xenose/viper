#ifndef __header_viper_core_types_queue__
#define __header_viper_core_types_queue__

#include<viper/core/types/defines.h>
#include<viper/core/types/dynamic_array.h>

typedef struct {
	ViperStructType_t sType;
	u64 insertIndex;
	u64 currentIndex;
	u64 count;
	ViperDynamicArray_t data;
} ViperQueue_t;

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;
	ViperQueue_t queue;
} ViperAtomicQueue_t;

#endif /* __header_viper_core_types_queue__ */
