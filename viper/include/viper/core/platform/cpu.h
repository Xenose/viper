#ifndef __header_viper_core_platform_cpu__
#define __header_viper_core_platform_cpu__

#include<viper/core/types/cpu.h>

/**
 * Will use system specific functions/files to load the
 * current systems spec into the spec struct.
 *
 * @return Returns 0 on success and -1 on error.
 */
extern i8 ViperCpuGetSpecs(ViperCpuSpec_t* spec);

#endif /* __header_viper_core_platform_cpu__ */
