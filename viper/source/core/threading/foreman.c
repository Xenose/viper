#define _GNU_SOURCE
#include<stdlib.h>
#include<sched.h>
#include<errno.h>
#include<unistd.h>

#include<viper/core/algorithm/queue.h>
#include<viper/core/threading/foreman.h>
#include<viper/core/debug/logger.h>

static ViperThreadingForeman_t __foreman = { 0 };

static int __ViperThreadingWorker(void* ptr) {
   ViperApplication_t* app = NULL;
   ViperThreadingWorker_t* me = ptr;

   while (1 /*VIPER_APP_STATE_RUNNING == app->state*/) {
   }
   return 0;
}

i8 ViperThreadingForemanInit(u64 workerCount) {
   if (0 != ViperQueueCreate(&__foreman.workers, 0, sizeof(ViperThreadingWorker_t), workerCount)) {
      ViperLogFatal("Failed to create worker queue");
      return -1;
   }

   return 0;
}

i64 ViperThreadingForemanStart(ViperApplication_t* app) {
   ViperThreadingWorker_t* current = NULL;

   for (int i = 0; i < __foreman.workerCount; i++) {
      current = ViperQueueGetNextItem(&__foreman.workers);
      current->stack.topPtr = calloc(1, 16192);
      current->stack.bottomPtr = current->stack.topPtr + 16192;

      current->id = i + 1;

      if (-1 == clone(__ViperThreadingWorker, current->stack.bottomPtr, CLONE_FILES | CLONE_VM, current)) {
         ViperLogFatal("Clone failed [ %e ]", errno);
         goto ERROR_EXIT;
      }
   }

   while(1 /*VIPER_APP_STATE_RUNNING == app->state*/) {
   }

ERROR_EXIT:
   return 0;
}

i8 ViperThreadingForemanAddTask(ViperThreadingTask_t* const task) {
   if (0 != ViperQueueInsertItemExpand(&__foreman.tasks, task)) {
      ViperLogWarning("Failed to add task");
      goto ERROR_EXIT;
   }

   return 0;
ERROR_EXIT:
   return -1;
}

