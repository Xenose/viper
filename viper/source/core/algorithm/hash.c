#include<string.h>

#include<viper/core/algorithm/hash.h>

u64 ViperHashSimpleLength(u64 size, cc* string, u64 length) {
   u64 hash = 0;

   for (int i = 0; i < length; i++) {
      hash += string[i] << i;
   }

   return hash % size;
}

u64 ViperHashSimple(u64 size, cc* string) {
   return ViperHashSimpleLength(size, string, strlen(string));
}
