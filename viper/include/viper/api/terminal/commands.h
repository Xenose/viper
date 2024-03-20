#ifndef __header_viper_api_terminal_commands__
#define __header_viper_api_terminal_commands__

#include<viper/core/types/defines.h>
#include<viper/core/types/application.h>

extern i64 ViperTerminalCommandDryrun(cc* args, u64 count, void* ptr);

extern i64 ViperTerminalCommandUnitTest(cc* restrict args, u64 count, void* restrict ptr);

extern i64 ViperTerminalCommandEnableLogLevels(cc* restrict args, u64 count, void* restrict ptr);

extern i64 ViperTerminalCommandDisableLogLevels(cc* restrict args, u64 count, void* restrict ptr);

#endif /* __header_viper_api_terminal_commands__ */

