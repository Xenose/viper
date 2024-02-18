#ifndef __header_viper_core_file_file__
#define __header_viper_core_file_file__

#include<viper/core/types/file.h>

/**
 * ViperFileUnload will either unload the file memory or free it if the
 * VIPER_FILE_FLAG_SYSTEM was set, this allows the loading of files with
 * zero length.
 *
 * @param file :: The file to unload.
 *
 * @return Will return -1 on error and 0 on success.
 */
extern i8 ViperFileUnload(ViperFile_t* file);

/**
 * ViperFileLoad loads files either using mmap or a read loop, if the flag
 * VIPER_FILE_FLAG_SYSTEM is set then the file is likely to be a system
 * file with ZERO length meaning that we use the loop to load it.
 *
 * @param file :: The open file with all the data for the loading process.
 *
 * @return Returns -1 on error and 0 on success.
 */
extern i8 ViperFileLoad(ViperFile_t* file);

/**
 * This function is a combination of ViperFileOpen and ViperFileLoad doing both
 * in one step.
 *
 * @param file :: The struct where to store the data.
 * @param fullpath :: The path to the file and the file name.
 * @param flags :: Flags that are used to change the loading process.
 * @param mode :: If the VIPER_FILE_FLAG_CREATE is set this will be the
 * permissions.
 *
 * @return Returns -1 on error and 0 on success.
 */
extern i8 ViperFileOpenLoad(ViperFile_t* file, cc* fullpath, u64 flags, u64 mode);

#endif /* __header_viper_core_file_file__ */
