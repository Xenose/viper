#include<viper/core/memory/allocator.h>
#include<viper/core/file/dirent.h>
#include<viper/core/debug/logger.h>

#ifdef _WIN32
    #include<Windows.h>
#endif /* _WIN32 */

#ifdef _WIN32

   DIR* opendir(cc* path) {
       char buffer[MAX_PATH] = { 0 };
       DIR* out = ViperCalloc(1, sizeof(DIR));

       if (NULL == out) {
           ViperLogError("Failed to allocate memory");
           goto ERROR_EXIT;
       }

       strncpy(buffer, path, MAX_PATH);
       strncat(buffer, "\\*", MAX_PATH);

       return out;
ERROR_EXIT:
       return NULL;
   }

   struct dirent* readdir(DIR* dir) {
      return NULL;
   }
   
   int closedir(DIR* dir) {
      return 0;
   }
#endif /* _WIN32 */
