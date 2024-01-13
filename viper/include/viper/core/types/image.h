
#ifndef __header_viper_core_types_image__
#define __header_viper_core_types_image__

#include<viper/core/types/defines.h>
#include<viper/core/types/buffer.h>

typedef struct {
   ViperStructType_t sType;
   ViperBuffer_t buffer;
} ViperImage_t;

#endif /* __header_viper_core_types_image__ */
