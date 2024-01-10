#ifndef __header_viper_opengl_types__
#define __header_viper_opengl_types__

#include "viper/types/typedefs.h"
#include<GLFW/glfw3.h>

#include <stdatomic.h>
#include<viper/types/structs.h>
#include<viper/types/math.h>

typedef struct {
	ViperStructType_t	sType;
	atomic_flag 	locked;
	GLFWwindow*		data;
} ViperGLFWwindow_t;

typedef struct {
	ViperStructType_t	sType;
	atomic_flag		locked;
} ViperVertexBufferObjectOpenGL_t;

typedef struct {
	ViperStructType_t	sType;
	atomic_flag		locked;
} ViperVertexArrayObjectOpenGL_t;

typedef struct {
	ViperStructType_t	sType;
	atomic_flag		locked;
} ViperShaderCreationInfoOpenGL_t;

typedef struct {
	ViperStructType_t	sType;
	atomic_flag		locked;

	int program;
} ViperShaderOpenGL_t;

typedef struct {
	ViperStructType_t	sType;
	atomic_flag		locked;

	ViperShaderOpenGL_t shader;
} ViperMaterialOpenGL_t;

typedef struct {
	ViperStructType_t sType;

	ViperGLFWwindow_t	window;
	ViperDimensions2_t		dimensionsWindow;
} ViperOpenGL_t;

#endif /* __header_viper_opengl_types__ */
