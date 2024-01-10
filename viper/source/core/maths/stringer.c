#include<viper/core/maths/stringer.h>


#include<stdlib.h>
#include<math.h>
#include<stdio.h>

static const char __viperNumberTable[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
static const i64 __viperNumberTableSize = sizeof(__viperNumberTable) / sizeof(__viperNumberTable[0]);

// log10 x = 1000 result 3
// log10 x = 100  result 4
// log5  x = 1000 result 6

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
