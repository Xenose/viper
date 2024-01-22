#include<stdio.h>
#include<errno.h>
#include<openjpeg-2.5/openjpeg.h>
#include<viper/core/image/jpeg2k.h>
#include<viper/core/debug/logger.h>

i8 DecodeJpeg2k(ViperImage_t* restrict image, ViperBuffer_t* restrict buffer) {
   opj_codec_t* codec = NULL;
   opj_image_t* info = NULL;
   opj_stream_t* stream =  NULL;
   FILE* fmem = NULL;

   if (NULL == (fmem = fmemopen(buffer->ptr, buffer->bytes, "rb"))) {
      ViperLogWarning("fmemopen [ %e ]", errno);
      return -1;
   }

   opj_setup_decoder(codec, NULL);

   return 0;
}
