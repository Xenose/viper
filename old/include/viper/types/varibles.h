#ifndef __header_viper_varibles_types__
#define __header_viper_varibles_types__

#include<viper/types/typedefs.h>

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;
	int64_t value;
} ViperInt_t;

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;
	float value;
} ViperFloat_t;

#endif /* __header_viper_varibles_types__ */
