#ifndef __header_viper_core_debug_exceptions__
#define __header_viper_core_debug_exceptions__

#include<setjmp.h>

#include<viper/core/types/defines.h>
#include<viper/core/types/exceptions.h>

#define ViperTry(EXCEPTION) \
   __ViperJumpSignalHandlerInit(); \
   if (0 == (EXCEPTION.error = sigsetjmp(__ViperJumpGetNextBuffer())))

#define ViperCatch \
   else if (-2 == __ViperJumpIndexDecrease(1)) { __ViperJumpIndexDecrease(1) } else

#define ViperThrow(NUM) \
   __ViperJump(NUM)

extern i64 __ViperJumpIndexDecrease(i64 i);
extern i64 __ViperJumpIndexIncrease(i64 i);
extern sigjmp_buf* __ViperJumpGetBuffer();
extern sigjmp_buf* __ViperJumpGetNextBuffer();
extern void __ViperJump(i32 error);

extern i8 __ViperJumpSignalHandlerInit();

/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define Try    ViperTry
#define Catch  ViperCatch
#define Throw  ViperThrow

#endif /* VIPER_USE_NAMESPACE */

#endif /* __header_viper_core_debug_exceptions__ */       
