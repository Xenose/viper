#ifndef __header_viper_ppm_images__
#define __header_viper_ppm_images__

#include<stdint.h>
#include<viper/types/memory.h>
#include<viper/types/images.h>

extern int8_t ViperImageDecodePPM6(ViperImage_t* image, ViperBuffer_t const* data);
extern ViperBuffer_t* ViperImageEncodePPM6(ViperImage_t const* image);

#endif /* __header_viper_ppm_images__ */
