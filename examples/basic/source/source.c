#define VIPER_USE_LIBRARY_MAIN

#define _OPEN_SYS_ITOA_EXT

#include<stdio.h>
#include<fcntl.h>
#include<sys/mman.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>

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

   /*for (int i = -100; i <= 100; i++) {
      ViperItoa(i, buffer, 255, 10);
      puts(buffer);
      memset(buffer, 0, 255);
   }*/

   /*int t = 1000000;

   ViperBenchmark_t spf = { 0 };
   ViperBenchmark_t itoaBench = { 0 };
   
   ViperBenchmark(&spf, for (i64 i = -t; i < t; i++) sprintf(buffer, "%ld", i));
   ViperBenchmark(&itoaBench, for (i64 i = -t; i < t; i++) ViperItoa(i, buffer, 255, 10));

   printf("Itoa :: %li seconds %li micro %li nano\n", itoaBench.seconds, itoaBench.secondsMicro, itoaBench.secondsNano);
   printf("Sprintf :: %li seconds %li micro %li nano\n", spf.seconds, spf.secondsMicro, spf.secondsNano);*/

   ViperBenchmark_t test = { 0 };
   ViperBenchmark_t test2 = { 0 };

   ViperBenchmarkStart(&test);
   for (int i = 0; i < 1000; i++)
      ViperLogNotice("hello");
   ViperBenchmarkStop(&test);


   ViperBenchmarkStart(&test2);
   for (int i = 0; i < 1000; i++)
      printf("[ \033[34mNOTICE\033[0m ] File [ %s ] Line [ %i ] Function [ %s ] Message : %s\n", __FILE__, __LINE__, __func__, "hello");
   ViperBenchmarkStop(&test2);

   printf("Log :: %li seconds %li micro %li nano\n", test.seconds, test.secondsMicro, test.secondsNano);
   printf("Printf :: %li seconds %li micro %li nano\n", test2.seconds, test2.secondsMicro, test2.secondsNano);

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
