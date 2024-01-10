#ifndef __header_thread_master__
#define __header_thread_master__

#include<viper.h>
#include<viper/types/threading.h>

#define ViperThreadUnsafeVaribleAccess(flag) while (atomic_flag_test_and_set_explicit(&(flag), memory_order_acquire)) {};
#define ViperThreadUnsafeVaribleRelease(flag) atomic_flag_clear_explicit(&(flag), memory_order_release)

#define ViperUnsafeStructAccess(data) while (atomic_flag_test_and_set_explicit(&(data.locked), memory_order_acquire)) {};
#define ViperUnsafeStructRelease(data) atomic_flag_clear_explicit(&(data.locked), memory_order_release)

extern void ViperThreadTaskAdd(int type, void (*func)(ViperApplication_t* app));
extern void ViperThreadTaskForeman(ViperApplication_t* app, int64_t threadCount);

#endif /* __header_thread_master__ */
