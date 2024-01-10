#ifndef __header_viper__
#define __header_viper__

#include<viper/types.h>
#include<viper/debug/logger.h>
#include<viper/utils/stringer.h>

#include<viper/opengl/init.h>
#include<viper/vulkan/init.h>

#include<viper/application/application.h>
#include<viper/memory/create.h>
#include<viper/debug/signal_handler.h>
#include<viper/io/parser.h>
#include<viper/lua/init.h>
#include<viper/debug/benchmark.h>
#include<viper/threading/master.h>

//#define VIPER_USE_LIBRARY_MAIN
#ifdef VIPER_USE_LIBRARY_MAIN

/**
 * If the developer chooses to use the predefined
 * viper main function this functions must be declared
 * by them.
 *
 * These functions allow the programmer to customize there
 * program before the setup and the main loop.
 */
extern int64_t ViperSetup(ViperApplicationCreateInfo_t* info);

/**
 * If the developer chooses to use the predefined
 * viper main function this functions must be declared
 * by them.
 *
 * These functions allow the programmer to customize there
 * program before the setup and the main loop.
 */
extern int64_t ViperMain(ViperApplication_t* app);

/**
 * The viper main function is a optional function that gets
 * included only when the VIPER_USE_LIBRARY_MAIN is defined.
 *
 * The function will allow the developer to customize there
 * program by providing the ViperInit function before the
 * actual application is defined.
 */
int Main(int arc, char* const* arv) {
   // TODO remove
   static ViperBenchmark_t bench0 = { 0 };
   ViperBenchmarkStart(&bench0);

	ViperApplication_t* app = NULL;

	ViperConfig_t config = {
		.sType = VIPER_STRUCTURE_TYPE_CONFIG,
	};

	ViperApplicationCreateInfo_t info = {
		.sType	= VIPER_STRUCTURE_TYPE_APPLICATION,
		.flags	= VIPER_APPLICATION_FLAG_GRAPHICS_OPENGL,
		.arc		= arc,
		.arv		= arv,
		.name		= "test",
	};

	ViperInitSignalHandler();

	if (0 != ViperSetup(&info)) {
		ViperLogError("ViperSetup returned error code");
		goto ERROR_EXIT;
	}

	ViperParseCommands(info.arc, info.arv, &config);

   if (0 != LuaInit()) {
      ViperLogError("Failed to start lua");
		goto ERROR_EXIT;
   }

	app = ViperCreate(VIPER_STRUCTURE_TYPE_APPLICATION, app, &info);

	if (NULL == app) {
		ViperLogError("Failed to create application");
      goto ERROR_EXIT_UNLOAD_LUA;
	}

	if (0 != ViperMain(app)) {
		ViperLogError("ViperMain returned error code");
		goto ERROR_EXIT_FREE_APPLICATION;
	}

   // TODO remove
   ViperBenchmarkStop(&bench0);
   ViperLogNotice("Load time is [ %i sec ] [ %i micro ] [ %i nano ]", bench0.seconds, bench0.microSeconds, bench0.nanoSeconds);
   
	//ViperApplicationStart(app);
   ViperThreadTaskForeman(app, 10);
   

	free(app);
   LuaUnload();
	return 0;
ERROR_EXIT_FREE_APPLICATION:
	free(app);
ERROR_EXIT_UNLOAD_LUA:
   LuaUnload();
ERROR_EXIT:
	return -1;
}

#endif /* VIPER_USE_LIBRARY_MAIN */

#endif /* __header_viper__ */
