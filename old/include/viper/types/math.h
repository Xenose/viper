#ifndef __header_viper_math_types__
#define __header_viper_math_types__

#include<stdint.h>
#include<viper/types/structs.h>

typedef struct {
	ViperStructType_t sType;
	int64_t x, y;
} ViperVectorInt2_t;

typedef struct {
	ViperStructType_t sType;
	int64_t x, y, z;
} ViperVectorInt3_t;

typedef struct {
	ViperStructType_t sType;
	float x, y;
} ViperVector2_t;

typedef struct {
	ViperStructType_t sType;
	float x, y, z;
} ViperVector3_t;

typedef struct {
	ViperStructType_t sType;
	float x, y, z, a;
} ViperVector4_t;

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;

	uint64_t count;
	uint64_t bytes;
	ViperVector3_t* data;
} ViperVertices_t;

typedef ViperVectorInt2_t ViperDimensions2_t;

typedef ViperVectorInt2_t ViperResultion2_t;

typedef ViperVector3_t ViperRotation3_t;


#endif /* __header_viper_math_types__ */
