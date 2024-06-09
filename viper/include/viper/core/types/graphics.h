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

/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define ShaderCreateInfo_t ViperShaderCreateInfo_t  
#define Shader_t           ViperShader_t            

#endif /* VIPER_USE_NAMESPACE */

#endif /* __header_viper_core_types_graphics__ */
