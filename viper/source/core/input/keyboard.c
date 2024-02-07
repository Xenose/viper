#include<GLFW/glfw3.h>

#include<viper/core/types/keyboard.h>
#include<viper/core/types/application.h>

ViperKeyEventData_t __viperKeyEvent[GLFW_KEY_LAST] = { 0 };

void ViperEventHandlerGLFW(GLFWwindow* window, int key, int scancode, int action, int modes) {
   ViperKeyEventData_t* event = &__viperKeyEvent[key];

   switch(action) {
      case GLFW_RELEASE:
         break;
      case GLFW_PRESS:
         break;
      case GLFW_REPEAT:
         break;
   }
}
