#ifndef __header_viper_api_image_image__
#define __header_viper_api_image_image__

#include<viper/core/types/defines.h>
#include<viper/core/types/buffer.h>
#include<viper/core/types/enums.h>
#include<viper/core/types/image.h>

extern i64 ViperImageDecode(ViperImage_t* restrict image, ViperBuffer_t* restrict input);
extern i64 ViperImageEncode(ViperImage_t* restrict image, ViperBuffer_t* restrict output);

#endif /* __header_viper_api_image_image__ */
