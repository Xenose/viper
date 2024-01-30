#define VIPER_USE_LIBRARY_MAIN

#include<stdio.h>
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

i64 ViperSetup(ViperApplicationCreateInfo_t* app) {
   return 0;
}

void Hello() {
   sleep(1);
   ViperPrintF("Hello Hello!\n");
}

i64 ViperMain(ViperApplication_t* app) {
   
   ViperInitGLFW(app);

   ViperWindow_t window = { 0 };
   ViperWindowCreateInfo_t windowInfo = {
      .name = "hello",
      .resultion.x = 1920,
      .resultion.y = 1080,
   };

   ViperThreadingTask_t task = {
      .func = Hello,
   };

   ViperThreadingForemanInit(10);

   if (0 != ViperThreadingForemanAddTask(&task)) {
      return -1;
   }
   //ViperLogDisableLevel(VIPER_LOG_LEVEL_DEBUG);
 
   ViperThreadingForemanStart(app);
   return 0;
}
