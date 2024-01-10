#ifndef __header_integer_types__
#define __header_integer_types__

#include<viper/types.h>

extern int64_t ViperIntegerStringLength(int64_t value, int32_t base);
extern int64_t ViperItoa(int64_t value, char* buffer, int64_t length, int32_t base);
extern int64_t ViperAtoi(const char* buffer);

#endif /* __header_integer_types__ */
