#ifndef __header_viper_core_types_terminal__
#define __header_viper_core_types_terminal__

#include<viper/core/types/defines.h>

typedef struct {
   uint64_t count;
   uint64_t* flags;
   char*    singleChar;
   char**   command;
   char**   descriptions;
   void*    ptrs;
   char*    args;
   void (*func)(cc* command, cc* arg);
} ViperCommands_t;

#endif /* __header_viper_core_types_terminal__ */
