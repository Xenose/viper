#include "viper/debug/signal_handler.h"
#include<viper/debug/logger.h>
#include<setjmp.h>
#include<stdint.h>
#include<signal.h>
#include<execinfo.h>
#include<stdatomic.h>
#include<viper/debug/exceptions.h>

/** Thread local varible to store the current try/catch index. */
__thread int __viperJumpIndex = -1;
/** 
 * The buffers holding the information to restore the function flow. 
 * @note A buffer 256 should be enough for any unit tests.
 */
__thread sigjmp_buf __viperJumpBuffers[256] = { 0 };


/**
 * Internal signal handler for exceptions,
 * it will recive signals and then excute a
 * long jump to the previous function.
 *
 * @param sig :: signal
 *
 * @note This function will restore the
 * libraray signal handler acfter execution.
 */
void __ViperInternalSignalHandler(int sig) {
	if (0 == __viperJumpIndex) {
		ViperInitSignalHandler();
	}

	switch (sig) {
		case SIGSEGV:
			siglongjmp(__viperJumpBuffers[__viperJumpIndex], -1);
			break;
	}
}
