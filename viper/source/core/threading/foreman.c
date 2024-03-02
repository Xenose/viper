#define _GNU_SOURCE
#define GLEW_STATIC

#include<stdlib.h>
#include<errno.h>

#ifndef _WIN32
    #include<sched.h>
    #include<unistd.h>
#endif /* _WIN32 */

#include<GL/glew.h>

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

static int __ViperThreadingRenderOpenGL(void* ptr) {
   ViperApplication_t* app = ptr;
   ViperOpenGL_t* gl = app->opengl;

   glfwMakeContextCurrent(gl->window.window);

   if (GLEW_OK != glewInit()) {
      ViperLogError("Glew init failed");
      glfwTerminate();
      return -1;
   }

   while (1) {
      glClear(GL_COLOR_BUFFER_BIT);
      app->LoopOpenGL(app);
      glfwSwapBuffers(gl->window.window);
   }
}

i8 ViperThreadingForemanInit(u64 workerCount) {
   
   
   if (0 != ViperQueueCreate(&__foreman.tasks, 0, sizeof(ViperThreadingTask_t), 10)) {
      ViperLogFatal("Failed to create worker queue");
      return -1;
   }

   __foreman.workerCount = workerCount;
   __foreman.workers = calloc(workerCount, sizeof(ViperThreadingWorker_t));

   if (NULL == __foreman.workers) {
      ViperLogError("Failed to allocate workers [ count : %i ]", workerCount);
      return -1;
   }

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
   u64 i = 0;

   for (i = 0; i < __foreman.workerCount; i++) {
      
      ViperThreadingWorker_t worker = {
         .id = i + 1,
         .stack.topPtr = ViperCalloc(1, VIPER_MEMORY_8KB),
         .stack.bottomPtr = ((u8*)worker.stack.topPtr) + VIPER_MEMORY_8KB,
      };

      __foreman.workers[i] = worker;

      if (-1 == clone(__ViperThreadingWorker, worker.stack.bottomPtr, CLONE_THREAD | CLONE_SIGHAND | CLONE_FILES | CLONE_VM, &__foreman.workers[i])) {
         ViperLogFatal("Clone failed [ %e ]", errno);

         goto ERROR_EXIT;
      }
   }

   if (VIPER_APP_FLAG_USE_OPENGL & app->flags) {
      ViperLogDebug("Using OpenGL");
      void* stack = ViperCalloc(1, VIPER_MEMORY_64KB);

      if (-1 == clone(__ViperThreadingRenderOpenGL, ((u8*)stack) + VIPER_MEMORY_64KB, CLONE_THREAD | CLONE_SIGHAND | CLONE_FILES | CLONE_VM, app)) {
         ViperLogFatal("Clone failed [ %e ]", errno);
         goto ERROR_EXIT;
      }
   }

   // Reseting [ i ] doesn't relly matter do.
   i = 0;

   while(1 /*VIPER_APP_STATE_RUNNING == app->state*/) {
      ViperThreadingTask_t* task = ViperQueueGetNextItem(&__foreman.tasks);

      if (NULL == task) {
         continue;
      }

      if (VIPER_THREADING_TASK_ASSIGNED & task->flags) {
         continue;
      }

      if (i >= __foreman.workerCount) {
         i = 0;
      }

      while (i < __foreman.workerCount) {
         task->flags |= VIPER_THREADING_TASK_ASSIGNED;

         if (0 == ViperAtomicQueueInsertItem(&__foreman.workers[i].tasks, task)) {
            ViperLogDebug("assigning task!");
            break;
         }

         i++;
      }
   }

ERROR_EXIT:
   return 0;
}

