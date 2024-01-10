#ifndef __header_viper_threading_types__
#define __header_viper_threading_types__

#include<viper/types/typedefs.h>
#include<viper/types/structs.h>
#include<viper/types.h>

#include<viper/types.h>

#define VIPER_THREAD_FLAG_BUSY 0x0001

#define VIPER_THREAD_TF_BUSY 0x0001

enum {
   VIPER_THREAD_TASK_NONE,
   VIPER_THREAD_TASK_OPENGL,
   VIPER_THREAD_TASK_RENDERING,
   VIPER_THREAD_TASK_PHYSICS,
   VIPER_THREAD_TASK_NETWORK,
   VIPER_THREAD_TASK_FILEIO,
};

typedef struct {
   ViperStructType_t sType;
   atomic_uint_least64_t flags;
   int64_t task;

   void (*func)(ViperApplication_t* app);
   void* data;
} ViperThreadTask_t;

typedef struct {
   ViperStructType_t sType;
   atomic_uint_least64_t flags;
   
   int8_t* stack;
   int64_t pid;

   ViperApplication_t* app;
   ViperThreadTask_t* task;
} ViperThreadWorker_t;


#endif /* __header_viper_threading_types__ */
