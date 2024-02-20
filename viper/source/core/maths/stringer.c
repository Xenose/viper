#include<viper/core/maths/stringer.h>


#include<stdlib.h>
#include<math.h>
#include<stdio.h>
#include<viper/core/debug/benchmark.h>
#include<viper/core/maths/basic.h>
#include<viper/core/string/stringer.h>

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

i8 ViperAtou(u64* value, cc* restrict buffer, u64 lenght, u64 base) {
	char* bufferEnd = NULL;
	u64 pw = 1;
	*value = 0;

	bufferEnd = ViperStringFindNonNumeric(buffer, lenght, __viperNumberTable, base);

	 while (buffer != (--bufferEnd + 1)) {
		switch (*bufferEnd) {
			case '1': *value += 1  * pw; break;
			case '2': *value += 2  * pw; break;
			case '3': *value += 3  * pw; break;
			case '4': *value += 4  * pw; break;
			case '5': *value += 5  * pw; break;
			case '6': *value += 6  * pw; break;
			case '7': *value += 7  * pw; break;
			case '8': *value += 8  * pw; break;
			case '9': *value += 9  * pw; break;
			case 'A': *value += 10 * pw; break;
			case 'B': *value += 11 * pw; break;
			case 'C': *value += 12 * pw; break;
			case 'D': *value += 13 * pw; break;
			case 'E': *value += 14 * pw; break;
			case 'F': *value += 15 * pw; break;
			case 'G': *value += 16 * pw; break;
			case 'H': *value += 17 * pw; break;
			case 'I': *value += 18 * pw; break;
			case 'J': *value += 19 * pw; break;
			case 'K': *value += 20 * pw; break;
			case 'L': *value += 21 * pw; break;
			case 'M': *value += 22 * pw; break;
			case 'N': *value += 23 * pw; break;
			case 'O': *value += 24 * pw; break;
			case 'P': *value += 25 * pw; break;
			case 'Q': *value += 26 * pw; break;
			case 'R': *value += 27 * pw; break;
			case 'S': *value += 28 * pw; break;
			case 'T': *value += 29 * pw; break;
			case 'U': *value += 30 * pw; break;
			case 'V': *value += 31 * pw; break;
			case 'W': *value += 32 * pw; break;
			case 'X': *value += 33 * pw; break;
			case 'Y': *value += 34 * pw; break;
			case 'Z': *value += 35 * pw; break;
		}

		pw *= 10;
	}

	return 0;
}
