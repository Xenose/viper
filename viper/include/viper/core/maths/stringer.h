#ifndef __header_viper_core_maths_stringer__
#define __header_viper_core_maths_stringer__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

extern i64 ViperUtoa(u64 value, char* restrict buffer, u64 size, i64 base);

/**
 * ViperItoa is a function used for converted integers to
 * a human readable format in the form of a string.
 *
 * @param value :: Is the value that will be converted.
 * @param buffer :: Is the output buffer for the string.
 * @param size :: Is the size of the buffer available for use.
 * @param base :: Is the base of the output 2 to 36.
 *
 * @return On success the length of the new string will be \
 * returned on error -1 will be returned.
 */
extern  i64 ViperItoa(i64 value, char* buffer, u64 size, i64 base);

#endif /* __header_viper_core_maths_stringer__ */
