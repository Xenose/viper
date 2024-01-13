#ifndef __header_viper_core_types_buffer__
#define __header_viper_core_types_buffer__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

typedef struct {
   ViperStructType_t sType;

   i64 bytes;

   union {
      void* ptr;
      u8* data;
      char* str;
   };
} ViperBuffer_t;

#endif /* __header_viper_core_types_buffer__ */
