#ifndef __header_viper_lz77__
#define __header_viper_lz77__

#include<viper/types/memory.h>

extern ViperBuffer_t* ViperCompressLZ77(int64_t mode, uint64_t windowSize, ViperBuffer_t* data);
extern ViperBuffer_t* ViperDecompressLZ77(int64_t mode, uint64_t windowSize, ViperBuffer_t* data);

#endif /* __header_viper_lz77__ */
