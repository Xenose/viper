#include<string.h>
#include<stdio.h>

#include<viper/core/algorithm/hash.h>
#include<viper/core/maths/hashes.h>

u64 ViperHashSimpleLength(u64 size, cc* string, u64 length) {
   u64 hash = 0;

   for (u64 i = 0; i < length; i++) {
      hash += ViperHashBasicCalc(i, string[i]);
   }

   return hash % size;
}

u64 ViperHashSimple(u64 size, cc* string) {
   return ViperHashSimpleLength(size, string, strlen(string) + 1);
}
