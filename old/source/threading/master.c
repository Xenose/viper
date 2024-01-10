#define _GNU_SOURCE
#include<sched.h>
#include<stdio.h>

#include<viper/types.h>
#include<viper/types/threading.h>
#include<viper/threading/master.h>
#include<viper/system/syscalls.h>

static uint64_t __taskCount = 0;
static uint64_t __taskCountOpenGL = 0;

// The task list is function needed to be executed
static ViperThreadTask_t* __tasks = NULL;
static ViperThreadTask_t* __tasksOpenGL = NULL;

// The workers avalible
static uint64_t __workerCount = 0;

void ExecuteAsync() {
	int processID = 0;

	//processID = clone(NULL, );

	if (-1 == processID) {
		return;
	}
}

void ViperThreadTaskAdd(int type, void (*func)(ViperApplication_t* app)) {
   ViperThreadTask_t* current = NULL;

   if (NULL == func) {
      ViperLogWarning("Tried to added NULL function");
      return;
   }

   if (VIPER_THREAD_TASK_OPENGL == type) {
      __tasksOpenGL = realloc(__tasksOpenGL, sizeof(ViperThreadTask_t) * ++__taskCountOpenGL);
      current = &__tasksOpenGL[__taskCountOpenGL - 1];
   } else {
      __tasks = realloc(__tasks, sizeof(ViperThreadTask_t) * (++__taskCount + 1));
      current = &__tasks[__taskCount - 1];
   }
   
   current->func = func;
}

/**
 * OpenGL can only run on one thread so this function
 * is used to make the OpenGL render pass.
 */
int ViperRenderLoopOpenGL2(void* ptr) {
   ViperApplication_t* app = ptr;
   ViperOpenGL_t* gl = app->opengl;


   for (int t = 0; t < __taskCountOpenGL; t++) {
      __tasksOpenGL[t].func(app);
   }

   glfwSwapBuffers(gl->window.data);
   app->applicationLoop(app);

   return 0;
}

int ViperThreadWorker(void* ptr) {
   ViperThreadWorker_t* me = ptr;

   while (1) {
      if (~VIPER_THREAD_TF_BUSY & me->flags) {
         continue;
      }

      if (NULL == me->task) {
         me->flags &= ~VIPER_THREAD_TF_BUSY;
         continue;
      }
      
      if (~VIPER_THREAD_TF_BUSY & me->task->flags) {
         continue;
      }

      //me->task->func(me->app);
      me->task->flags &= ~VIPER_THREAD_TF_BUSY;

      me->task = NULL;
      me->flags &= ~VIPER_THREAD_TF_BUSY;
   }

   return 0;
}


int ViperThreadCreateWorker(ViperThreadWorker_t* worker, int (*func)(void*), void* ptr) {
   __workerCount++;

   worker->pid = clone(
         func, 
         worker->stack + MEMORY_8KB,
         CLONE_VM,
         ptr
      );

   return worker->pid;
}

void ViperThreadForemanAssignTasks(ViperApplication_t* app, ViperThreadWorker_t* workers, int64_t workerCount, ViperThreadTask_t* tasks, int64_t taskCount) {
   for (int i = 0; i < taskCount; i++) {
      if (VIPER_THREAD_TF_BUSY & tasks[i].flags) {
         continue;
      }

      // the task assigning function
      for (int t = 0; t < workerCount; t++) {
         // if task is already happning no need to execute it again.
         if (VIPER_THREAD_TF_BUSY & workers[t].flags) {
            continue;
         }

         workers[t].task = &tasks[i];
         workers[t].app = app;

         tasks[i].flags |= VIPER_THREAD_TF_BUSY;
         workers[t].flags |= VIPER_THREAD_TF_BUSY;
      }
   }
}

/**
 * The foreman is the master of all workers, he oversee them
 * and schdule there taksks.
 *
 * @param app :: is the application struct
 * @param threadCount :: is the number of threads to create
 */
void ViperThreadTaskForeman(ViperApplication_t* app, int64_t threadCount) {
   ViperThreadWorker_t* workers = workers = calloc(1, sizeof(ViperThreadWorker_t) * threadCount);

   if (NULL == workers) {
      ViperLogError("malloc failed");
      return;
   }

   for (int i = 0; i < threadCount; i++) {
      workers[i].stack = malloc(MEMORY_8KB);
   }

   glfwMakeContextCurrent(app->opengl->window.data);

   //int pid = clone(ViperRenderLoopOpenGL2, __work), CLONE_VM, app);
   //ViperThreadCreateWorker(&__workers[0], &ViperRenderLoopOpenGL2, app);

   for (int i = 0; i < threadCount; i++) {
      int pid = ViperThreadCreateWorker(&workers[i], ViperThreadWorker, &workers[i]);

      if (-1 == pid) {
         ViperLogError("Failed to create thread");
      }
   }

   while (1) {
      glfwPollEvents();

      if (glfwWindowShouldClose(app->opengl->window.data)) {
         app->status = VIPER_APPLICATION_STATUS_EXIT;
      }

      ViperRenderLoopOpenGL2(app);
      //app->applicationLoop(app);

      ViperThreadForemanAssignTasks(app, workers, __workerCount, __tasks, __taskCount); 

   }
}
