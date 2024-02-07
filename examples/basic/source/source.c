#define VIPER_USE_LIBRARY_MAIN

#include<fcntl.h>
#include<sys/mman.h>
#include<unistd.h>

#include<viper/api/main.h>
#include<viper/core/io/printer.h>
#include<viper/core/maths/stringer.h>
#include<viper/core/debug/benchmark.h>
#include<viper/core/memory/allocator.h>
#include<viper/core/algorithm/dynamic_array.h>
#include<viper/core/debug/logger.h>
#include<viper/core/graphics/glfw.h>
#include<viper/core/graphics/window.h>
#include<viper/api/image/image.h>
#include<viper/core/file/file.h>
#include<viper/core/algorithm/queue.h>
#include<viper/core/threading/foreman.h>
#include<viper/core/maths/basic.h>
#include<viper/core/types/parser.h>
#include<viper/core/graphics/window.h>

#include<viper/core/dummy/hello.h>


i8 SetupOpenGL(ViperApplication_t* app, ViperGraphicsCreateInfo_t* info) {
   ViperLogInfo("Hello OpenGL");

   *info = (ViperGraphicsCreateInfo_t){
      .window = {
         .name = "viper",
         .resultion.x = 1920,
         .resultion.y = 1080,
         .flags = VIPER_WINDOW_FLAG_OPENGL,
      }
   };


   return 0;
}

void LoopOpenGL(ViperApplication_t* app) {

   glBegin(GL_TRIANGLES);
   glColor3f(1.0f, 0.0f, 0.0f); // Red
   glVertex2f(0.0f, 1.0f);     // Top vertex

   glColor3f(0.0f, 1.0f, 0.0f); // Green
   glVertex2f(-1.0f, -1.0f);   // Bottom-left vertex

   glColor3f(0.0f, 0.0f, 1.0f); // Blue
   glVertex2f(1.0f, -1.0f);    // Bottom-right vertex
   glEnd();

}

void Hello() {
}

i64 ViperSetup(ViperApplicationCreateInfo_t* app) {

   app->flags =
      VIPER_APP_FLAG_USE_OPENGL;

   app->SetupOpenGL = &SetupOpenGL;
   app->LoopOpenGL = &LoopOpenGL;

   return 0;
}

i64 ViperMain(ViperApplication_t* app) {
   ViperThreadingTask_t task = {
      .func = Hello,
   };


   ViperThreadingForemanInit(10);

   /*if (0 != ViperThreadingForemanAddTask(&task)) {
     return -1;
     }*/

   ViperThreadingForemanStart(app);
   return 0;
}
