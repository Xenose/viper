#ifndef __header_exceptions_debug__
#define __header_exceptions_debug__

#include<viper/macros/include.h>

#include<setjmp.h>
#include<signal.h>

extern __thread int __viperJumpIndex;
extern __thread sigjmp_buf __viperJumpBuffers[256];

extern void __ViperInternalSignalHandler(int sig);

/**
 * This macro function will set the jump buffer to
 * the current line or if the signal/throw was called
 * it will return false and continue to ViperCatch.
 *
 * @note Currently used signals are : SIGSEGV
 */
#define ViperTry signal(SIGSEGV, &__ViperInternalSignalHandler); if (0 == sigsetjmp(__viperJumpBuffers[++__viperJumpIndex], 1))

/**
 * ViperCatch will return if either a signal or throw was
 * used, the if before this should never be executed it
 * is just a way to update the index without any
 * extra macros.
 */
#define ViperCatch else if (-2 == __viperJumpIndex--) { __viperJumpIndex++; } else

/**
 * ViperThrow is used when you want to throw and error,
 * longjmp will be called and you can log the error.
 */
#define ViperThrow() siglongjmp(__viperJumpBuffers[__viperJumpIndex], -1);


#endif /* __header_exceptions_debug__ */
