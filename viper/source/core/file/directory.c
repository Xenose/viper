#include<dirent.h>
#include<errno.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>

#include<viper/core/file/directory.h>
#include<viper/core/debug/logger.h>
#include<viper/core/string/stringer.h>
#include<viper/core/memory/allocator.h>

static char** __ViperDirectorySearch(char** restrict ptr, u64* restrict count, cc* restrict path, cc* restrict format, u64 flags) {
   int length = 0;
   void* p = NULL;
   char tmp[PATH_MAX + 1] = { 0 };
   
   DIR* dir = opendir(path);

   if (NULL == dir) {
      ViperLogWarning("Failed to open directory [ %s ] errno [ %e ]", path, errno);
      goto ERROR_EXIT;
   }

   for (struct dirent* c = readdir(dir); NULL != c; c = readdir(dir)) {
      switch (c->d_type) {
         
         case DT_DIR: // recursive search
            if (VIPER_DIRECTORY_SEARCH_NOSUB & flags ||
                  0 == strcmp(c->d_name, ".") ||
                  0 == strcmp(c->d_name, "..")) {
               // ignore sub directories
               continue;
            }

            strncat(tmp, path, PATH_MAX);
            strncat(tmp, "/", PATH_MAX);
            strncat(tmp, c->d_name, PATH_MAX);

            ptr = __ViperDirectorySearch(ptr, count, tmp, format, flags);
            
            memset(tmp, 0, PATH_MAX);
            continue;

         case DT_REG: // file found
            if (VIPER_FALSE == ViperStringIsMatch(format, c->d_name)) {
               // file is no match
               continue;
            }
            
            strncat(tmp, path, PATH_MAX);
            strncat(tmp, "/", PATH_MAX);
            strncat(tmp, c->d_name, PATH_MAX);

            p = ViperRealloc(ptr, ((*count) + 1) * sizeof(char*));

            if (NULL == p) {
               ViperLogError("Failed to allocate memory [ %e ]", errno);
               goto ERROR_EXIT_CLOSE_DIR;
            }

            ptr = p;
            ptr[*count] = ViperStringDuplicate(tmp);
            ++*count;
            
            memset(tmp, 0, PATH_MAX);
            continue;

         case DT_UNKNOWN:
            strncat(tmp, path, PATH_MAX);
            strncat(tmp, "/", PATH_MAX);
            strncat(tmp, c->d_name, PATH_MAX);

            ViperLogNotice("Unknown file found [ %s ]", tmp);

            memset(tmp, 0, PATH_MAX);
            continue;
      }
   }

ERROR_EXIT_CLOSE_DIR:
   closedir(dir);
ERROR_EXIT:
   return ptr;
}

char** ViperDirectorySearch(u64* restrict count, cc* restrict path, cc* restrict format, u64 flags) {
   *count = 0; 
   return __ViperDirectorySearch(NULL, count, path, format, flags);
}

char* ViperDirectoryProgram() {
   char path[PATH_MAX + 1] = { 0 };

   if (NULL == getcwd(path, PATH_MAX)) {
      ViperLogError("Failed to retrive program path [ %e ]", errno);
      goto ERROR_EXIT;
   }

   return ViperStringDuplicate(path);
ERROR_EXIT:
   return NULL;
}


