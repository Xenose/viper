#ifndef __header_file_types__
#define __header_file_types__

#include<viper/types/structs.h>
#include<viper/types/typedefs.h>
#include<viper/types/memory.h>

typedef struct {
	ViperStructType_t sType;
	ViperBuffer_t buffer;
} ViperFile_t;

#endif /* __header_file_types__ */
