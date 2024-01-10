#ifndef __header_viper_images_types__
#define __header_viper_images_types__

#include "viper/types/typedefs.h"
#include <stdatomic.h>
#include<viper/types/structs.h>
#include<viper/types/str.h>
#include<viper/types/memory.h>
#include<viper/types/math.h>

enum {
	VIPER_IMAGE_NULLPTR_HEADER = -2,
	VIPER_IMAGE_UNKOWN_HEADER = -1,
	VIPER_IMAGE_PNG_HEADER,
	VIPER_IMAGE_JPG_HEADER,
	VIPER_IMAGE_PPM_HEADER,
};

enum {
	VIPER_COLOR_FORMAT_MONO,
	VIPER_COLOR_FORMAT_GRAYSCALE,
	VIPER_COLOR_FORMAT_RGB,
	VIPER_COLOR_FORMAT_PMS,
	VIPER_COLOR_FORMAT_RGBA,
	VIPER_COLOR_FORMAT_CMYK,
};

typedef struct {
	ViperStructType_t sType;
	atomic_flag* lock;
	uint64_t color;
} ViperColorFormat_t;

typedef struct {
	ViperStructType_t sType;
	atomic_flag* lock;

	ViperString_t path;
	ViperColorFormat_t colorFormat;
	ViperResultion2_t resultion;
	ViperBuffer_t buffer;
} ViperImage_t;

#pragma pack(push,1)

typedef struct {
	ViperStructType_t sType;
	atomic_flag* lock;

	struct {
		int16_t magicNumber;
	} data;
} ViperImageHeaderPPM;
#pragma pack(pop)

#endif /* __header_viper_images_types__ */
