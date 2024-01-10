
#include<GL/glew.h>
#include "viper/types/models.h"

int8_t ViperCreateRenderObjectOpenGL(ViperModel_t* const model) {
	GLuint vbo = 0;
	GLuint vao = 0;
	GLint result = 0;

	glGenBuffers(1, &vbo);
	glBindBuffer(GL_ARRAY_BUFFER, vbo);
	glBufferData(GL_ARRAY_BUFFER, model->vertices.bytes, model->vertices.data, GL_STATIC_DRAW);

	glGetBufferParameteriv(GL_ARRAY_BUFFER, GL_BUFFER_SIZE, &result);

	if (model->vertices.bytes != result) {
		goto ERROR_EXIT;
	}

	glGenBuffers(1, &vao);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, vao);


	return 0;
ERROR_EXIT:
	return -1;
}
