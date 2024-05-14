#ifndef __header_core_graphics_opengl__
#define __header_core_graphics_opengl__

#include<viper/core/types/defines.h>
#include<viper/core/types/graphics.h>

extern int8_t ViperShaderCreateOpenGL(ViperShader_t* restrict shader, const ViperShaderCreateInfo_t* restrict info);

/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define ShaderCreateOpenGL ViperShaderCreateOpenGL

#endif /* VIPER_USE_NAMESPACE */

#endif /* __header_core_graphics_opengl__ */
