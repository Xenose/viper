#include "viper/types/consts.h"
#include "viper/types/images.h"
#include "viper/types/memory.h"
#include "viper/utils/integer.h"
#include "viper/utils/stringer.h"
#include<viper/images/ppm.h>

#include<stdio.h>

/**
 * This function takes a valid P6 ppm raw file and returns it as a ViperImage_t,
 * the function calling this function must check that the image has a valid P6
 * magic header.
 *
 * @param image :: Is the output varible.
 * @param data :: Is the raw data for the image.
 *
 * @return 0 is success and -1 is faliure.
 */
int8_t ViperImageDecodePPM6(ViperImage_t* image, ViperBuffer_t const* data) {
	int8_t headerCount = 0;
	int64_t colorRange = 255;
	char* out = NULL;
	double normal = 0;

	union {
		char* current;
		uint8_t* c8;
		uint16_t* c16;
		uint32_t* c32;
		uint64_t* c64;
	} ptr;

	ptr.current = ViperFindNextChar(data->str + 2);

	while (data->bytes > (ptr.current - data->str)) {
		if (3 > headerCount) {
			// skipping comments
			if ('#' == ptr.current[0]) {
				ptr.current = ViperSkipLine(ptr.current);
				continue;
			}

			switch (headerCount) {
				case 0:
					image->resultion.x = ViperAtoi(ptr.current);
					ptr.current += ViperIntegerStringLength(image->resultion.x, 10) + 1;
					break;
				case 1:
					image->resultion.y = ViperAtoi(ptr.current);
					ptr.current += ViperIntegerStringLength(image->resultion.y, 10) + 1;
					break;
				case 2:
					colorRange = ViperAtoi(ptr.current);
					ptr.current += ViperIntegerStringLength(colorRange, 10) + 1;
					image->buffer.bytes = 3 * image->resultion.x * image->resultion.y;
					image->buffer.ptr = calloc(1, image->buffer.bytes);
					out = image->buffer.str;
					break;
			}

			ptr.current = ViperFindNextChar(ptr.current);
			headerCount++;
			continue;
		}

		if (255 == colorRange) {
			out[0] = ptr.current[0];
			ptr.current++;
		} else {
			if (VIPER_INT_MAX_U8 >= colorRange) {
				normal = ((double)ptr.c8[0] / (double)colorRange);
				out[0] = (int)(255.0 * normal);
				ptr.c8++;
			} else if (VIPER_INT_MAX_U16 >= colorRange) {
				normal = ((double)ptr.c16[0] / (double)colorRange);
				out[0] = (int)(255.0 * normal);
				ptr.c16++;
			} else if (VIPER_INT_MAX_U32 >= colorRange) {
				normal = ((double)ptr.c32[0] / (double)colorRange);
				out[0] = (int)(255.0 * normal);
				ptr.c32++;
			} else if (VIPER_INT_MAX_U64 >= colorRange) {
				normal = ((double)ptr.c64[0] / (double)colorRange);
				out[0] = (int)(255.0 * normal);
				ptr.c64++;
			}
		}
		out++;
	}

	return 0;
}

ViperBuffer_t* ViperImageEncodePPM6(ViperImage_t const* image) {
	int64_t dataSize = 0;
	char* current = NULL;
	const char* magick = "P6\n";
	const char* message = "# Encoded with viper game engine\n";
	ViperBuffer_t* out = calloc(1, sizeof(ViperBuffer_t));

	dataSize += ViperIntegerStringLength(image->resultion.x, 10) + 2;
	dataSize += ViperIntegerStringLength(image->resultion.y, 10) + 2;
	dataSize += ViperIntegerStringLength(255, 10) + 2;

	dataSize += strlen(magick);
	dataSize += strlen(message);
	dataSize += image->buffer.bytes;

	current = out->ptr = calloc(1, dataSize + 1);
	out->bytes = dataSize;

	current = stpcpy(current, magick);
	current = stpcpy(current, message);

	current += ViperItoa(image->resultion.x, current, dataSize + (out->str - current), 10) - 1;
	current = stpcpy(current, " ");

	current += ViperItoa(image->resultion.y, current, dataSize + (out->str - current), 10) - 1;
	current = stpcpy(current, "\n");

	current += ViperItoa(255, current, dataSize + (out->str - current), 10) - 1;
	current = stpcpy(current, "\n");

	memcpy(current, image->buffer.ptr, image->buffer.bytes);

	return out;
}
