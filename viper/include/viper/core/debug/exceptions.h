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

extern i32 __ViperJumpIndexDecrease(i32 i);
extern i32 __ViperJumpIndexIncrease(i32 i);
extern sigjmp_buf* __ViperJumpGetBuffer();
extern sigjmp_buf* __ViperJumpGetNextBuffer();
extern void __ViperJump(i32 error);

extern i32 __ViperJumpSignalHandlerInit();

#endif /* __header_viper_core_debug_exceptions__ */       
