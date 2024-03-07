#include<stdlib.h>
#include<stdio.h>
#include<string.h>

#include<viper/linux/getopt.h>

#include<viper/core/types/enums.h>
#include<viper/api/main.h>
#include<viper/core/memory/allocator.h>
#include<viper/core/debug/signaller.h>
#include<viper/core/debug/logger.h>

#include<viper/core/terminal/parser.h>
#include<viper/core/test/unit_tests.h>
#include<viper/core/file/directory.h>

#include<viper/core/types/terminal.h>

static struct option __viperOptions[] = {
   { "viper-dryrun",             no_argument,         0, 0 },
   { "viper-unit-tests",         no_argument,         0, 0 },
   { "viper-enable-log-levels",  required_argument,   0, 0 },
   { "viper-disable-log-levels", required_argument,   0, 0 },
   { 0 },
};

i8 ViperInternalCommandParser(ViperApplication_t* app, int arc, char* const* arv) {
   char* tmp = NULL;
   int index = 0;
   int opt = -1;

LOOP:
   opt = getopt_long(arc, arv, "", __viperOptions, &index);

   if (-1 == opt) {
      ViperLogDebug("Exiting command parser");
      goto EXIT;
   }

   switch (opt) {
      case 0:

         /**
          * Puts the egnine into dryrun mode meaning that the main
          * loop will exit without any change of state, the loop will
          * at least run once.
          */
         if (0 == strcmp("viper-dryrun", __viperOptions[index].name)) {
            goto LOOP;
         } /* viper-dryrun */

         if (0 == strcmp("viper-unit-tests", __viperOptions[index].name)) {
            char* wp = ViperDirectoryProgram();
            ViperExecuteUniteTests(wp);
            ViperFree(wp);
            exit(0);
         } /* viper-unit-tests */
         
         /**
          * This command option enables the engine log level.
          */
         if (0 == strcmp("viper-enable-log-levels", __viperOptions[index].name)) {
            tmp = optarg;

            while ('\0' != *tmp && ' ' != *tmp) {
               switch (*tmp) {
                  case 'd': ViperLogEnableLevel(VIPER_LOG_LEVEL_DEBUG);       break;
                  case 'i': ViperLogEnableLevel(VIPER_LOG_LEVEL_INFO);        break;
                  case 'n': ViperLogEnableLevel(VIPER_LOG_LEVEL_NOTICE);      break;
                  case 'w': ViperLogEnableLevel(VIPER_LOG_LEVEL_WARNING);     break;
                  case 'e': ViperLogEnableLevel(VIPER_LOG_LEVEL_ERROR);       break;
                  case 'c': ViperLogEnableLevel(VIPER_LOG_LEVEL_CRITICAL);    break;
                  case 'f': ViperLogEnableLevel(VIPER_LOG_LEVEL_FATAL);       break;
                  case 'a': ViperLogEnableLevel(VIPER_LOG_LEVEL_ALERT);       break;
                  case 'E': ViperLogEnableLevel(VIPER_LOG_LEVEL_EMERGENCY);   break;
               }
               ++tmp;
            }
            goto LOOP;
         } /* viper-enable-log-level */
         
         /**
          * This command option disables the engine log level.
          */
         if (0 == strcmp("viper-disable-log-levels", __viperOptions[index].name)) {
            tmp = optarg;

            if (NULL == tmp) {
               goto LOOP;
            }

            while ('\0' != *tmp && ' ' != *tmp) {
               switch (*tmp) {
                  case 'd': ViperLogDisableLevel(VIPER_LOG_LEVEL_DEBUG);       break;
                  case 'i': ViperLogDisableLevel(VIPER_LOG_LEVEL_INFO);        break;
                  case 'n': ViperLogDisableLevel(VIPER_LOG_LEVEL_NOTICE);      break;
                  case 'w': ViperLogDisableLevel(VIPER_LOG_LEVEL_WARNING);     break;
                  case 'e': ViperLogDisableLevel(VIPER_LOG_LEVEL_ERROR);       break;
                  case 'c': ViperLogDisableLevel(VIPER_LOG_LEVEL_CRITICAL);    break;
                  case 'f': ViperLogDisableLevel(VIPER_LOG_LEVEL_FATAL);       break;
                  case 'a': ViperLogDisableLevel(VIPER_LOG_LEVEL_ALERT);       break;
                  case 'E': ViperLogDisableLevel(VIPER_LOG_LEVEL_EMERGENCY);   break;
               }
               ++tmp;
            }
            goto LOOP;
         } /* viper-diable-log-level */

         break;
   } /* switch(opt) */

   goto LOOP; // parser is not done jumping back

EXIT:
   return 0;
} /* ViperInternalCommandParser */

static ViperCommands_t __viperCommands = { 0 };

i8 ViperCommandAdd(cc signleChar, cc* command, cc* descriptions, void* ptr) {
   void* tmp = NULL;
   u64 count = __viperCommands.count + 1;

   tmp = realloc(__viperCommands.command, count * sizeof(char**));

   if (NULL == tmp) {
      goto ERROR_EXIT;
   }

   tmp = realloc(__viperCommands.singleChar, count * sizeof(char*));

   if (NULL == tmp) {
      goto ERROR_EXIT;
   }
   
   return 0;
ERROR_EXIT:
   return -1;
}

i8 ViperCommandPrintUsage() {
   for (uint64_t i = 0; i < __viperCommands.count; i++) {
      ViperLogNotice(" %s %s ",
            __viperCommands.singleChar, __viperCommands.command);
   }

   return 0;
} 

i8 ViperCommandRead(u64 argc, cc* args) {
   for (uint64_t i = 0; i < argc; i++) {
      if ('-' != args[i]) {
         goto ERROR_EXIT;
      }

      if ('-' == args[i + 1]) {
      }
   }

   return 0;
ERROR_EXIT:
   ViperCommandPrintUsage();
   return -1;
}
