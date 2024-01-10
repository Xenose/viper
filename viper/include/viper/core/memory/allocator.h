#ifndef __header_viper_core_memory_allocator__
#define __header_viper_core_memory_allocator__

#include<viper/core/types/defines.h>
#include<viper/core/types/allocator.h>

extern void* ViperCalloc(u64 count, u64 bytes);
extern void* ViperMalloc(u64 bytes);
extern void* ViperRealloc(void* ptr, u64 bytes);
extern void* ViperZalloc(u64 bytes);

extern void ViperFree(void* free);
extern u64 ViperGetMemoryLeaks();

#endif /* __header_viper_core_memory_allocator__ */
