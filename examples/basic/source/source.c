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

i64 ViperSetup(ViperApplicationCreateInfo_t* app) {
   return 0;
}

i64 ViperMain(ViperApplication_t* app) {
   /*

   ViperQueue_t queue = { 0 };
   int test = 101;
   int test2 = 102;

   if (0 != ViperQueueCreate(&queue, 0, sizeof(int), 10)) {
      ViperLogDebug("failed to create queue");
   }
   
   ViperQueueInsertItem(&queue, &test);
   ViperQueueInsertItem(&queue, &test2);

   ViperPrintF("%i\n", *((int*)ViperQueueGetItem(&queue)));
   ViperQueuePopItem(&queue);
   ViperPrintF("%i\n", *((int*)ViperQueueGetItem(&queue)));
   ViperQueuePopItem(&queue);
   ViperPrintF("%i\n", *((int*)ViperQueueGetItem(&queue)));
   ViperQueueInsertItem(&queue, &test2);
   ViperPrintF("%i\n", *((int*)ViperQueueGetItem(&queue)));
   
   ViperInitGLFW(app);

   ViperWindow_t window = { 0 };
   ViperWindowCreateInfo_t windowInfo = {
      .name = "hello",
      .resultion.x = 1920,
      .resultion.y = 1080,
   };

   ViperLogDisableLevel(VIPER_LOG_LEVEL_DEBUG);
 
   ViperFile_t file = {};
   
   ViperFileLoad(&file, "resources/images/test.jpg");

   ViperImage_t image = { };
   ViperWindowCreate(&window, &windowInfo);
   
   ViperImageDecode(&image, &file.buffer);*/
   puts("lolz");

   ViperBenchmark_t bench;

   ViperBenchmarkStart(&bench);
   ViperLogDebug("hello world!");
   ViperBenchmarkStop(&bench);

   ViperLogDebug("Seconds %i Micro %i Nano %i", bench.seconds, bench.secondsMicro, bench.secondsNano);
   return 0;
}
