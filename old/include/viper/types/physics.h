#ifndef __header_viper_physics_types__
#define __header_viper_physics_types__

#include<stdint.h>
#include"viper/types/typedefs.h"
#include"viper/types/structs.h"
#include"viper/types/math.h"

typedef struct {
   ViperStructType_t sType;
   int64_t drag;
} ViperPhysicsLaws_t;

typedef struct {
   ViperStructType_t sType;
} ViperColider_t;

typedef struct {
   ViperStructType_t sType;
   int64_t mass;
   ViperVector4_t position;
} ViperRigidbody_t;

#endif /* __header_viper_physics_types__ */
