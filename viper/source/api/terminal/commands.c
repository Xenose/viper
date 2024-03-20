#include<viper/api/terminal/commands.h>

#include<viper/core/debug/logger.h>

i64 ViperTerminalCommandDryrun(cc* restrict args, u64 count, void* restrict ptr) {
   ViperApplication_t* app = ptr;

   ViperLogNotice("Hello from the ViperTerminalCommandDryrun function!");

   return 0;
}
