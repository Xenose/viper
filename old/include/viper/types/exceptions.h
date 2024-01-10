#ifndef __header_viper_exceptions_types__
#define __header_viper_exceptions_types__

#include<stdatomic.h>
#include<setjmp.h>

#include<viper/types/typedefs.h>

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;

   int64_t errorCode;
} ViperException_t;

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;

	int* index;
	sigjmp_buf** buffers;
} ViperJumpBuffer_t;

#endif /* __header_viper_exceptions_types__ */
