#ifndef __header_viper_memory_type__
#define __header_viper_memory_type__

#include <stdatomic.h>
#include<stdint.h>
#include<viper/types/typedefs.h>
#include<viper/types/structs.h>

#define MEMORY_128B		128
#define MEMORY_256B		256
#define MEMORY_512B		512
#define MEMORY_1KB		1024
#define MEMORY_2KB		2048
#define MEMORY_4KB		4096
#define MEMORY_8KB		8192
#define MEMORY_16KB		16384
#define MEMORY_32KB		32768
#define MEMORY_64KB		65536
#define MEMORY_128KB		131072
#define MEMORY_256KB		262144

typedef struct {
	ViperStructType_t sType;
	uint64_t bytes;
	union {
		void* ptr;
		char* str;
		uint8_t* data;
	};
} ViperBuffer_t;

typedef struct {
	ViperStructType_t sType;
	atomic_flag lock;

	void* start;
	void* end;
} ViperMemoryRegion_t;

#endif /* __header_viper_memory_type__ */
