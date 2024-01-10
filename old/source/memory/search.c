#include<viper/memory/search.h>

#include<stdio.h>
#include<string.h>

/**
 * This function is used to find the largest duplicated space
 * within the limitations of the maxLength varible.
 *
 * @param start		:: This varrible is where the function will start.
 * @param current		:: Where the look for the bytes are happning.
 * @param end			:: The end of the data block.
 * @param maxLength	:: Is the max length of the lookup window. 
 *
 * @retuurn 0 if there is no match or the lenght of the match.
 */
int64_t ViperMemoryFindLongstMatchFromStart(int8_t* start, int8_t* current, int8_t* end, int64_t maxLength) {
	int length = end - current;

	if (end == current) {
		return 0;
	}

	for (int i = maxLength > length ? length : maxLength; i > 0; i--) {
		if (0 == memcmp(start, current, i)) {
			return i;
		}
	}

	return 0;
}

/**
 * This function is used to find the largest duplicated space
 * within the limitations of the maxLength varible.
 *
 * @param end			:: This varrible is where the function will start.
 * @param current		:: Where the look for the bytes are happning.
 * @param start		:: The end of the data block.
 * @param maxLength	:: Is the max length of the lookup window. 
 *
 * @retuurn 0 if there is no match or the lenght of the match.
 */
int64_t ViperMemoryFindLongestMatchFromEnd(int8_t* end, int8_t* current, int8_t* start, int64_t maxLength) {
	int length = current - start;

	if (start == current) {
		return 0;
	}

	for (int i = maxLength > length ? length : maxLength; i > 0; i--) {
		if (0 == memcmp(end, current - i, i)) {
			return i;
		}
	}

	return 0;
}
