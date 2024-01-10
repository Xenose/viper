#include "viper/types/memory.h"
#include "viper/types/structs.h"
#include<viper/algorithms/lz77.h>
#include<viper/types/algorithms.h>

#include<string.h>
#include<stdlib.h>

#define LZ4_MAGIC_NUMBER 0x184D2204

static inline ViperBuffer_t* __ViperCompressLZ4(uint64_t windowSize, ViperBuffer_t* data) {
	ViperBuffer_t* out = calloc(1, sizeof(ViperBuffer_t));
	uint32_t contentSize = data->bytes;

	out->bytes	= data->bytes;
	out->ptr		= calloc(data->bytes, sizeof(char));

	ViperHeaderLZ4 header = {
		.sType = VIPER_STRUCTURE_TYPE_UNKOWN,
	};

	header.data.flg_version			= 0x2;
	header.data.flg_contentSize	= 0x1;

	memset(out->data, LZ4_MAGIC_NUMBER, 4);

	return out;
}

ViperBuffer_t* ViperCompressLZ77(int64_t mode, uint64_t windowSize, ViperBuffer_t* data) {
	return NULL;
}

ViperBuffer_t* ViperDecompressLZ77(int64_t mode, uint64_t windowSize, ViperBuffer_t* data) {
	return NULL;
}
