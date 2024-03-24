#ifndef __header_viper_core_types_scene__
#define __header_viper_core_types_scene__

#include<viper/core/types/defines.h>
#include<viper/core/types/glfw.h>
#include<viper/core/graphics/opengl.h>
#include<viper/core/algorithm/hashmap.h>

typedef struct {
   ViperStructType_t sType;
   u64 id;
   char* name;

   ViperHashmap_t shaders;
   ViperHashmap_t models;
   ViperHashmap_t gameObjects;
} ViperScene_t;

#endif /* __header_viper_core_types_scene__ */
