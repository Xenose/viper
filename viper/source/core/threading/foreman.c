#define _GNU_SOURCE
#include<stdlib.h>
#include<sched.h>
#include<errno.h>
#include<unistd.h>

#include<viper/core/algorithm/queue.h>
#include<viper/core/threading/foreman.h>
#include<viper/core/debug/logger.h>
#include<viper/core/io/printer.h>
#include<viper/core/memory/allocator.h>
#include<viper/core/types/memory.h>

static ViperThreadingForeman_t __foreman = { 0 };

static int __ViperThreadingWorker(void* ptr) {
   ViperApplication_t* app = NULL;
   ViperThreadingWorker_t* me = ptr;

   const char* message = "None";

   if (0 != ViperAtomicQueueCreate(&me->tasks, 0, sizeof(ViperThreadingTask_t), 10)) {
      message = "Failed to create queue";
      goto ERROR_EXIT;
   }

   while (1 /*VIPER_APP_STATE_RUNNING == app->state*/) {
      ViperThreadingTask_t* task = ViperAtomicQueueGetNextItem(&me->tasks);

      if (NULL == task) {
         continue;
      }

      if (!(VIPER_THREADING_TASK_ASSIGNED & task->flags)) {
         continue;
      }

      task->func(task->data);
   }
   return 0;
ERROR_EXIT:
   ViperLogFatal("%s", message);
   return -1;
}

i8 ViperThreadingForemanInit(u64 workerCount) {
   if (0 != ViperQueueCreate(&__foreman.workers, 0, sizeof(ViperThreadingWorker_t), workerCount)) {
      ViperLogFatal("Failed to create worker queue");
      return -1;
   }
   
   if (0 != ViperQueueCreate(&__foreman.tasks, 0, sizeof(ViperThreadingTask_t), 10)) {
      ViperLogFatal("Failed to create worker queue");
      return -1;
   }

   __foreman.workerCount = workerCount;

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

i64 ViperThreadingForemanStart(ViperApplication_t* app) {
   for (int i = 0; i < __foreman.workerCount; i++) {
      ViperThreadingWorker_t worker = { 0 };

      worker.stack.topPtr = ViperCalloc(1, VIPER_MEMORY_8KB);
      worker.stack.bottomPtr = worker.stack.topPtr + VIPER_MEMORY_8KB;

      worker.id = i + 1;
      
      ViperQueueInsertItem(&__foreman.workers, &worker);

      if (-1 == clone(__ViperThreadingWorker, worker.stack.bottomPtr, CLONE_FILES | CLONE_VM, ViperQueueGetNextItem(&__foreman.workers))) {
         ViperLogFatal("Clone failed [ %e ]", errno);

         goto ERROR_EXIT;
      }
   }

   while(1 /*VIPER_APP_STATE_RUNNING == app->state*/) {
      ViperThreadingTask_t* task = ViperQueueGetNextItem(&__foreman.tasks);

      if (NULL == task) {
         continue;
      }

      if (VIPER_THREADING_TASK_ASSIGNED & task->flags) {
         continue;
      }

      for (u64 i = 0; i < __foreman.workerCount; i++) {
         ViperThreadingWorker_t* worker = ViperQueueGetNextItem(&__foreman.workers);
         ViperAtomicQueueInsertItem(&worker->tasks, task);
         task->flags |= VIPER_THREADING_TASK_ASSIGNED;
      }
   }

ERROR_EXIT:
   return 0;
}

