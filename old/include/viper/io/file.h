#ifndef __header_viper_file__
#define __header_viper_file__

#include<viper/tools/export.h>
#include<viper/types/file.h>

extern ViperFile_t* ViperLoadFile(const char* file);
extern ViperFile_t* ViperUnloadFile(ViperFile_t* file);
extern int8_t ViperBufferFlushToFile(const char* fileName, ViperBuffer_t* buffer);

#endif /* __header_viper_file__ */
