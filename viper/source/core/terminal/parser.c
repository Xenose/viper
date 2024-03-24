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
#include<viper/core/io/printer.h>

i8 ViperCommandAdd(ViperCommands_t* restrict com, cc shortOpt, cc* restrict longOpt, cc* restrict description, i64 (func)(cc* opts, u64 count, void*), void* ptr) {
   void* tmp = NULL;
   u64 count = com->count + 1;

   tmp = ViperRealloc(com->commands, count * sizeof(ViperCommandEntries_t));

   if (NULL == tmp) {
      goto ERROR_EXIT;
   }

   com->commands = tmp;

   /* Assigning all the data to the new struct */
   com->commands[com->count].shortOpt =      shortOpt;
   com->commands[com->count].longOpt =       strdup(longOpt);
   com->commands[com->count].description =   strdup(description);
   com->commands[com->count].func =          func;

   com->count = count;
   ViperLogDebug("added command [ short : %c ] [ long : %s ]", shortOpt, longOpt);

   return 0;
ERROR_EXIT:
   return -1;
}

void ViperCommandDelete(ViperCommands_t* restrict commands) {
   for (u64 i = 0; i < commands->count; i++) {
      free(commands->commands[i].longOpt);
      free(commands->commands[i].description);
   }

   free(commands->commands);

   /* Resetting the struct for reuse */
   commands->commands = NULL;
   commands->count = 0;
}

i8 ViperCommandPrintUsage(ViperCommands_t* com) {

   ViperPrintF("\033[H\033[2JUsage of the terminal commands\n");

   for (uint64_t i = 0; i < com->count; i++) {
      ViperPrintF("\t\t%c %s : %s\n",
            com->commands[i].shortOpt, com->commands[i].longOpt, com->commands[i].description);
   }

   return 0;
}

i8 ViperCommandLongExecute(ViperCommands_t* com, cc* args) {
   for (u64 i = 0; i < com->count; i++) {
      if (0 == strcmp(com->commands[i].longOpt, &args[2])) {
         ViperLogDebug("command found");
         if (NULL != com->commands[i].func) {
            com->commands[i].func(0, NULL, NULL);
         }
         return 0;
      }
   }

   return -1;
}

i8 ViperCommandShortExecute(ViperCommands_t* com, cc* arg) {
   for (u64 j = 0; '\0' != arg[j]; j++) {
   }
}

i8 ViperCommandRead(ViperCommands_t* com, u64 argc, cc** args) {
   for (uint64_t i = 1; i < argc; i++) {
      ViperLogDebug("Reading command [ %s ]", args[i]);

      if ('-' == args[i][0]) {
         if ('-' == args[i][1]) {
            ViperLogDebug("Long command");
            ViperCommandLongExecute(com, args[i]);
            continue;
         }


         ViperLogDebug("Short command");
         continue;
      }

      goto ERROR_EXIT;
   }

   return 0;
ERROR_EXIT:
   ViperCommandPrintUsage(com);
   return -1;
}
