#ifndef __header_viper_core_types_networking__
#define __header_viper_core_types_networking__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

typedef struct {
   ViperStructType_t sType;

   u64 flags;

   const char* host;
   const u64 hostLength;
} ViperSocketCreateInfo_t;

typedef struct {
   ViperStructType_t sType;
   int fd;
} ViperSocket_t;

#endif /* __header_viper_core_types_networking__ */
