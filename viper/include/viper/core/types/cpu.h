#ifndef __header_viper_types_cpu__
#define __header_viper_types_cpu__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

enum {
   VIPER_CPU_VENDOR_UNKOWN,
   VIPER_CPU_VENDOR_AMD,
   VIPER_CPU_VENDOR_ARM,
   VIPER_CPU_VENDOR_CYRIX,
   VIPER_CPU_VENDOR_INTEL,
};

typedef struct {
   ViperStructType_t sType;

   u64 vendor;

   struct {
      u8 fpu  : 1;
      u8 avx  : 1;
      u8 avx2 : 1;
   } support;

} ViperCpuSpec_t;

#endif /* __header_viper_types_cpu__ */
