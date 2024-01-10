#ifndef __header_viper_models_types__
#define __header_viper_models_types__

#include<viper/types/typedefs.h>
#include<viper/types/structs.h>
#include<viper/types/math.h>

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;

	ViperVertices_t vertices;
} ViperModel_t;

#endif /*__header_viper_models_types__*/
