#define VIPER_USE_LIBRARY_MAIN

#define _OPEN_SYS_ITOA_EXT

#include<stdio.h>
#include<fcntl.h>
#include<sys/mman.h>
#include<unistd.h>
#include<stdlib.h>

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

#include<viper/core/dummy/hello.h>

i64 ViperSetup(ViperApplicationCreateInfo_t* app) {
   return 0;
}

void Hello() {
   ViperPrintF("Hello Hello!\n");
}

i64 ViperMain(ViperApplication_t* app) {
   char buffer[256] = { 0 };

   ViperBenchmark_t spf = { 0 };
   ViperBenchmark_t itoaBench = { 0 };
   ViperBenchmark_t itoa2Bench = { 0 };
   
   ViperBenchmark(&spf, for (int i = 0; i < 1000000; i++) sprintf(buffer, "%ld", (long int)100));
   ViperBenchmark(&itoaBench, for (int i = 0; i < 1000000; i++) ViperItoa(100, buffer, 255, 10));
   ViperBenchmark(&itoa2Bench, for (int i = 0; i < 1000000; i++) ViperItoa2(100, buffer, 255, 10));

   printf("Itoa :: %li seconds %li micro %li nano\n", itoaBench.seconds, itoaBench.secondsMicro, itoaBench.secondsNano);
   printf("Itoa2 :: %li seconds %li micro %li nano\n", itoa2Bench.seconds, itoa2Bench.secondsMicro, itoa2Bench.secondsNano);
   printf("Sprintf :: %li seconds %li micro %li nano\n", spf.seconds, spf.secondsMicro, spf.secondsNano);

   /*
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
 
   ViperThreadingForemanStart(app);*/
   return 0;
}
