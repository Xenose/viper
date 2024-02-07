#include<stdlib.h>
#include<stdio.h>
#include<setjmp.h>
#include<jpeglib.h>
#include<string.h>
#include<errno.h>

#include<viper/core/image/jpeg.h>
#include<viper/core/debug/logger.h>
#include<viper/core/memory/allocator.h>

typedef struct {
   struct jpeg_error_mgr error;
   sigjmp_buf jmp;
} __ViperJpegUser;

static void __ViperImageJpegError(j_common_ptr ptr) {
   __ViperJpegUser* info = (__ViperJpegUser*)ptr;
   ViperLogWarning("Failed to decoded jpeg longjmp");
   siglongjmp(info->jmp, -1);
}

i8 ViperImageJpegDecode(ViperImage_t* restrict image, ViperBuffer_t* restrict input) {
   i8 returnCode = 0;
   i64 rowStride = 0;
   JSAMPARRAY buffer;
   __ViperJpegUser user = { 
      .error.error_exit = &__ViperImageJpegError,
   };

   struct jpeg_decompress_struct info = {
      .err = jpeg_std_error(&user.error),
   };

   // not the best use for non local goto's
   if (0 != sigsetjmp(user.jmp, 1)) {
      ViperLogWarning("Failed to decoded jpeg");
      returnCode = -1;
      goto ERROR_EXIT;
   }

   jpeg_create_decompress(&info);
   jpeg_mem_src(&info, input->ptr, input->length);
   jpeg_read_header(&info, TRUE);
   
   jpeg_start_decompress(&info);

   image->buffer.length = info.output_width * info.output_height * info.output_components;
   image->buffer.ptr = ViperMalloc(image->buffer.length);

   if (NULL == image->buffer.ptr) {
      ViperLogFatal("Malloc failed [ %e ]", errno);
      goto ERROR_EXIT;
   }

   rowStride = info.output_width * info.output_components;
   buffer = (*info.mem->alloc_sarray)((j_common_ptr)&info, JPOOL_IMAGE, rowStride, 1);

   for (int i = 0; info.output_scanline < info.output_height; i += rowStride) {
      jpeg_read_scanlines(&info, buffer, 1);
      memcpy(&image->buffer.data[i], buffer[0], rowStride);
   }

   jpeg_finish_decompress(&info);
   ViperLogDebug("File decoded");
   returnCode = image->buffer.length;
ERROR_EXIT:
   jpeg_destroy_decompress(&info);
   return returnCode;
}

i8 ViperImageJpegEncode() {
   return 0;
}
