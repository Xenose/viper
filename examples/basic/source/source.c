#define VIPER_USE_LIBRARY_MAIN

#include<fcntl.h>
#include<sys/mman.h>
#include<unistd.h>
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
#include<viper/core/maths/basic.h>
#include<viper/core/types/parser.h>
#include<viper/core/graphics/window.h>
#include<viper/core/string/stringer.h>
#include<viper/core/file/directory.h>
#include<viper/core/graphics/opengl.h>
#include<viper/core/algorithm/hash.h>
#include<viper/core/platform/cpu.h>
#include<viper/core/algorithm/hashmap.h>


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
	int test = 10;
	ViperHashmap_t map = { 0 };

	ViperHashmapCreate(&map, 0, 10, 0, sizeof(int), 10);

	ViperHashmapInsert(&map, "hello", &test);
	test = 12;
	ViperHashmapInsert(&map, "hello1", &test);
	test = 15;
	ViperHashmapInsert(&map, "olleh", &test);

	ViperLogDebug("The stored value is [ %i ]", *((int*)ViperHashmapGet(&map, "hello")));
	ViperLogDebug("The stored value is [ %i ]", *((int*)ViperHashmapGet(&map, "hello1")));
	ViperLogDebug("The stored value is [ %i ]", *((int*)ViperHashmapGet(&map, "olleh")));

	puts("\n");

	ViperLogDebug("Hello");
	ViperLogInfo("Hello");
	ViperLogNotice("Hello");
	ViperLogWarning("Hello");
	ViperLogError("Hello");
	ViperLogFatal("Hello");
	ViperLogCritical("Hello");
	ViperLogEmergancy("Hello");

	return 0;
   ViperBenchmark_t bench;

   ViperBenchmarkPrint(&bench, "Viper hash", ViperHashSimple(100, "h"));

   ViperLogDebug("hash function returned --> %i", (i64)ViperHashSimple(100, "hello"));
   ViperLogDebug("hash function returned --> %i", (i64)ViperHashSimple(100, "olleh"));
   ViperLogDebug("hash function returned --> %i", (i64)ViperHashSimple(100, "lleh"));
   ViperLogDebug("hash function returned --> %i", (i64)ViperHashSimple(100, "hellod"));
   ViperLogDebug("hash function returned --> %i", (i64)ViperHashSimple(100, "dkwjadk"));
 

   ViperShader_t shader = { 0 };
   ViperShaderCreateInfo_t shaderInfo = {
      .fragmentPath = "/home/xenose/Projects/main/viper/viper/shaders/basic_fragment.glsl",
      .vertexPath = "/home/xenose/Projects/main/viper/viper/shaders/basic_vertex.glsl",
   };

   ViperCreateShaderOpenGL(&shader, &shaderInfo);

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
