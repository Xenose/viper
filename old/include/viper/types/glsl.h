#ifndef __header_viper_glsl__
#define __header_viper_glsl__

#include<viper/types/typedefs.h>
typedef struct {
	ViperStructType_t sType;

	const char* vertex;
	const char* geometric;
	const char* tesslation;
	const char* fragment;
	const char* compute;
} ViperShaderLocationsGLSL_t;

#endif /* __header_viper_glsl__ */
