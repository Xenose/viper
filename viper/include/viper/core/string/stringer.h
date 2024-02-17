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

#endif /* __header_viper_core_string_stringer__ */
