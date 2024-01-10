#ifndef __header_viper_core_types_glfw__
#define __header_viper_core_types_glfw__

#include<GLFW/glfw3.h>

#include<viper/core/types/defines.h>

#define VIPER_WINDOW_FLAG_FULLSCREEN   0x00000001
#define VIPER_WINDOW_FLAG_OPENGL       0x00000002

typedef struct {
   ViperStructType_t sType;
   i64 x;
   i64 y;
} ViperWindowResultion_t;

typedef struct {
   ViperStructType_t sType;
   char* name;
   ViperWindowResultion_t resultion;
   u64 flags;
} ViperWindowCreateInfo_t;

typedef struct {
   ViperStructType_t sType;
   GLFWwindow* window;
} ViperWindow_t;

#endif /* __header_viper_core_types_glfw__ */
