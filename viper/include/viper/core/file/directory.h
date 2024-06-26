#ifndef __header_viper_core_file_directory__
#define __header_viper_core_file_directory__

#include<viper/core/types/defines.h>

#define VIPER_DIRECTORY_SEARCH_NOSUB   0x0001

/**
 * ViperDirectorySearch will search the given directory and its sub-directories
 * for the given file format, if the VIPER_DIRECTORY_SEARCH_NOSUB is given only
 * the given directory will be searched.
 *
 * @param count :: Will return the number of pointers allocated.
 *
 * @param path :: The path to search.
 *
 * @param format :: The format for the matching files, see ViperStringIsMatch
 * for more info.
 *
 * @param flags :: Additional configuration flags.
 *
 * @return This function returns a realloced list on success and count is set
 * to the number of elements, on failure the function will return NULL and count
 * will be zero. The user must free the return value themself.
 *
 * VIPER_DIRECTORY_SEARCH_NOSUB :: Is used to turn off the recursive search.
 *
 * @see ViperStringIsMatch(cc* format, cc* input)
 */
extern char** ViperDirectorySearch(u64* count, cc* path, cc* format, u64 flags);

/**
 * Retrieves the program binary path.
 *
 * @return Returns a heap allocated string with the path on success this
 * pointer must be freed by the user, on error NULL is returned.
 */
extern char* ViperDirectoryProgram();

/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define DirectorySearch    ViperDirectorySearch
#define DirectoryProgram   ViperDirectoryProgram

#endif /* VIPER_USE_NAMESPACE */

#endif /* __header_viper_core_file_directory__ */
