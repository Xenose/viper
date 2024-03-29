#ifndef __header_viper_core_string_stringer__
#define __header_viper_core_string_stringer__

#include<viper/core/types/defines.h>

/**
 * ViperStringIsMatch is a function that will check the formatted string against
 * the inputted string, this function will allow for wildcards to be used in as
 * the format for example "hello *" would be the same as "hello world".
 *
 * @param format :: The formatted string.
 * @param input :: The inputted string to compare.
 *
 * @return VIPER_TRUE on match and VIPER_FALSE on miss-match.
 */
extern i8 ViperStringIsMatch(cc* format, cc* input);


extern i8 ViperStringCompare(cc* restrict str0, cc* restrict str1);

extern char* ViperStringFindDevider(char* str, char chr);

extern cc* ViperStringFindNonNumeric(cc* str, u64 length, cc* valid, u64 validLength);

extern char* ViperStringGetSub(char* str, u64* lenght);

extern i8 ViperAtou(u64* value, cc* restrict buffer, u64 lenght, u64 base);

extern char* ViperStringGetLine(cc* str);

#endif /* __header_viper_core_string_stringer__ */
