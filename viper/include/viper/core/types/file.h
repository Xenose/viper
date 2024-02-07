#ifndef __header_viper_core_types_file__
#define __header_viper_core_types_file__

#include<viper/core/types/defines.h>
#include<viper/core/types/buffer.h>


typedef struct {
   ViperStructType_t sType;

   int fd;
   const char* name;
  
   ViperBuffer_t buffer;
} ViperFile_t;

#endif /* __header_viper_core_types_file__ */
