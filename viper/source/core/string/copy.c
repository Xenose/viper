#include<smmintrin.h>
#include<immintrin.h>
#include<string.h>
#include<stdio.h>

#include<viper/core/types/defines.h>


char* __ViperStpnCpy128(char* restrict dst, cc* restrict src, unsigned long bytes) {
   u64 length = 0;
   u64 count = 0;
   u64 i = 0;

   if (NULL == src) {
      return NULL;
   }

   length = strnlen(src, bytes);
   count = length / 16;
   i = 0;

   for (; 0 != count; i += 16, --count) {
      __m128i data = _mm_loadu_si128((__m128i*)(src + i));
      _mm_storeu_si128((__m128i*)(&dst[i]), data);
   }

   for (; i < length; i++) {
      dst[i] = src[i];
   }

   return &dst[i];
}

char* __ViperStpnCpy256(char* restrict dst, const char* restrict src, unsigned long bytes) {
   u64 length = 0;
   u64 count = 0;
   u64 i = 0;

   if (NULL == src) {
      return NULL;
   }

   length = strnlen(src, bytes);
   count = length / 16;
   i = 0;

   for (; 0 != count; i += 32, --count) {
      __m256i data = _mm256_loadu_si256((__m256i*)(src + i));
      _mm256_storeu_si256((__m256i*)(&dst[i]), data);
   }

   count = (length - i) / 16;
   
   for (; 0 != count; i += 16, --count) {
      __m128i data = _mm_loadu_si128((__m128i*)(src + i));
      _mm_storeu_si128((__m128i*)(&dst[i]), data);
   }

   for (; i < length; i++) {
      dst[i] = src[i];
   }
   
   return &dst[i];
}

char* __ViperStpnCpy512(char* restrict dst, const char* restrict src, unsigned long bytes) {
   return NULL;
}

// public functions

char* (*ViperStpnCpy)(char* restrict dst, const char* restrict src, unsigned long bytes) = &__ViperStpnCpy128;

void ViperOptimizeStringFunctions() {
}
