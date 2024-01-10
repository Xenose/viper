#ifndef __header_viper_core_graphics_window__
#define __header_viper_core_graphics_window__

#include<GLFW/glfw3.h>

#include<viper/core/types/glfw.h>


extern i8 ViperWindowCreate(ViperWindow_t* restrict window, ViperWindowCreateInfo_t const* restrict info);
extern void ViperWindowSwapBuffers(ViperWindow_t* window);

#endif /* __header_viper_core_graphics_window__ */
