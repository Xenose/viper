#ifndef __header_viper_core_maths_stringer__
#define __header_viper_core_maths_stringer__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

/**
 * ViperUtoa is a function used for converted unsigned integers to
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

/**
 * ViperAtou is used to load a value from a string into a u64 value or
 * unsigned 64 bit int, it can handle a base from 2 to 35 or [ 2 to Z ].
 *
 * @param value :: This is the pointer where the data will be written to.
 * @param buffer :: The buffer with the string to parse.
 * @param length :: The length/size of the buffer.
 * @param base :: The base of the string a value between 2 to 35.
 */
extern i8 ViperAtou(u64* value, cc* restrict buffer, u64 lenght, u64 base);

#endif /* __header_viper_core_maths_stringer__ */
