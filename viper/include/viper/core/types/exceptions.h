#ifndef __header_viper_core_types_exceptions__
#define __header_viper_core_types_exceptions__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

enum {
   VIPER_EXCEPTION_SIGSEGV = -1,
};

typedef struct {
   ViperStructType_t sType;
   i64 error;
} Exception_t;

#endif /* __header_viper_core_types_exceptions__ */
