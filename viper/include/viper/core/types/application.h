#ifndef __header_viper_core_types_application__
#define __header_viper_core_types_application__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

typedef struct {
} ViperApplicationCreateInfo_t;

typedef struct {
   // the type of the struct
   ViperStructType_t sType;
   // the command line argc, provided before setup
   int argc;
   // the command line argv, provided before setup
   char* const* argv;

   au16 state;
} ViperApplication_t;

#endif /* __header_viper_core_types_application__ */
