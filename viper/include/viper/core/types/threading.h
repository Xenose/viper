#ifndef __header_viper_types_threading__
#define __header_viper_types_threading__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>
#include<viper/core/algorithm/queue.h>

#define VIPER_THREADING_TASK_ASSIGNED     0x0001
#define VIPER_THREADING_TASK_ONE_TIME     0x0002

typedef struct {
   ViperStructType_t sType;
   
	au64 flags;
   
   void* data;
   void (*func)(void* ptr);
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
   ViperAtomicQueue_t tasks;
} ViperThreadingWorker_t;


typedef struct {
   ViperStructType_t sType;

   u64 workerCount;
   ViperThreadingWorker_t* workers;
   
   ViperQueue_t tasks;
} ViperThreadingForeman_t;

#endif /* __threading_viper_types_threading__ */
