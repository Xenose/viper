#ifndef __header_viper_tests_types__
#define __header_viper_tests_types__

#include "viper/types/typedefs.h"

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;

	int testTotal;
	int testFailed;
} ViperTestInfo_t;

#endif /* __header_viper_tests_types__ */
