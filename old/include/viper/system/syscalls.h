#ifndef __header_viper_syscalls_system__
#define __header_viper_syscalls_system__

#include<stdint.h>
#include<linux/sched.h>
#include<sched.h>
#include<unistd.h>

extern int64_t ViperSyscallClone(struct clone_args* args);

#endif /* __header_viuper_syscalls_system__ */
