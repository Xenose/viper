#ifndef __header_viper_export_tools__
#define __header_viper_export_tools__

#ifndef __viper_internal__
	#define VIPER_EXPORT(func) viper_##func
#else
	#define VIPER_EXPORT(func) func
#endif

#endif /* __header_viper_export_tools__ */
