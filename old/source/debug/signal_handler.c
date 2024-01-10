#include<execinfo.h>
#include<bits/types/siginfo_t.h>
#include<signal.h>

#include<unistd.h>
#include<viper/debug/signal_handler.h>
#include<viper/debug/logger.h>

static inline void __ViperSingalHandlerSEGSEGV() {
	int lenght = 100;
	void* address[lenght];

	ViperLogEmergancy("Segmentation Fault dumping stack...\n");

	lenght = backtrace(address, lenght);
	backtrace_symbols_fd(address, lenght, STDOUT_FILENO);
}

static void __ViperSingalHandler(int sig) {
	switch (sig) {
		case SIGSEGV:
			__ViperSingalHandlerSEGSEGV();
		break;
	}

	signal(sig, SIG_DFL);
	raise(sig);
}

void ViperInitSignalHandler() {
	signal(SIGSEGV, &__ViperSingalHandler);
}
