#include<viper/core/graphics/glfw.h>

#include<GLFW/glfw3.h>

#include<viper/core/debug/logger.h>

i8 ViperInitGLFW(ViperApplication_t* app) {
   if (!glfwInit()) {
      ViperLogError("Failed to init GLFW");
      goto ERROR_EXIT;
   }

   return 0;
ERROR_EXIT:
   return -1;
}
