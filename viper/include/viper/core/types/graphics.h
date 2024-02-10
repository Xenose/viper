#ifndef __header_viper_core_types_graphics__
#define __header_viper_core_types_graphics__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

typedef struct {
   ViperStructType_t sType;

   cc* fragmentPath;
   cc* vertexPath;
   cc* geometricPath; 
   cc* tesselationPath;
   cc* computePath;
} ViperShaderCreateInfo_t;

typedef struct {
   ViperStructType_t sType;
   i64 id;
} ViperShader_t;

#endif /* __header_viper_core_types_graphics__ */
