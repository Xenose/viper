#include<stdlib.h>
#include<stdio.h>

#include<viper/api/main.h>
#include<viper/api/terminal/commands.h>

#include<viper/core/types/enums.h>
#include<viper/core/memory/allocator.h>
#include<viper/core/debug/signaller.h>
#include<viper/core/terminal/parser.h>
#include<viper/core/debug/logger.h>
#include<viper/core/graphics/glfw.h>
#include<viper/core/graphics/window.h>

/**
 * The hidden main function for the Viper engine used the application
 * to pre-allocate useful data and handles cleanup upon exit.
 *
 * This function should never be called by the user, instead the macro
 * for enablening the pre-processor main should be used and then the
 * ViperMain function will be called.
 */
int __ViperMain(int arc, char* const* arv) {
	if (0 != ViperSignalHandlerInit()) {
		puts("failed to init signal handlers");
	}

   ViperGraphicsCreateInfo_t* graphicsInfo = NULL;
   ViperApplication_t* app = ViperMalloc(sizeof(ViperApplication_t));
   ViperApplicationCreateInfo_t* appConfig = ViperMalloc(sizeof(ViperApplicationCreateInfo_t));
   ViperCommands_t commands = { 0 };

   app->sType  = VIPER_STRUCT_TYPE_APPLICATION;
   app->argc   = arc;
   app->argv   = arv;
   app->state  = 0;

   //if (0 != ViperInternalCommandParser(app, arc, arv)) {
   //}
   
   ViperCommandAdd(&commands, 0, "viper-dryrun",               "Running the program without a infinete loop",  &ViperTerminalCommandDryrun, app);
   ViperCommandAdd(&commands, 0, "viper-unit-tests",           "Running the internal viper engine tests",      &ViperTerminalCommandUnitTest, NULL);
   ViperCommandAdd(&commands, 0, "viper-enable-log-levels",    "Enables each logging level",                   &ViperTerminalCommandEnableLogLevels, NULL);
   ViperCommandAdd(&commands, 0, "viper-disable-log-levels",   "Disables each logging level",                  &ViperTerminalCommandDisableLogLevels, NULL);

   if (0 != ViperSetup(appConfig)) {
   }

   if (0 != ViperCommandRead(&commands, arc, (cc**)arv)) {
      goto ERROR_EXIT;
   }

   if (VIPER_APP_FLAG_USE_OPENGL & appConfig->flags) {
      app->flags = VIPER_APP_FLAG_USE_OPENGL;

      app->SetupOpenGL = appConfig->SetupOpenGL;
      app->LoopOpenGL = appConfig->LoopOpenGL;
   }

   if (NULL != app->SetupOpenGL) {
      app->opengl = ViperCalloc(1, sizeof(ViperOpenGL_t));
      graphicsInfo = ViperCalloc(1, sizeof(ViperGraphicsCreateInfo_t));
      ViperInitGLFW(app);
      
      app->SetupOpenGL(app, graphicsInfo);

      ViperWindowCreate(&app->opengl->window, &graphicsInfo->window);
      free(graphicsInfo);
   }
      
   

   // Freeing the ViperApplicationCreateInfo_t
   free(appConfig);
   ViperCommandDelete(&commands);

   if (0 != ViperMain(app)) {
   }

LOOP:
   switch (atomic_load(&app->state)) {
      case VIPER_APP_STATE_HALTING:
         goto LOOP;
      case VIPER_APP_STATE_RUNNING:
         goto LOOP;
      case VIPER_APP_STATE_STOPPED:
         break;
      case VIPER_APP_STATE_PAUSED:
         goto LOOP;
   }

   ViperFree(app);
   return 0;
ERROR_EXIT:
   return -1;
}
