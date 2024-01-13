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

i64 ViperSetup(ViperApplicationCreateInfo_t* app) {
   return 0;
}

i64 ViperMain(ViperApplication_t* app) {
   ViperBenchmark_t bench;

   /*ViperInitGLFW(app);

   ViperWindow_t window = { 0 };
   ViperWindowCreateInfo_t windowInfo = {
      .name = "hello",
      .resultion.x = 1920,
      .resultion.y = 1080,
   };*/

   //ViperLogDisableLevel(VIPER_LOG_LEVEL_DEBUG);

   int fd = open("resources/images/test.jpg", O_RDONLY);

   if (-1 == fd) {
      ViperLogError("open failed");
      return -1;
   }

   i64 length = lseek(fd, 0, SEEK_END);
   void* ptr = mmap(NULL, length, PROT_READ, MAP_SHARED, fd, 0);  

   if (MAP_FAILED == ptr) {
      ViperLogError("mmap failed");
      return -1;
   }

   ViperImage_t image = { };
   ViperBuffer_t input = {
      .bytes = length,
      .ptr = ptr,
   };


   ViperBenchmarkStart(&bench);

   //ViperWindowCreate(&window, &windowInfo);
   
   ViperImageDecode(&image, &input);
   
   ViperBenchmarkStop(&bench);

   ViperLogDebug("Seconds %i Micro %i Nano %i", bench.seconds, bench.secondsMicro, bench.secondsNano);

   return 0;
}
