#ifndef __header_viper_core_foreman__
#define __header_viper_core_foreman__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>
#include<viper/core/types/threading.h>
#include<viper/core/types/enums.h>
#include<viper/core/types/application.h>

/**
 */
extern i8 ViperThreadingForemanInit(u64 workerCount);

/**
 */
extern i8 ViperThreadingForemanAddTask(ViperThreadingTask_t* const task);

/**
 */
extern i64 ViperThreadingForemanStart(ViperApplication_t* app);


/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define ThreadingForemanInit     ViperThreadingForemanInit
#define ThreadingForemanAddTask  ViperThreadingForemanAddTask
#define ThreadingForemanStart    ViperThreadingForemanStart

#endif /* VIPER_USE_NAMESPACE */


#endif /* __header_viper_core_foreman__ */
