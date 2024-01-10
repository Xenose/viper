#include<string.h>
#include<viper/core/memory/utils.h>

/*static void* __avx_ViperMemoryCopy(void* restrict dst, void* restrict const src, u64 bytes) {
   return NULL;
}

static void* __avx2_ViperMemoryCopy(void* restrict dst, void* restrict const src, u64 bytes) {
   u64 reminder = bytes % 256;
   u64 times = bytes / 256;
   u64 i = 0;

   while (i <= times) {
      _mm256_store_si256(&((__m256i*)dst)[i], ((__m256i*)src)[i]);
      ++i;
   }

   return __basic_ViperMemoryCopy(
         (void*)&(((__m256i*)dst)[i]),
         (void*)&(((__m256i*)src)[i]),
         reminder
      ); 
}*/

inline void* ViperMemoryCopy(void* restrict dst, void* restrict const src, u64 bytes) {
   return memcpy(dst, src, bytes);
}

inline void* ViperMemoryCopy16(void* restrict dst, void* restrict const src, u64 bytes) {
   u64 reminder = bytes % 16;
   u64 times = bytes / 16;
   u64 i = 0;

   for (;i <= times; i++) {
      ((u16*)dst)[i] = ((u16*)src)[i];
   }

   return ViperMemoryCopy(&((u16*)dst)[i], &((u16*)src)[i], reminder);
}

inline void* ViperMemoryCopy32(void* restrict dst, void* restrict const src, u64 bytes) {
   u64 reminder = bytes % 32;
   u64 times = bytes / 32;
   u64 i = 0;

   for (;i <= times; i++) {
      ((u32*)dst)[i] = ((u32*)src)[i];
   }

   return ViperMemoryCopy(&((u32*)dst)[i], &((u32*)src)[i], reminder);
}

inline void* ViperMemoryCopy64(void* restrict dst, void* restrict const src, u64 bytes) {
   u64 reminder = bytes % 64;
   u64 times = bytes / 64;
   u64 i = 0;

   for (;i <= times; i++) {
      ((u64*)dst)[i] = ((u64*)src)[i];
   }

   return ViperMemoryCopy(&((u64*)dst)[i], &((u64*)src)[i], reminder);
}

inline void* ViperMemoryCopy128(void* restrict dst, void* restrict const src, u64 bytes) {
   u64 reminder = bytes % 128;
   u64 times = bytes / 128;
   u64 i = 0;

   for (;i <= times; i++) {
      ((u128*)dst)[i] = ((u128*)src)[i];
   }

   return ViperMemoryCopy(&((u128*)dst)[i], &((u128*)src)[i], reminder);
}
