#ifndef __header_stringer__
#define __header_stringer__

#include<viper/types.h>
#include<viper/debug/logger.h>

extern int64_t ViperStringCreate(ViperString_t* out, const char* str);
extern void* ViperStringDelete(ViperString_t* str);
extern char* ViperFindNextChar(char* data);
extern char* ViperFindNonNumeric(char* buffer);
extern char* ViperSkipLine(char* buffer);
#endif /* __header_stringer__ */
