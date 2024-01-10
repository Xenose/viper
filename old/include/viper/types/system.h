#ifndef __header_viper_system_types__
#define __header_viper_system_types__

#include<stdint.h>
#include<viper/types/structs.h>

typedef struct {
	ViperStructType_t sType;
	uint64_t coreCount;
	uint64_t threadCound;
	uint64_t memorySize;
} ViperSystemInfo_t;

#endif /* __header_viper_system_types__ */
