#define VIPER_USE_LIBRARY_MAIN

#include<stdio.h>

#include<viper/api/main.h>
#include<viper/core/io/printer.h>
#include<viper/core/maths/stringer.h>
#include<viper/core/debug/benchmark.h>
#include<viper/core/memory/allocator.h>
#include<viper/core/algorithm/dynamic_array.h>
#include<viper/core/debug/logger.h>
#include<viper/core/graphics/glfw.h>

i64 ViperSetup(ViperApplicationCreateInfo_t* app) {
   return 0;
}

i64 ViperMain(ViperApplication_t* app) {
   ViperBenchmark_t bench;

   ViperWindow_t window = { 0 };
   ViperWindowCreateInfo_t windowInfo = {
      .name = "hello",
      .resultion.x = 1920,
      .resultion.y = 1080,
   };

   //ViperLogDisableLevel(VIPER_LOG_LEVEL_DEBUG);

   ViperBenchmarkStart(&bench);

   //ViperWindowCreate(&window, &windowInfo);

   ViperPrintF("Index\n");
   //printf("hello\n");
   
   ViperBenchmarkStop(&bench);

   ViperLogDebug("Seconds %i Micro %i Nano %i", bench.seconds, bench.secondsMicro, bench.secondsNano);

   return 0;
}
