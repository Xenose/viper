#include<stdarg.h>
#include<stdlib.h>
#include<string.h>
#include<limits.h>

#include<viper/core/debug/logger.h>
#include<viper/core/io/printer.h>

#define BUFFER_SIZE 2048

// TODO later only warning level and above should be logged
au32 __viperLogLevel =
   VIPER_LOG_LEVEL_DEBUG      |
   VIPER_LOG_LEVEL_INFO       |
   VIPER_LOG_LEVEL_NOTICE     |
   VIPER_LOG_LEVEL_WARNING    |
   VIPER_LOG_LEVEL_ERROR      |
   VIPER_LOG_LEVEL_FATAL      |
   VIPER_LOG_LEVEL_ALERT      |
   VIPER_LOG_LEVEL_CRITICAL   |
   VIPER_LOG_LEVEL_EMERGENCY  ;

inline void ViperLogFunction(u32 logLevel, i64 line, cc* file, cc* function, cc* format, ...) {
   char buffer[BUFFER_SIZE] = { 0 };
   va_list args;
   cc* level = NULL;
   u64 used = 0;

   switch (logLevel & __viperLogLevel ? logLevel : INT_MAX) {
      case VIPER_LOG_LEVEL_DEBUG:
         level = "[ \033[90mDEBUG\033[0m     ]";
         goto PRINT_DATA;

      case VIPER_LOG_LEVEL_INFO:
         level = "[ \033[96mINFO\033[0m      ]";
         goto PRINT_DATA;

      case VIPER_LOG_LEVEL_NOTICE:
         level = "[ \033[36mNOTICE\033[0m    ]";
         goto PRINT_DATA;

      case VIPER_LOG_LEVEL_WARNING:
         level = "[ \033[93mWARNING\033[0m   ]";
         goto PRINT_DATA;

      case VIPER_LOG_LEVEL_ERROR:
         level = "[ \033[33mERROR\033[0m     ]";
         goto PRINT_DATA;

      case VIPER_LOG_LEVEL_FATAL:
         level = "[ \033[91mFATAL\033[0m     ]";
         goto PRINT_DATA;

      case VIPER_LOG_LEVEL_ALERT:
         level = "[ \033[31mALERT\033[0m     ]";
         goto PRINT_DATA;

      case VIPER_LOG_LEVEL_CRITICAL:
         level = "[ \033[35mCRITICAL\033[0m  ]";
         goto PRINT_DATA;

      case VIPER_LOG_LEVEL_EMERGENCY:
         level = "[ \033[95mEMERGENCY\033[0m ]";
         goto PRINT_DATA;
   }

   // EXIT when no data is printed.
   return;
PRINT_DATA:
   va_start(args, format);

   ViperPrintNSFB(2, "%s File [ %s ] Line [ %i ] Function [ %s ] Message : ",
         buffer, BUFFER_SIZE, &used,
         level, file, line, function
      );

   ViperPrintVNSFB(2, format, buffer, BUFFER_SIZE, &used, args);
   buffer[used++] = '\n';

   ViperPrintFlush(2, buffer, used);
   va_end(args);
}

void ViperLogEnableLevel(u32 flag) {
   atomic_store(&__viperLogLevel, atomic_load(&__viperLogLevel) | flag);
}


void ViperLogDisableLevel(u32 flag) {
   atomic_store(&__viperLogLevel, atomic_load(&__viperLogLevel) & ~flag);
}

