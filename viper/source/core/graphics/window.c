#include<GL/glew.h>

#include<viper/core/debug/logger.h>
#include<viper/core/graphics/window.h>

static void (*__ViperWindowSwapBuffers)(ViperWindow_t* window) = NULL;

static void __ViperWindowSwapBuffersOpenGL(ViperWindow_t* window) {
   glfwSwapBuffers(window->window);
}

static void __ViperWindowSwapBuffersVulkan(ViperWindow_t* window) {
}

i8 ViperWindowCreate(ViperWindow_t* restrict window, ViperWindowCreateInfo_t const* restrict info) {
   i64 error = 0;
   GLFWmonitor* monitor = VIPER_WINDOW_FLAG_FULLSCREEN & info->flags ? glfwGetPrimaryMonitor() : NULL;

   window->window = glfwCreateWindow(info->resultion.x, info->resultion.y, info->name, monitor, NULL);

   if (NULL == window->window) {
      ViperLogError("Failed to create window");
      goto ERROR_EXIT;
   }

   if (VIPER_WINDOW_FLAG_OPENGL & info->flags) {
      __ViperWindowSwapBuffers = &__ViperWindowSwapBuffersOpenGL;

      glfwMakeContextCurrent(window->window);

      if (GLEW_OK != (error = glewInit())) {
         ViperLogError("Failed to init glew [ %G ]", error);
         goto ERROR_EXIT;
      }
   } else {
      __ViperWindowSwapBuffers = &__ViperWindowSwapBuffersVulkan;
   }

   return 0;
ERROR_EXIT:
   return -1;
}

void ViperWindowSwapBuffers(ViperWindow_t* window) {
   __ViperWindowSwapBuffers(window);
}


