#ifndef __header_viper_core_terminal_parser__
#define __header_viper_core_terminal_parser__

#include<viper/core/types/defines.h>
#include<viper/core/types/application.h>
#include<viper/core/types/terminal.h>

/**
 */
extern i8 ViperCommandAdd(ViperCommands_t* restrict com, cc singleChar, cc* restrict command, cc* restrict description, i64 (func)(cc* opts, u64 count, void*), void* ptr);

/**
 * The ViperCommandDelete will free any data allocated inside the
 * ViperCommands_t struct it will not delete the struct itself.
 *
 * @param commands :: The data will be cleared from this struct.
 */
extern void ViperCommandDelete(ViperCommands_t* restrict commands);

/**
 */
extern i8 ViperCommandRead(ViperCommands_t* com, u64 argc, cc** args);

#endif /* __header_viper_core_terminal_parser__ */
