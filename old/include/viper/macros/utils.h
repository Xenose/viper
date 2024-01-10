#ifndef __header_viper_utils_macros__
#define __header_viper_utils_macros__

/**
 * A simple macro to find the size of a array,
 * but this should be used on any pointers.
 */
#define ArraySize(array) (sizeof((array)) / sizeof((array)[0]))

#endif /* __header_viper_utils_macros__ */
