#include<stdlib.h>
#include<signal.h>
#include<viper/core/debug/exceptions.h>

__thread i64 __viperJumpIndex = 0;

__thread struct sigaction __oldSigactions[256] = { 0 };
__thread sigjmp_buf __sigjmp_buffers[256] = { 0 };

static void __ViperJumpSignalHandler(int signal, siginfo_t* action, void* data) {
   sigaction(SIGSEGV, &__oldSigactions[__viperJumpIndex], NULL);

   switch (signal) {
      case SIGSEGV:
         siglongjmp(__sigjmp_buffers[__viperJumpIndex], VIPER_EXCEPTION_SIGSEGV);
         break;
   }
}

inline i64 __ViperJumpIndexDecrease(i32 i) {
   return __viperJumpIndex -= i;
}

/**
 * Increase the jump index with the i value.
 *
 * @param i : A integer value will be added
 * to the index.
 */
inline i64 __ViperJumpIndexIncrease(i32 i) {
   return __viperJumpIndex += i;
}

/**
 * Gets the current jump buffer.
 */
inline sigjmp_buf* __ViperJumpGetBuffer() {
   return &__sigjmp_buffers[__viperJumpIndex];
}

/**
 * Used to retrive a new jump buffer for the
 * sigsetjmp that will not be currently in use.
 */
inline sigjmp_buf* __ViperJumpGetNextBuffer() {
   return &__sigjmp_buffers[++__viperJumpIndex];
}

inline void __ViperJump(i32 error) {
   siglongjmp(*__ViperJumpGetBuffer(), error);
}

/**
 * This function is used internally to set the signal
 * handler in catching mode for the try/catch block.
 */
i8 __ViperJumpSignalHandlerInit() {
   struct sigaction newSigaction = {
      .sa_sigaction = &__ViperJumpSignalHandler,
      .sa_flags = SA_SIGINFO,
   };

   if (-1 == sigaction(SIGSEGV, &newSigaction, &__oldSigactions[__viperJumpIndex])) {
      goto ERROR_EXIT;
   }
   return 0;
ERROR_EXIT:
   // TODO :: return more errors
   return -1;
}
