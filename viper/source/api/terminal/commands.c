#include<viper/api/terminal/commands.h>

#include<viper/core/debug/logger.h>
#include<viper/core/test/unit_tests.h>
#include<viper/core/file/directory.h>

#include<stdlib.h>

i64 ViperTerminalCommandDryrun(cc* restrict args, u64 count, void* restrict ptr) {
   ViperApplication_t* app = ptr;

   ViperLogNotice("Hello from the ViperTerminalCommandDryrun function!");

   return 0;
}

i64 ViperTerminalCommandUnitTest(cc* restrict args, u64 count, void* restrict ptr) {
   char* path = ViperDirectoryProgram();

   if (NULL == path) {
      ViperLogError("Failed to retrive program path for the unit tests!");
      goto ERROR_EXIT;
   }

   exit(ViperExecuteUniteTests(path));

ERROR_EXIT:
   return -1;
}

i64 ViperTerminalCommandEnableLogLevels(cc* restrict args, u64 count, void* restrict ptr) {
   return 0;
}

i64 ViperTerminalCommandDisableLogLevels(cc* restrict args, u64 count, void* restrict ptr) {
   return 0;
}
