#include<viper/debug/logger.h>
#include<viper/types.h>
#include<viper/utils/stringer.h>
#include<viper/application/application.h>
#include<viper/opengl/init.h>
#include<viper/vulkan/init.h>

/**
 * These function is internal helper functions
 */
static void __ViperEmptyLoopNoCall(ViperApplication_t* app) {
}

static void __ViperRenderLoopNoCall(ViperApplication_t* app) {
	if (glfwWindowShouldClose(app->opengl->window.data)) {
		app->status = VIPER_APPLICATION_STATUS_EXIT;
	}
	glfwPollEvents();
}

/**
 * This is local global varible to allows the user to switch
 * between multiple rendering methods.
 *
 * @param app :: is the Application_t struct for the program.
 *
 * default the __EmptyLoopNoCall function is used as a placeholder.
 */
static void (*__ViperRenderLoop)(ViperApplication_t* app) = &__ViperEmptyLoopNoCall;

/**
 * The main application loop that will call the user space loop.
 *
 * @param app :: is the Application_t struct for the program.
 */
static void __ViperApplicationLoop(ViperApplication_t* app) {
	while (app->status) {
		glfwPollEvents();
		app->applicationLoop(app);
		__ViperRenderLoop(app);
	}
}

/**
 * This function can either be called directly or using the create function,
 * it will initiliaze the struct using the data provided in the ApplicationCreateInfo_t
 *
 * @param info->name :: is the application name that will be used for the application\
 * and for the window if graphics are used.
 */
int ViperApplicationCreate(ViperApplication_t* app, const ViperApplicationCreateInfo_t* info) {
	*app = (ViperApplication_t) {
		.sType = VIPER_STRUCTURE_TYPE_APPLICATION,
	};

	if (NULL == info->applicationLoop) {
		app->applicationLoop = &__ViperEmptyLoopNoCall;
	} else {
		app->applicationLoop = info->applicationLoop;
	}

	if (0 >= ViperStringCreate(&app->name, info->name)) {
		ViperLogError("Failed to create string");
		goto ERROR_EXIT;
	}

	if (VIPER_APPLICATION_FLAG_GRAPHICS_VULKAN & info->flags) {
		if (0 != ViperVulkanInit(app, app->vulkan)) {
			ViperLogError("Failed to VulkanInit");
			goto ERROR_EXIT;
		}

		__ViperRenderLoop = &__ViperRenderLoopNoCall;
	} else if (VIPER_APPLICATION_FLAG_GRAPHICS_OPENGL & info->flags) {
		if (0 != ViperOpenGLInit(app, app->opengl)) {
			ViperLogError("Failed to OpenGLInit");
			goto ERROR_EXIT;
		}

		__ViperRenderLoop = &ViperRenderLoopOpenGL;
	} else {
		ViperLogDebug("Graphics flag not set");
	}

	app->status = VIPER_APPLICATION_STATUS_RUNNING;

	return 0;
ERROR_EXIT:
	return -1;
}

void ViperApplicationStart(ViperApplication_t* app) {
	__ViperApplicationLoop(app);
}
