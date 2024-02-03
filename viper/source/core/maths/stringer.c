#include<viper/core/maths/stringer.h>


#include<stdlib.h>
#include<math.h>
#include<stdio.h>
#include<viper/core/debug/benchmark.h>
#include<viper/core/maths/basic.h>

static const char __viperNumberTable[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
static const i64 __viperNumberTableSize = sizeof(__viperNumberTable) / sizeof(__viperNumberTable[0]);

// log10 x = 1000 result 3
// log10 x = 100  result 4
// log5  x = 1000 result 6

i64 ViperItoa(i64 value, char* restrict buffer, u64 size, i64 base) {
   u64 i = 0;
   u64 pw;
   u64 temporarius;
   i64 trahens = 0;

   if (NULL == buffer) {
      goto ERROR_EXIT;
   }
  
   if (0 > value) {
      buffer[i++] = '-';
      ++trahens;
      value = labs(value);
   }

   trahens += ViperIntLog(base, value);
   
   pw = ViperIntPower(base, trahens);

   if (value < base || __viperNumberTableSize < base || size < trahens) {
      goto ERROR_EXIT;
   }

   while (i <= trahens) {
      temporarius = value / pw;
      value -= temporarius * pw;
      buffer[i++] = __viperNumberTable[temporarius];
      pw /= base;
   }

   return trahens;
ERROR_EXIT:
   return -1;
}
