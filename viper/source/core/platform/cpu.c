#include<string.h>

#include<viper/core/platform/cpu.h>

#include<viper/core/debug/logger.h>
#include<viper/core/file/file.h>
#include<viper/core/string/stringer.h>

#include<fcntl.h>
#include<stdio.h>
#include<unistd.h>

i8 ViperCpuGetSpecs(ViperCpuSpec_t* spec) {
   ViperFile_t proc;
   char* ptr = NULL;
   u64 lenght = 0;

   char buffer[256] = { 0 };

   if (0 != ViperFileOpenLoad(&proc, "/proc/cpuinfo", O_RDONLY, 0)) {
      ViperLogWarning("Failed to load /proc/cpuinfo");
      goto ERROR_EXIT;
   }

   ptr = ViperStringFindDevider(strstr(proc.buffer.str, "vendor_id"), ':') + 1;

   char* tmp = ViperStringGetSub(ptr, &lenght);
   memcpy(buffer, tmp, lenght);
   ViperLogDebug(buffer);

   if (VIPER_TRUE == ViperStringIsMatch(buffer, "*AMD")) {
      ViperLogDebug("AMD cpu found");
   }

   if (NULL == ptr) {
      ViperLogWarning("No vendor ID found");
   } 


   return 0;
ERROR_EXIT:
   return -1;
}
