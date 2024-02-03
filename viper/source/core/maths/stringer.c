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

static const double __viperLogBase[] = {
   0,
   0, // base 1
   0,
   0,
   0, // base 5
   0,
   0,
   0,
   0,
   1.0,
};

i64 ViperItoa(i64 value, char* buffer, u64 bufferSize, i64 base) {
   i64 ext = 1;

   if (0 == value) {
      *buffer = '0';
		++buffer;
      return 1;
   }

	if (0 > value) {
		buffer[0] = '-';
		++ext;
      ++buffer;
		value = labs(value);
	}

	// trahens is latin for trailing
	i64 trahens = logl(value) / logl(base);

	if (bufferSize - 1 < trahens) {
		goto ERROR_EXIT;
	}

   i64 p = pow(base, trahens);
	for (i64 i = trahens; 0 <= i; i--) {
		i64 temporarius = value - (value % p);

		*buffer = __viperNumberTable[temporarius / p];
		++buffer;
		value -= temporarius;
      p /= base;
	}

	return trahens + ext;
ERROR_EXIT:
	return -1;
}

i64 ViperItoa2(i64 value, char* restrict buffer, u64 size, i64 base) {
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
