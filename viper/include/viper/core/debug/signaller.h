#ifndef __header_viper_core_debug_signaller__
#define __header_viper_core_debug_signaller__

#include<viper/core/types/defines.h>

extern i8 ViperSignalHandlerInit();

/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define SingalHandlerInit ViperSignalHandlerInit

#endif /* VIPER_USE_NAMESPACE */

#endif /* __header_viper_core_debug_signaller__ */
