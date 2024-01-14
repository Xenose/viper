#ifndef __header_viper_core_types_dynamic_library__
#define __header_viper_core_types_dynamic_library__

#include<viper/core/types/defines.h>

typedef struct {
   ViperStructType_t sType;
   void* _handle;
   const char* libName;
} ViperGenericDynamicLibrary_t;

#endif /* __header_viper_core_types_dynamic_library__ */
