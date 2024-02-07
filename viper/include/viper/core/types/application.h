#ifndef __header_viper_core_types_application__
#define __header_viper_core_types_application__

#include<GLFW/glfw3.h>

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>
#include<viper/core/types/flags.h>
#include<viper/core/types/glfw.h>

typedef struct __ViperOpenGL_t {
   ViperStructType_t sType;

   ViperWindow_t window;
} ViperOpenGL_t;

typedef struct __ViperApplication_t {
   // the type of the struct
   ViperStructType_t sType;
   // the command line argc, provided before setup
   int argc;
   // the command line argv, provided before setup
   char* const* argv;

   au64 flags;
   au16 state;

   i8 (*SetupOpenGL)(struct __ViperApplication_t* app, ViperGraphicsCreateInfo_t* info);
   void (*LoopOpenGL)(struct __ViperApplication_t* app);

   ViperOpenGL_t* opengl;
} ViperApplication_t;

typedef struct {
   ViperStructType_t sType;
   au64 flags;

   i8 (*SetupOpenGL)(ViperApplication_t* app, ViperGraphicsCreateInfo_t* info);
   void (*LoopOpenGL)(ViperApplication_t* app);

} ViperApplicationCreateInfo_t;

#endif /* __header_viper_core_types_application__ */
