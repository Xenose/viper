#ifndef __header_viper_winux_dlfcn__
#define __header_viper_winux_dlfcn__

#ifndef _WIN32
#include<dlfcn.h>
#else

#define RTLD_GLOBAL		0x0001
#define RTLD_LAZY		0x0002
#define RTLD_NOW		0x0004

#endif /* _WIN32 */

#endif /* __header_viper_winux_dlfcn__ */
