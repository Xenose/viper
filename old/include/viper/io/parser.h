#ifndef __header_viper_parser_io__
#define __header_viper_parser_io__

#include<stdint.h>
#include<viper/types.h>

extern int8_t ViperAddParserOption(const char* longCommand, const char* shortCommand, char shortChar, int hasArg, int* flags, void (*function)(ViperConfig_t* config, void* customData), void* customData);
extern int8_t ViperParseCommands(int arc, char* const* arv, ViperConfig_t* config);

#endif /* __header_viper_parser_io__ */
