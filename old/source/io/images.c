#include "viper/types/images.h"
#include "viper/io/file.h"
#include "viper/types/file.h"
#include<viper/debug/logger.h>
#include<viper/io/images.h>
#include<stdio.h>
#include<string.h>

const static uint8_t __jpg[] = { 0xFF, 0xD8, 0xFF };
const static uint8_t __png[] = { 137, 80, 78, 71, 13, 10, 26, 10 };
const static uint8_t __ppm[] = { 0x50, 0x36 };
//const static uint8_t __png[] = { 10, 26, 10, 13, 71, 78, 80, 137 };

/**
 * This function takes a image files and try to find
 * the type that the iamge is encoded in.
 *
 * @param h :: the magic/header bytes.
 * @return Returns the image type.
 *
 * @note this function have no length restriction so ensure that \
 * the file is at least longer then the JPG magic bytes.
 */
int64_t ViperImageFindType(uint8_t* h) {
	int64_t out = VIPER_IMAGE_UNKOWN_HEADER;

	if (NULL == h) {
		out = VIPER_IMAGE_NULLPTR_HEADER;
		goto EXIT;
	}
		
	switch (h[0]) {
		case 0x50:
			if (!memcmp(h, __ppm, 2)) {
				out = VIPER_IMAGE_PPM_HEADER;
			}
			break;
		case 0xFF:
			if (!memcmp(h, __jpg, 3)) {
				out = VIPER_IMAGE_JPG_HEADER;
			}
			break;
		case 137:
			if (!memcmp(h, __png, 8)) {
				out = VIPER_IMAGE_PNG_HEADER;
			}
			break;
	}

EXIT:
	return out;
}

ViperImage_t* ViperImageLoad(const char* path) {
	ViperFile_t* file = NULL;
	ViperImage_t* image = calloc(1, sizeof(ViperImage_t));

	if (NULL == image) {
		ViperLogEmergancy("Failed allocate memory for ViperImage_t struct");
		goto ERROR_EXIT;
	}

	if (NULL == (file = ViperLoadFile(path))) {
		ViperLogError("Failed to find file [ %s ]", path);
		goto ERROR_EXIT;
	}

	switch (ViperImageFindType(file->buffer.ptr)) {
		case VIPER_IMAGE_JPG_HEADER:
			ViperLogDebug("Found a jpg image");
			break;
		case VIPER_IMAGE_PNG_HEADER:
			ViperLogDebug("Found a png image");
			break;
		case VIPER_IMAGE_PPM_HEADER:
			ViperLogDebug("Found a ppm image");
			break;
	}

	if (NULL != ViperUnloadFile(file)) {
		ViperLogWarning("Failed to unload file [ %s ]", path);
	}
	return image;
ERROR_EXIT:
	return NULL;
}
