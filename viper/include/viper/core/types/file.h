#ifndef __header_viper_core_types_file__
#define __header_viper_core_types_file__

#include<viper/core/types/defines.h>
#include<viper/core/types/buffer.h>

#define VIPER_FILE_FLAG_OPEN        0x0001
#define VIPER_FILE_FLAG_LOADED      0x0002
#define VIPER_FILE_FLAG_SYSTEM      0x0004

typedef struct {
   ViperStructType_t sType;

   u64 flags;
   i64 fd;
   cc* name;
  
   ViperBuffer_t buffer;
} ViperFile_t;

#endif /* __header_viper_core_types_file__ */
