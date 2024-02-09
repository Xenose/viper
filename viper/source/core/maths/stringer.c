#include<viper/core/maths/stringer.h>


#include<stdlib.h>
#include<math.h>
#include<stdio.h>
#include<viper/core/debug/benchmark.h>
#include<viper/core/maths/basic.h>

static const char __viperNumberTable[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
static const i64 __viperNumberTableSize = sizeof(__viperNumberTable) / sizeof(__viperNumberTable[0]);

i64 ViperUtoa(u64 value, char* restrict buffer, u64 size, i64 base) {
   u64 temporarius; // temporary varible
   u64 i = 0; // the index fpr loops
   u64 j = 0; // the buffer index
   u64 trahens = 0; // reminder(latin)
   u64 pw = 0;
   
   if (NULL == buffer) {
      goto ERROR_EXIT;
   }

   trahens = ViperIntLog(base, value);
   pw = ViperIntLog(base, trahens);

   if (__viperNumberTableSize < base || size < trahens) {
      goto ERROR_EXIT;
   }

   if (0 == pw) {
      // execute with singal digit values
      buffer[j++] = __viperNumberTable[value];
   } else while (i++ <= trahens) {
      // converts the number into a string
      temporarius = value / pw;
      value -= temporarius * pw;
      buffer[j++] = __viperNumberTable[temporarius];
      pw /= base;
   }

   return j;
ERROR_EXIT:
   return -1;
}


i64 ViperItoa(i64 value, char* restrict buffer, u64 size, i64 base) {
   u64 temporarius; // temporary varible
   u64 i = 0; // the index fpr loops
   u64 j = 0; // the buffer index
   i64 trahens = 0; // reminder(latin)
   u64 pw = 0;

   if (NULL == buffer) {
      goto ERROR_EXIT;
   }
  
   if (0 > value) {
      // we need to check if the value is negative
      buffer[j++] = '-';
      value = labs(value);
   }

   trahens += ViperIntLog(base, value);

   pw = ViperIntPower(base, trahens);

   if (__viperNumberTableSize < base || size < trahens) {
      goto ERROR_EXIT;
   }
   
   if (0 == pw) {
      // execute with singal digit values
      buffer[j++] = __viperNumberTable[value];
   } else while (i++ <= trahens) {
      // converts the number into a string
      temporarius = value / pw;
      value -= temporarius * pw;
      buffer[j++] = __viperNumberTable[temporarius];
      pw /= base;
   }

   return j + 1;
ERROR_EXIT:
   return -1;
}
