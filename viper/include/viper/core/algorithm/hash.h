#ifndef __header_viper_core_algorithm_hash__
#define __header_viper_core_algorithm_hash__

#include<viper/core/types/defines.h>

/**
 * ViperHashSimpleLength is used to create a hash key within
 * the size of size.
 *
 * @param size :: The desired maximum size of the has value.
 * @param string :: The key value that will be hashed.
 * @param length :: The string length.
 */
extern u64 ViperHashSimpleLength(u64 size, cc* string, u64 length);

/**
 * ViperHashSimple is the same as viperHashSimpleLength but
 * the string length is not needed.
 */
extern u64 ViperHashSimple(u64 size, cc* string);

#endif /* __header_viper_core_algorithm_has__ */
