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

extern void* ViperStringDuplicate(cc* string);


#ifdef VIPER_USE_NAMESPACE

#define Calloc    ViperCalloc
#define Malloc    ViperMalloc
#define Realloc   ViperRealloc
#define Zalloc    ViperZalloc

#define Free            ViperFree
#define GetMemoryLeaks  ViperGetMemoryLeaks

#define StringDuplicate ViperStringDuplicate

#endif /* VIPER_USE_NAMESPACE */


#endif /* __header_viper_core_memory_allocator__ */
