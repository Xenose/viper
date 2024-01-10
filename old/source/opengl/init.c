#include "viper/types.h"
#include "viper/types/models.h"
#include <GLFW/glfw3.h>
#include<viper/debug/logger.h>
#include<viper/opengl/init.h>

/**
 * This function is used for setting up a OpenGL
 * enviroment.
 *
 * @param Application_t* is the main struct for the program
 * @param OpenGL_t* is the wrapper for all the OpenGL data
 *
 * @return returns 0 on success and -1 on error
 */
int64_t ViperOpenGLInit(ViperApplication_t* app, ViperOpenGL_t* gl) {
	ViperLogDebug("Starting OpenGL");

	if (NULL == gl) {
		if (NULL == app->opengl) {
			app->opengl = calloc(1, sizeof(ViperOpenGL_t));

			if (NULL == app->opengl) {
				ViperLogError("Failed to allocate Vulkan_t");
				goto ERROR_EXIT;
			}
		}

		gl = app->opengl;

		if (VIPER_STRUCTURE_TYPE_UNKOWN == gl->sType) {
			gl->sType = VIPER_STRUCTURE_TYPE_OPENGL;
		}

		if (NULL == app->name.data || 0 == app->name.bytes) {
			ViperLogError("Application_t name not set");
			return -1;
		}

		/**
		 * @subsection Window-Size
		 * Setting default values for the window if non is provided
		 *
		 * @param gl->dimensionsWindow.x :: 1920
		 * @param gl->dimensionsWindow.y :: 1080
		 */
		if (0 == gl->dimensionsWindow.x || 0 == gl->dimensionsWindow.y) {
			gl->dimensionsWindow.x = 1920;
			gl->dimensionsWindow.y = 1080;
		}
	}

	if (!glfwInit()) {
		ViperLogError("glfwInit failed");
		goto ERROR_EXIT;
	}

	gl->window.data = glfwCreateWindow(
			gl->dimensionsWindow.x, gl->dimensionsWindow.y,
			app->name.data, NULL, NULL);

	if (NULL == gl->window.data) {
		ViperLogError("Failed to create OpenGL Window");
		goto ERROR_EXIT;
	}


	return 0;
ERROR_EXIT:
	return -1;
}

void ViperRenderLoopOpenGL(ViperApplication_t* app) {
	if (glfwWindowShouldClose(app->opengl->window.data)) {
		app->status = VIPER_APPLICATION_STATUS_EXIT;
	}

	glfwSwapBuffers(app->opengl->window.data);
	glClear(GL_COLOR_BUFFER_BIT);
}

int8_t ViperLoadModelOpenGL(ViperApplication_t* app, ViperModel_t const* model) {
	return 0;
}
