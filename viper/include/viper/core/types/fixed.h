#ifndef __header_viper_core_types_float__
#define __header_viper_core_types_float__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

typedef struct {
   ViperStructType_t sType;
   u8 negative : 1;
   u64 real : 63;
   u64 decimal;
} ViperFixed64_t;

#endif /* __header_viper_core_types_float__ */
