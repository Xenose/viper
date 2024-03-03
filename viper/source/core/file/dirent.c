#include<viper/core/file/dirent.h>

#ifdef _WIN32

   DIR* opendir(cc* path) {
      return NULL;
   }

   struct dirent* readdir(DIR* dir) {
      return NULL;
   }
   
   int closedir(DIR* dir) {
      return 0;
   }
#endif /* _WIN32 */
