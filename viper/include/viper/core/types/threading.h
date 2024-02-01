#ifndef __header_viper_types_threading__
#define __header_viper_types_threading__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>
#include<viper/core/algorithm/queue.h>

#define VIPER_THREADING_TASK_BUSY			0x0001

typedef struct {
   ViperStructType_t sType;
   void* data;
   void (*func)(void* ptr);
	au64 flags;
} ViperThreadingTask_t;

typedef struct {
   ViperStructType_t sType;

   union {
      void* topPtr;
      u8* topDataPtr;
   };

   union {
      void* bottomPtr;
      u8* bottomDataPtr;
   };
} ViperThreadingStack_t;

typedef struct {
   ViperStructType_t sType;
 
   u64 id;
   ViperThreadingStack_t stack;
   ViperQueue_t tasks;
} ViperThreadingWorker_t;

typedef struct {
   ViperStructType_t sType;

   i64 workerCount;
   ViperQueue_t tasks;
   ViperQueue_t workers;
} ViperThreadingForeman_t;

#endif /* __threading_viper_types_threading__ */
