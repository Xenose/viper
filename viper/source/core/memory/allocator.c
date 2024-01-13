#include<sys/mman.h>
#include<string.h>
#include<unistd.h>
#include<stdlib.h>
#include<viper/core/io/printer.h>
#include<viper/core/debug/logger.h>

#include<viper/core/memory/allocator.h>

static au64 __allocationCount = 0;

inline void* ViperCalloc(u64 count, u64 bytes) {
   void* ptr = NULL;

   if (0 < bytes) {
      ptr = calloc(count, bytes);
      ++__allocationCount;
   }

   return ptr;
}

inline void* ViperMalloc(u64 bytes) {
   void* ptr = NULL;

   if (0 < bytes) {
      ptr = malloc(bytes);
      ++__allocationCount;
   } else  ViperLogDebug("0 bytes given");

   return ptr;
}

inline void* ViperRealloc(void* ptr, u64 bytes) {
   if (0 < bytes) {
      ptr = realloc(ptr, bytes);
      ++__allocationCount;
   }

   return ptr;
}

inline void* ViperZalloc(u64 bytes) {
   void* ptr = NULL;

   if (0 < bytes) {
      ptr = malloc(bytes);
      memset(ptr, 0, bytes);
      ++__allocationCount;
   }

   return ptr;
}

inline void ViperFree(void* ptr) {
   if (NULL != ptr) {
      free(ptr);
      --__allocationCount;
   }
}

inline u64 ViperGetMemoryLeaks() {
   return __allocationCount;
}
