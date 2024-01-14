#ifndef __header_viper_core_platform_dynamic_loading__
#define __header_viper_core_platform_dynamic_loading__

#include<viper/core/types/defines.h>
#include<viper/core/types/dynamic_library.h>

/**
 * The ViperLibaryLoad function is used to load dynamic
 * libraries from the enviroment or the fallback directory,
 *
 * The function will use the enviroment varible 
 * LD_LIBRARY_PATH if set.
 *
 * @param library :: Is the struct for all the functions and
 * the handle to the library.
 * @param fallbackPath :: Should be the path to the programs
 * binary, but it can be other paths as well.
 * @param func :: Is the function that will be laoded.
 *
 * @return Will return a file pointer or NULL on error.
 */
extern void* ViperLibraryLoad(ViperGenericDynamicLibrary_t* library, cc* fallbackPath, cc* func);

#endif /* __header_viper_core_platform_dynamic_loading__ */
