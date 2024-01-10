#ifndef __header_viper_game_types__
#define __header_viper_game_types__

#include<stdatomic.h>

#include<viper/types/structs.h>
#include<viper/types/str.h>
#include<viper/types/math.h>
#include<viper/types/physics.h>

typedef struct {
	ViperStructType_t sType;
} ViperTexture_t;

typedef struct {
	ViperStructType_t sType;
} ViperMaterial_t;

typedef struct {
	ViperStructType_t sType;
   atomic_flag locked;

   ViperRigidbody_t rigidbody;
} ViperGameObject4D_t;

typedef struct {
	ViperStructType_t sType;
	ViperMaterial_t* material;

	uint64_t				count;
	ViperGameObject4D_t		objects;
} ViperGameObejctCollection4D_t;

typedef struct {
	ViperStructType_t* sType;
	ViperGameObejctCollection4D_t* collection4D;
} ViperChunk_t;

typedef struct {
	ViperStructType_t sType;
	int64_t id;
	ViperString_t name;
} ViperScene_t;

#endif /* __header_viper_game_types__ */
