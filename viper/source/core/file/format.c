#include<string.h>
#include<viper/core/file/format.h>
#include<viper/core/debug/logger.h>

static const u8 __viperScriptMagic[] = { 0x23, 0x21 };

static const u8 __viperJpegMagic01[] = { 0xFF, 0xD8, 0xFF, 0xE1, 0x87, 0x90, 0x45, 0x78, 0x69, 0x66, 0x00, 0x00 };
static const u8 __viperJpegMagic02[] = { 0xFF, 0xD8, 0xFF, 0xE0, 0x00, 0x10, 0x4A };
static const u8 __viperJpegMagic03[] = { 0xFF, 0xD8, 0xFF, 0xDB };
static const u8 __viperJpegMagic04[] = { 0xFF, 0xD8, 0xFF, 0xEE };

static const u8 __viperJpegMagic2k01[] = { 0x00, 0x00, 0x00, 0x0C, 0x6A, 0x50, 0x20, 0x20, 0x0D, 0x0A, 0x87, 0x0A };

static const u8 __viperPngMagic[] = { 0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A };

i64 ViperFileGetFormat(ViperBuffer_t* buffer) {
   if (0 >= buffer->bytes) {
      goto ERROR_EXIT;
   }

   switch (buffer->data[0]) {
      case 0x00:
         if (memcmp(&buffer->data[1], &__viperJpegMagic2k01[1], 11)) return VIPER_FILE_TYPE_IMAGE_JPEG2K;
         break;
      case 0x23:
         if (memcmp(&buffer->data[1], &__viperScriptMagic[1], 1))    return VIPER_FILE_TYPE_SCRIPT;
         break;
      case 0x89:
         if (memcmp(&buffer->data[1], &__viperPngMagic[1], 7))       return VIPER_FILE_TYPE_IMAGE_PNG;
         break;
      case 0xFF:
         if (memcmp(&buffer->data[1], &__viperJpegMagic01[1], 11))   return VIPER_FILE_TYPE_IMAGE_JPEG;
         if (memcmp(&buffer->data[1], &__viperJpegMagic02[1], 6))    return VIPER_FILE_TYPE_IMAGE_JPEG;
         if (memcmp(&buffer->data[1], &__viperJpegMagic03[1], 3))    return VIPER_FILE_TYPE_IMAGE_JPEG;
         if (memcmp(&buffer->data[1], &__viperJpegMagic04[1], 3))    return VIPER_FILE_TYPE_IMAGE_JPEG;
         break;
   }

   ViperLogError("No format found");
ERROR_EXIT:
   return VIPER_FILE_TYPE_UNKNOWN;
}
