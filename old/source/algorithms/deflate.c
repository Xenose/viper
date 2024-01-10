#include "viper/types/memory.h"
#include<viper/algorithms/deflate.h>
#include<viper/io/printer.h>

ViperBuffer_t* ViperDeflateDecompress(const ViperBuffer_t* input) {
	for (int64_t i = 0; i < input->bytes; i++) {
		ViperPrintF("%b\n", input->data[i]);
	}

	return 0;
}

ViperBuffer_t* ViperDeflateCompress(const ViperBuffer_t* input) {
	return NULL;
}
