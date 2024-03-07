#define _GNU_SOURCE
#include<stdlib.h>
#include<string.h>


#include<viper/linux/limits.h>
#include<viper/linux/dlfcn.h>


#include<viper/core/platform/dynamic_loading.h>
#include<viper/core/memory/allocator.h>
#include<viper/core/debug/logger.h>


void* ViperLibraryLoad(ViperGenericDynamicLibrary_t* library, cc* fallbackPath, cc* func) {
   const char* libPath = getenv("LD_LIBRARY_PATH");
   void* ptr = NULL;
   char path[PATH_MAX + 1] = { 0 };

   if (NULL == library->_handle) {
      ViperLogDebug("Library %s is null, starting handle aquasition", library->libName);

      if (NULL != libPath) for (char* p = memccpy(path, libPath, PATH_MAX, ':'); p != NULL; p = memccpy(path, libPath, PATH_MAX, ':')) {
         strncat(path, "/", PATH_MAX);
         strncat(path, library->libName, PATH_MAX);

         library->_handle = dlopen(library->libName, RTLD_GLOBAL | RTLD_LAZY);

         if (NULL != library->_handle) {
            goto SKIP;
         }

         memset(path, 0, PATH_MAX); 
      }

      if (NULL == library->_handle) {
         if (NULL == library->libName) {
            ViperLogError("Library name is NULL");
            goto ERROR_EXIT;
         }

         memset(path, 0, PATH_MAX); 
         stpncpy(path, fallbackPath, PATH_MAX);
         strncat(path, "/", PATH_MAX);
         strncat(path, library->libName, PATH_MAX);

         library->_handle = dlopen(library->libName, RTLD_NOW);
      }

SKIP:
      if (NULL == library->_handle) {
         ViperLogError("Failed to open library [ %s ]", library->libName);
         goto ERROR_EXIT;
      }
   }

   ptr = dlsym(library->_handle, func);

   if (NULL == ptr) {
      ViperLogError("Failed to load function [ %s ] with error [ %s ]", func, dlerror());
   }

ERROR_EXIT:
   return ptr;
}
