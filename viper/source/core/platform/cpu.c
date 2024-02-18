#include<string.h>

#include<viper/core/platform/cpu.h>

#include<viper/core/debug/logger.h>
#include<viper/core/file/file.h>

#include<fcntl.h>
#include<stdio.h>

i8 ViperCpuGetSpecs(ViperCpuSpec_t* spec) {
   ViperFile_t proc;
   char* ptr = NULL;

   if (0 != ViperFileOpenLoad(&proc, "/proc/cpuinfo", O_RDONLY, 0)) {
      ViperLogWarning("Failed to load /proc/cpuinfo");
      goto ERROR_EXIT;
   }

   ptr = strstr(proc.buffer.str, "vendor_id");

   if (NULL == ptr) {
      ViperLogWarning("No vendor ID found");
   } 

   printf("%s\n", ptr);

   return 0;
ERROR_EXIT:
   return -1;
}
