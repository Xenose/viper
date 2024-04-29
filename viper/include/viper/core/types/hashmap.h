#ifndef __header_viper_core_types_hashmap__
#define __header_viper_core_types_hashmap__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>
#include<viper/core/types/buffer.h>
#include<viper/core/types/dynamic_array.h>

typedef struct {
   ViperBuffer_t key;
   void* ptr;
} ViperHashmapItem_t;

typedef struct {
   ViperStructType_t sType;
   ViperStructType_t storedType;

   u64 count;
   u64 size;
   u64 resize;
   ViperHashmapItem_t* data;
} ViperHashmap_t;

typedef struct {
} ViperGenericHashmapItem_t;

typedef struct {
   ViperStructType_t sType;

   u64 count;
   u64 resize;
   ViperGenericHashmapItem_t* data;
} viperGenericHashmap_t;

#endif /* __header_viper_core_types_hashmap__ */
