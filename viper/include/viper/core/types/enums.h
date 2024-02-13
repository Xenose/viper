#ifndef __header_viper_core_types_enums__
#define __header_viper_core_types_enums__

enum {
   VIPER_APP_STATE_STOPPED,
   VIPER_APP_STATE_RUNNING,
   VIPER_APP_STATE_HALTING,
   VIPER_APP_STATE_PAUSED,
};

enum {
   VIPER_STRUCT_TYPE_UNKNOWN,
   VIPER_STRUCT_TYPE_APPLICATION,
   VIPER_STRUCT_TYPE_DYNAMIC_ARRAY,
   VIPER_STRUCT_TYPE_DYNAMIC_HASHMAP,
   VIPER_STRUCT_TYPE_STATIC_HASHMAP,
};

enum {
   // Special values
   VIPER_FILE_TYPE_UNKNOWN,

   // Scripts
   VIPER_FILE_TYPE_SCRIPT,

   // Images
   VIPER_FILE_TYPE_IMAGE_AVIF,
   VIPER_FILE_TYPE_IMAGE_BMP,
   VIPER_FILE_TYPE_IMAGE_CGM,
   VIPER_FILE_TYPE_IMAGE_GIF,
   VIPER_FILE_TYPE_IMAGE_HEIF,
   VIPER_FILE_TYPE_IMAGE_JPEG,
   VIPER_FILE_TYPE_IMAGE_JPEG2K,
   VIPER_FILE_TYPE_IMAGE_JPEG_XL,
   VIPER_FILE_TYPE_IMAGE_TIFF,
   VIPER_FILE_TYPE_IMAGE_SVG,
   VIPER_FILE_TYPE_IMAGE_PBM,
   VIPER_FILE_TYPE_IMAGE_PGM,
   VIPER_FILE_TYPE_IMAGE_PNG,
   VIPER_FILE_TYPE_IMAGE_PNM,
   VIPER_FILE_TYPE_IMAGE_PPM,
   VIPER_FILE_TYPE_IMAGE_WEBP,
};

#endif /* __header_viper_core_types_enums__ */
