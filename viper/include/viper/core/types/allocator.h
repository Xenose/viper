#ifndef __header_viper_core_types_allocator__
#define __header_viper_core_types_allocator__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

#define VIPER_MEMORY_NODE_FLAG_IN_USE 0x00000001

typedef struct __ViperMemoryNode_t{
   struct __ViperMemoryNode_t* previous;
   struct __ViperMemoryNode_t* next;
   u64 flags;
   u64 bytes;

   union {
      void* ptr;
      u8* data;
   };
} ViperMemoryNode_t;

typedef struct {
   ViperStructType_t sType;
   au64 size;

   union {
      void* ptr;
      u8* data;
   };
} ViperMemoryMetadata_t;

typedef struct __ViperHeap_t {
   ViperStructType_t sType;
   struct __ViperHeap_t* next;
   u64 size;
   //u8* ptr;
} ViperMemoryHeap_t;

typedef struct {
   ViperStructType_t sType;
   atomic_flag locked;

   ViperMemoryMetadata_t metadata;
   
   au64 heapCount;
   ViperMemoryHeap_t* heaps;

   ViperMemoryNode_t* free;
   ViperMemoryNode_t* used;
} ViperAllocator_t;

#endif /* __header_viper_core_types_allocator__ */
