#ifndef __header_viper_core_image_jpeg__
#define __header_viper_core_image_jpeg__

#include<viper/core/types/defines.h>
#include<viper/core/types/image.h>
#include<viper/core/types/buffer.h>

/**
 * This function takes a input Buffer_t containing the jpeg and parsers it into a
 * usable raw image format, this function will populate the data in image so its
 * recommended not to use this struct for anything before this function.
 *
 * @param image :: The output data will be loaded into this struct.
 * @param input :: The JPEG image that will be loaded into image.
 *
 * @return On success this function will return the number
 * of bytes for the uncompressed imange and on error this function
 * will return -1.
 */
extern i8 ViperImageJpegDecode(ViperImage_t* restrict image, ViperBuffer_t* restrict input);

#endif /* __header_viper_core_image_jpeg__ */
