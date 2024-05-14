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
 * ViperHashSimple is the same as ViperHashSimpleLength but
 * the string length is not needed.
 */
extern u64 ViperHashSimple(u64 size, cc* string);

/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define HashSimpleLength   ViperHashSimpleLength
#define HashSimple         ViperHashSimple

#endif /* VIPER_USE_NAMESPACE */

#endif /* __header_viper_core_algorithm_has__ */
