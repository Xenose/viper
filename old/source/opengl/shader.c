#include "viper/memory/create.h"
#include<GL/glew.h>
#include<stdint.h>

#include<viper/types/file.h>
#include<viper/types/glsl.h>
#include<viper/types/opengl.h>
#include<viper/io/file.h>
#include<viper/debug/logger.h>

/**
 * The ViperDeleteShadersOpenGL function is used for
 * clearing out shader objects in OpenGL.
 *
 * @param compute Pointer to the compute shader ID.
 * @param fragment Pointer to the fragment shader ID.
 * @param geometric Pointer to the geometric shader ID.
 * @param tessellation Pointer to the tessellation shader ID.
 * @param vertex Pointer to the vertex shader ID.
 */
void ViperDeleteShadersOpenGL(int* compute, int* fragment, int* geometric, int* tesslation, int* vertex) {
	if (NULL != compute) {
		if (0 <= *compute) {
			glDeleteShader(*compute);
			*compute = -1;
		}
	}

	if (NULL != fragment) {
		if (0 <= *fragment) {
			glDeleteShader(*fragment);
			*fragment = -1;
		}
	}

	if (NULL != geometric) {
		if (0 <= *geometric) {
			glDeleteShader(*geometric);
			*geometric = -1;
		}
	}

	if (NULL != tesslation) {
		if (0 <= *tesslation) {
			glDeleteShader(*tesslation);
			*tesslation = -1;
		}
	}

	if (NULL != vertex) {
		if (0 <= *vertex) {
			glDeleteShader(*vertex);
			*vertex = -1;
		}
	}
}

int8_t ViperCreateShaderOpenGL(int type, const char* path) {
	ViperFile_t* file;
	GLint compliled = 0;
	GLuint shader = glCreateShader(type);

	file = ViperLoadFile(path);

	if (NULL == file) {
		ViperLogError("Failed to load soruce file [ %s ]", path);
		goto ERROR_EXIT;
	}

	glShaderSource(shader, 1, (const char**)&file->buffer.str, NULL);
	glCompileShader(shader);
	glGetShaderiv(shader, GL_COMPILE_STATUS, &compliled);

	if (GL_TRUE != compliled) {
		GLsizei length = 0;
		GLchar message[1024] = { 0 };

		glGetShaderInfoLog(shader, 1023, &length, message);

		ViperLogError("File [ %s ] %s", path, message, file->buffer.str);
		ViperLogDebug("[ %s SOURCE ]\n\n%s", path, file->buffer.str);
		goto ERROR_EXIT_UNLOAD_FILE;
	}

	ViperUnloadFile(file);
	return shader;
ERROR_EXIT_UNLOAD_FILE:
	ViperUnloadFile(file);
ERROR_EXIT:
	return -1;
}

int8_t ViperLoadShadersOpenGL(ViperShaderOpenGL_t* shader, ViperShaderLocationsGLSL_t paths) {
	// final program
	int program = -1;
	int linked = -1;

	// shader id's
	int compute = -1;
	int fragment = -1;
	int geometric = -1;
	int tessellation = -1;
	int vertex = -1;

	ViperFile_t file = { 0 };

	program = glCreateProgram();

	if (NULL != paths.compute) {
		compute = ViperCreateShaderOpenGL(GL_COMPUTE_SHADER, paths.compute);
		glAttachShader(program, compute);
		goto COMPILING;
	}

	if (NULL == paths.vertex || NULL == paths.fragment) {
		ViperLogError("Vertex or Fragment shader is NULL, unable to load shader");
		goto ERROR_EXIT;
	}

	fragment = ViperCreateShaderOpenGL(GL_FRAGMENT_SHADER,	paths.fragment);
	vertex	= ViperCreateShaderOpenGL(GL_VERTEX_SHADER,		paths.vertex);

	if (-1 == fragment || -1 == vertex) {
		// loging is done by the ViperCreateShaderOpenGL function
		goto ERROR_EXIT;
	}

	glAttachShader(program, vertex);
	glAttachShader(program, fragment);

	if (NULL != paths.geometric) {
		geometric = ViperCreateShaderOpenGL(GL_GEOMETRY_SHADER, paths.geometric);

		if (-1 == geometric) {
			ViperLogWarning("Failed to compile geometric shader, continuing...");
		} else {
			glAttachShader(program, geometric);
		}
	}

COMPILING:
	glLinkProgram(program);

	glGetProgramiv(program, GL_LINK_STATUS, &linked);

	if (GL_TRUE != linked) {
		GLsizei length = 0;
		GLchar message[1024] = { 0 };

		glGetProgramInfoLog(program, 1023, &length, message);
		ViperLogError("%s", message);
		goto ERROR_EXIT;
	}

	ViperLogDebug("Compiled program");
EXIT:
	ViperDeleteShadersOpenGL(&compute, &fragment, &geometric, &tessellation, &vertex);
	shader->program = program;
	return 0;
ERROR_EXIT:
	ViperDeleteShadersOpenGL(&compute, &fragment, &geometric, &tessellation, &vertex);
	return -1;
}
