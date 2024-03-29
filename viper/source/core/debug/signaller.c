#include<signal.h>
#include<stdio.h>

#ifndef _WIN32
	#include<bits/types/siginfo_t.h>
	#include<execinfo.h>
#endif

#include<viper/core/debug/signaller.h>

#ifdef _WIN32

i8 ViperSignalHandlerInit() {
	return 0;
}

#else

void __ViperSingalHandler(int sig, siginfo_t* info, void* ptr) {
	void* ptrs[25] = { 0 };

	switch(sig) {
		case SIGILL:
		case SIGSEGV:
			backtrace(ptrs, 25);
			backtrace_symbols_fd(ptrs, 25, 2);
			break;
	}

	signal(sig, SIG_DFL);
	raise(sig);
}

i8 ViperSignalHandlerInit() {
	struct sigaction action = { 0 };
	
	action.sa_flags = SA_SIGINFO,
	action.sa_sigaction = &__ViperSingalHandler,

	sigaction(SIGSEGV, &action, NULL);
	sigaction(SIGILL, &action, NULL);
	return 0;
}

#endif /* _WIN32 */
