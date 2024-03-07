#ifndef __header_viper_linux_signal__
#define __header_viper_linux_signal__

#include<signal.h>

#ifdef _WIN32

#include<windows.h>

#define SA_NOCLDSTOP    0x0001
#define SA_ONSTACK      0x0002
#define SA_RESETHAND    0x0004
#define SA_RESTART      0x0008
#define SA_SIGINFO      0x0010
#define SA_NOCLDWAIT    0x0020
#define SA_NODEFER      0x0040

typedef struct {
} siginfo_t;

struct sigaction {
   void(*sa_handler)(int sig);
   sigset_t sa_mask;
   int sa_flags;
   void(*sa_sigaction)(int sig, siginfo_t* info, void* ptr);
};

extern int sigaction(int sig, const struct sigaction* restrict act, struct sigaction* restrict oact);

#endif /* _WIN32 */

#endif /* __header_viper_linux_signal__ */
