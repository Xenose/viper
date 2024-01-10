
#define VIPER_USE_LIBRARY_MAIN
#define _POSIX_SOURCE
#define _GNU_SOURCE

#include "viper/io/parser.h"
#include "viper/debug/logger.h"
#include "viper/debug/signal_handler.h"
#include "viper/images/ppm.h"
#include "viper/io/images.h"
#include "viper/types/file.h"
#include "viper/types/images.h"
#include "viper/types/memory.h"
#include "viper/types/structs.h"
#include<viper/types.h>
#include<viper.h>
#include<viper/memory/create.h>
#include<viper/algorithms/linked_list.h>
#include<viper/memory/search.h>
#include<viper/io/file.h>
#include<viper/macros/utils.h>
#include<unistd.h>

#include<viper/io/parser.h>
#include<viper/debug/exceptions.h>
#include<viper/debug/benchmark.h>
#include<viper/networking/socket.h>

#include<stdio.h>
#include<sys/syscall.h>

/**
 * A example function of how to used the command line
 * parser, using ViperAddParserOption will add this
 * function to a list and then execute when stup
 * is done.
 *
 * @param config ::
 * @param customData :: This is what ever the developer supplied \
 * int the ViperAddParserOption functon, its recommended to use \
 * sType to identify the structure type.
 */
void Dryrun(ViperConfig_t* config, void* customData) {
	ViperLogDebug("This was a trail of great success");
}

/**
 * This is a example of the Rendering Loop Function,
 * it is used so that the sub-project can render
 * objects without any complicated setup.
 *
 * @param app :: Is the supplied app struct with \
 * application inforamtion.
 */
void RenderLoop(ViperApplication_t* app) {
	glBegin(GL_TRIANGLES);
	glColor3f(1.0, 0.0, 0.0); // Red
	glVertex2f(0.0, 1.0);

	glColor3f(0.0, 1.0, 0.0); // Green
	glVertex2f(-1.0, -1.0);

	glColor3f(0.0, 0.0, 1.0); // Blue
	glVertex2f(1.0, -1.0);
	glEnd();
}

void LoopIO(ViperApplication_t* app) {
}


/**
 * This function is provided so that the developer can
 * supply there own data before the actual application
 * starts.
 *
 * @param info :: the configuration data.
 */
int64_t ViperSetup(ViperApplicationCreateInfo_t* info) {
	//info->applicationLoop = &RenderLoop;
	ViperAddParserOption("--dryrun", "d", 'd', 0, NULL, &Dryrun, NULL);
   
   //ViperThreadTaskAdd(VIPER_THREAD_TASK_OPENGL, &RenderLoop);
   ViperThreadTaskAdd(VIPER_THREAD_TASK_FILEIO, &LoopIO);
   ViperThreadTaskAdd(VIPER_THREAD_TASK_FILEIO, &LoopIO);
   ViperThreadTaskAdd(VIPER_THREAD_TASK_FILEIO, &LoopIO);
	return 0;
}

/**
 * The library main function this is only included
 * if the VIPER_USE_LIBRARY_MAIN is defined.
 *
 * @param app :: is the application struct \
 * everthing in the application uses this struct.
 */
int64_t ViperMain(ViperApplication_t* app) {
   ViperSocketCreateInfo_t info = {
      .port = "8080",
      .address = "::1",
      .flags = VIPER_SOCKET_FLAG_SERVER,
   };
   
   ViperSocket_t* s = NULL;

   s = ViperCreate(VIPER_STRUCTURE_TYPE_SOCKET, s, &info);

   //ViperSocketAccept(s, NULL);
   
	return 0;
}

