#ifndef __header_viper_core_platform_limits__
#define __header_viper_core_platform_limits__

#ifndef _WIN32
   #include<linux/limits.h>
#else
	#define PATH_MAX 32767
	#define NAME_MAX 255
#endif

#endif /* __header_viper_core_platform_limits__ */
