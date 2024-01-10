#include "viper/debug/logger.h"
#include "viper/utils/stringer.h"
#include<viper/utils/integer.h>
#include<viper/math/log.h>

#include<utils.h>
#include<stdio.h>
#include<math.h>

/**
 * _numberTable[] table is to help conversion into different bases
 * when printing strings
 */
const char _viperNumberTable[] = "0123456789ABCDEF";

/**
 * A simple function for getting the length of
 * a integer in string format.
 *
 * @param value :: The integer value to messure.
 * @param base :: The base of the return value.
 */
inline int64_t ViperIntegerStringLength(int64_t value, int32_t base) {
	return ViperLog(labs(value), base);
}

/**
 * The non standard itoa function is very useful but to be more cross
 * platform for no extra cost this is a simple implementation, it
 * use the _numberTable to find the correct charter.
 *
 * @param value :: is the value to be converted into a string
 * @param buffer :: is the buffer that will be used for the output
 * @param length :: is the length of the buffer
 * @param base :: is the base that the value will be returned in 2, 4, 8, 10 and so on.
 *
 * @return Is the length of the new string in int64_t format \
 *  and will return -1 if the function is had an error
 */
int64_t ViperItoa(int64_t value, char* restrict buffer, int64_t length, int32_t base) {
	int ext = 1;

	if (0 > value) {
		buffer[0] = '-';
		++ext;
      ++buffer;
		value = labs(value);
	}

	// trahens is latin for trailing
	int64_t trahens = ViperIntegerStringLength(value, base);

	if (length - 1 < trahens) {
		ViperLogError("Buffer is to small");
		goto ERROR_EXIT;
	}

   int64_t p = powl(base, trahens);
	for (int64_t i = trahens; 0 < i; i--) {
		int64_t temporarius = value - (value % p);

		*buffer = _viperNumberTable[temporarius / p];
		++buffer;
		value -= temporarius;
      p /= base;
	}

	buffer[0] = _viperNumberTable[value];
	buffer[1] = '\0';

	return trahens + ext;
ERROR_EXIT:
	return -1;
}

/**
 */
int64_t ViperAtoi(const char* buffer) {
	int64_t out = 0;
	int64_t index = 1;
	char* current = NULL;

	if ('-' == buffer[0]) {
		current = ViperFindNonNumeric((char*)buffer + 1) - 1;
	} else {
		current = ViperFindNonNumeric((char*)buffer) - 1;
	}

	if (buffer == current) {
		goto SKIP;
	}

	while(buffer < current && current[0] != '-') {
		out += (current[0] - '0') * index;
		index *= 10;
		current--;
	};

SKIP:
	if ('-' == current[0]) {
		out = -out;
	} else {
		out += (current[0] - '0') * index;
	}

	return out;
}
