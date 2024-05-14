#ifndef __header_viper_api_main__
#define __header_viper_api_main__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>
#include<viper/core/types/application.h>

extern i64 ViperSetup(ViperApplicationCreateInfo_t* app);
extern i64 ViperMain(ViperApplication_t* app);

#ifdef VIPER_USE_LIBRARY_MAIN
   extern int __ViperMain(int arc, char* const* arv);
   
   int main(int arc, char* const* arv) {
      return __ViperMain(arc, arv);
   }

   /**
   * This maybe is a good idea as I don't want to use
   * special names for my application, but not there
   * might be a conflict in future projects so this
   * macro will allow me to turn off the prefix.
   */
   #ifdef VIPER_USE_NAMESPACE
   #define Main ViperMain
   #endif /* VIPER_USE_NAMESPACE */
#endif /* VIPER_USE_LIBRARY_MAIM */

#endif /* __header_viper_api_main__ */
