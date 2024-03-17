#ifndef __header_viper_core_terminal_parser__
#define __header_viper_core_terminal_parser__

#include<viper/core/types/defines.h>
#include<viper/core/types/application.h>
#include<viper/core/types/terminal.h>

//extern i8 ViperInternalCommandParser(ViperApplication_t* app, int arc, char* const* arv);

extern i8 ViperCommandAdd(ViperCommands_t* restrict com, cc singleChar, cc* restrict command, cc* restrict description, i64 (func)(void*), void* ptr);
extern i8 ViperCommandRead(ViperCommands_t* com, u64 argc, cc** args);

#endif /* __header_viper_core_terminal_parser__ */
