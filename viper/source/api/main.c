#include<stdlib.h>
#include<stdio.h>
#include<viper/core/types/enums.h>
#include<viper/api/main.h>
#include<viper/core/memory/allocator.h>
#include<viper/core/debug/signaller.h>

int __ViperMain(int arc, char* const* arv) {
	if (0 != ViperSignalHandlerInit()) {
		puts("failed to init signal handlers");
	}

   ViperApplication_t* app = ViperMalloc(sizeof(ViperApplication_t));
   ViperApplicationCreateInfo_t* appConfig = ViperMalloc(sizeof(ViperApplicationCreateInfo_t));

   app->sType  = VIPER_STRUCT_TYPE_APPLICATION;
   app->argc   = arc;
   app->argv   = arv;
   app->state  = 0;

   if (0 != ViperSetup(appConfig)) {
   }

   // Freeing the ViperApplicationCreateInfo_t
   free(appConfig);

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
}
