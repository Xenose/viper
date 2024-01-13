#include<viper/api/image/image.h>
#include<viper/core/file/format.h>
#include<viper/core/image/jpeg.h>
#include<viper/core/debug/logger.h>


i64 ViperImageDecode(ViperImage_t* restrict image, ViperBuffer_t* restrict input) {
   switch (ViperFileGetFormat(input)) {
      case VIPER_FILE_TYPE_IMAGE_JPEG:
         return ViperImageJpegDecode(image, input);
   }

   ViperLogError("Failed to fined format for data");
   return -1;
}

i64 ViperImageEncode(ViperImage_t* restrict image, ViperBuffer_t* restrict output) {
   return 0;
}
