#ifndef __header_viper_core_types_terminal__
#define __header_viper_core_types_terminal__

#include<viper/core/types/defines.h>

typedef struct {
   ViperStructType_t sType;
   char shortOpt;
   char* longOpt;
   char* description;
   i64 (*func)(cc* opts, u64 count, void* data);
} ViperCommandEntries_t;

typedef struct {
   ViperStructType_t sType;
   u64 count;
   ViperCommandEntries_t* commands;
} ViperCommands_t;

#endif /* __header_viper_core_types_terminal__ */
