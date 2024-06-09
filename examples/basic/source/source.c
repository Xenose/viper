#define VIPER_USE_LIBRARY_MAIN
#define VIPER_USE_NAMESPACE

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
#include<viper/core/file/config.h>

i8 SetupOpenGL(ViperApplication_t* app, ViperGraphicsCreateInfo_t* info) {
	LogInfo("Hello OpenGL");

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
	LogDebug("Hello");
   //PrintF("hello\n");
   sleep(1);
}

i64 ViperSetup(ViperApplicationCreateInfo_t* app) {

	app->flags =
		VIPER_APP_FLAG_USE_OPENGL;

	app->SetupOpenGL = &SetupOpenGL;
	app->LoopOpenGL = &LoopOpenGL;

	return 0;
}

i64 Main(ViperApplication_t* app) {
	int test = 10;
	ViperHashmap_t map = { 0 };

	HashmapCreate(&map, 0, 10, 0, sizeof(int), 10);

	HashmapInsert(&map, "hello", &test);
	HashmapInsert(&map, "hello", &test);
	test = 12;
	HashmapInsert(&map, "hello1", &test);
	test = 15;
	HashmapInsert(&map, "olleh", &test);

	LogDebug("Hello");
	LogInfo("Hello");
	LogNotice("Hello");
	LogWarning("Hello");
	LogError("Hello");
	LogFatal("Hello");
	LogAlert("Hello");
	LogCritical("Hello");
	LogEmergancy("Hello");

	LogDebug("The stored value is [ %i ]", *((int*)ViperHashmapGet(&map, "hello")));
	LogDebug("The stored value is [ %i ]", *((int*)ViperHashmapGet(&map, "hello1")));
	LogDebug("The stored value is [ %i ]", *((int*)ViperHashmapGet(&map, "olleh")));


	ViperBenchmark_t bench;

	BenchmarkPrint(&bench, "Viper hash", ViperHashSimple(100, "h"));

	LogDebug("hash function returned --> %i", (i64)ViperHashSimple(100, "hello"));
	LogDebug("hash function returned --> %i", (i64)ViperHashSimple(100, "olleh"));
	LogDebug("hash function returned --> %i", (i64)ViperHashSimple(100, "lleh"));
	LogDebug("hash function returned --> %i", (i64)ViperHashSimple(100, "hellod"));
	LogDebug("hash function returned --> %i", (i64)ViperHashSimple(100, "dkwjadk"));


	Shader_t shader = { 0 };
	ShaderCreateInfo_t shaderInfo = {
		.fragmentPath = "/home/xenose/Projects/main/viper/viper/shaders/basic_fragment.glsl",
		.vertexPath = "/home/xenose/Projects/main/viper/viper/shaders/basic_vertex.glsl",
	};

	ShaderCreateOpenGL(&shader, &shaderInfo);

	ViperThreadingTask_t task = {
		.func = Hello,
	};

	ThreadingForemanInit(10);
   
   if (0 != ThreadingForemanAddTask(&task)) {
     return -1;
   }

	ThreadingForemanStart(app);
	return 0;
}
