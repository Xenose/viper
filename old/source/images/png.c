#include<stdlib.h>

#include<viper/types/file.h>
#include<viper/types/images.h>
#include<viper/images/png.h>

ViperImage_t* ViperImageDecompressPNG(const ViperFile_t* file) {
	ViperImage_t* image = calloc(1, sizeof(ViperImage_t));
	return image;
}
