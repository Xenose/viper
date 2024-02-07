#define _POSIX_SOURCE
#define _GNU_SOURCE
#include<sys/mman.h>
#include<string.h>
#include<unistd.h>
#include<stdlib.h>
#include<viper/core/io/printer.h>
#include<viper/core/debug/logger.h>

#include<viper/core/memory/allocator.h>

static au64 __allocationCount = 0;
static atomic_flag __locked;

inline void* ViperCalloc(u64 count, u64 bytes) {
   void* ptr = NULL;


   if (0 < bytes) {
      while (atomic_flag_test_and_set(&__locked));
      ptr = calloc(count, bytes);
      atomic_flag_clear(&__locked);

      ++__allocationCount;
   }


   return ptr;
}

inline void* ViperMalloc(u64 bytes) {
   void* ptr = NULL;

   if (0 < bytes) {
      while (atomic_flag_test_and_set(&__locked));
      ptr = malloc(bytes);
      atomic_flag_clear(&__locked);
      
      ++__allocationCount;
   } else  ViperLogDebug("0 bytes given");

   return ptr;
}

inline void* ViperRealloc(void* ptr, u64 bytes) {
   if (0 < bytes) {
      while (atomic_flag_test_and_set(&__locked));
      ptr = realloc(ptr, bytes);
      atomic_flag_clear(&__locked);
      
      ++__allocationCount;
   }

   return ptr;
}

inline void* ViperZalloc(u64 bytes) {
   void* ptr = NULL;

   if (0 < bytes) {
      while (atomic_flag_test_and_set(&__locked));
      ptr = malloc(bytes);
      atomic_flag_clear(&__locked);
      
      memset(ptr, 0, bytes);
      ++__allocationCount;
   }

   return ptr;
}

inline void* ViperStringDuplicate(cc* string) {
   void* ptr = NULL;

   while (atomic_flag_test_and_set(&__locked));
   ptr = strdup(string);
   atomic_flag_clear(&__locked);

   if (NULL != ptr) {
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
