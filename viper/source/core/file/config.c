#include<viper/core/file/config.h>
#include<viper/core/terminal/parser.h>
#include<viper/core/debug/logger.h>
#include<viper/core/file/file.h>
#include<viper/linux/limits.h>
#include<viper/core/string/stringer.h>

#include<string.h>

/**
 * ViperConfigRead is basically ViperCommandRead but instead of
 * reading commands it reads them from a file instead using the
 * long option only.
 *
 * @param com :: The same ViperCommands_t struct as ViperCommandRead.
 * @param file :: The config file
 *
 */
i8 ViperConfigRead(ViperCommands_t* restrict com, ViperFile_t* restrict file) {
   char* start = NULL;
   char* end = file->buffer.ptr;

   do {
      start = end;
      end = ViperStringGetLine(file->buffer.ptr);
      ViperLogDebug("%s", start);
   } while('\0' != *end);
   return 0;
}

i8 ViperConfigLocationsRead(ViperCommands_t* restrict com, cc* confPath) {
   cc* locations[] = {
      "~/.config/",
      "/etc/",
      "/usr/",
      "",
   };

   char fullpath[PATH_MAX + 1] = { 0 };
   ViperFile_t config = { 0 };
   i64 count = sizeof(locations) / sizeof(locations[0]);

   for (i64 i = 0; i < count; i++) {
      memset(fullpath, 0, PATH_MAX);

      strncpy(fullpath, locations[i], PATH_MAX);
      strncat(fullpath, confPath, PATH_MAX);

      if (0 == ViperFileOpenLoad(&config, fullpath, 0, 0)) {
         if (0 == ViperConfigRead(com, &config)) {
            ViperLogDebug("Configuration file loaded with success");
            goto EXIT;
         }

         ViperLogWarning("Failed to load config from [ %s ]", fullpath);
         ViperFileClose(&config);
      }
   }

EXIT:
   ViperFileClose(&config);
   return 0;
}
