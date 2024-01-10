#include<viper/core/threading/foreman.h>

static ViperThreadingForeman_t viperForeman = { 0 };

i64 ViperThreadingWoker(void* ptr) {
   ViperApplication_t* app = NULL;

   while (VIPER_APP_STATE_RUNNING == app->state) {
   }
   return 0;
}

i64 ViperThreadingForemanStart(ViperApplication_t* app) {

   while(VIPER_APP_STATE_RUNNING == app->state) {
   }

   return 0;
}

i64 ViperThreadingAddWork(void* ptr) {
   return 0;
}
