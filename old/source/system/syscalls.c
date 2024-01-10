#include<sys/syscall.h>

#include<viper/system/syscalls.h>

int64_t ViperSyscallClone(struct clone_args* args) {
   return syscall(SYS_clone3, args, sizeof(struct clone_args));
}
