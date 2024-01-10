#ifndef __header_viper_core_algorithm_dynamic_array__
#define __header_viper_core_algorithm_dynamic_array__

#include<viper/core/types/dynamic_array.h>

extern i8 ViperDynamicArrayExpand(ViperDynamicArray_t* array, u64 count);
extern i8 ViperDynamicArrayCreate(ViperDynamicArray_t* array, ViperStructType_t type, u64 size, u64 count);
extern void* ViperDynamicArrayGetItem(ViperDynamicArray_t* array, u64 index);
extern i8 ViperDynamicArrayInsertItem(ViperDynamicArray_t* array, u64 index, void* item);
extern i8 ViperDynamicArrayInsertItems(ViperDynamicArray_t* array, u64 index, u64 count, ...);
extern i8 ViperDynamicArrayClearItem(ViperDynamicArray_t* array, u64 index);
extern i8 ViperDynamicArrayDelete(ViperDynamicArray_t* array);

#endif /* __header_viper_core_algorithm_dynamic_array__ */
