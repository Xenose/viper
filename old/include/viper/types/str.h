#ifndef __header_viper_str_types__
#define __header_viper_str_types__

#include<stdint.h>
#include<viper/types/structs.h>

typedef struct {
	ViperStructType_t sType;
	uint64_t bytes;
	char* data;
} ViperString_t;

#endif /* __header_viper_str_types__ */
