#include<stdarg.h>
#include<stdlib.h>

#include<viper/core/debug/logger.h>
#include<viper/core/io/printer.h>

#define BUFFER_SIZE 4096

__thread char __viperLogBuffer[BUFFER_SIZE] = { 0 };
__thread u64 __viperLogBufferUsed = 0;

// TODO later only warning level and above should be logged
au32 __viperLogLevel =
   VIPER_LOG_LEVEL_DEBUG      |
   VIPER_LOG_LEVEL_INFO       |
   VIPER_LOG_LEVEL_NOTICE     |
   VIPER_LOG_LEVEL_WARNING    |
   VIPER_LOG_LEVEL_ERROR      |
   VIPER_LOG_LEVEL_CRITICAL   |
   VIPER_LOG_LEVEL_EMERGENCY  
   ;

inline void ViperLogFunction(u32 logLevel, i64 line, cc* file, cc* function, cc* format, ...) {
   va_list args;
   cc* level = NULL;

   if (logLevel & __viperLogLevel) switch (logLevel) {
      case VIPER_LOG_LEVEL_DEBUG:
         level = "[ \033[32mDEBUG\033[0m ]";
         goto PRINT_DATA;
      case VIPER_LOG_LEVEL_INFO:
         level = "[ INFO ]";
         goto PRINT_DATA;
      case VIPER_LOG_LEVEL_NOTICE:
         level = "[ NOTICE ]";
         goto PRINT_DATA;
      case VIPER_LOG_LEVEL_WARNING:
         level = "[ WARNING ]";
         goto PRINT_DATA;
      case VIPER_LOG_LEVEL_ERROR:
         level = "[ \033[31mERROR\033[0m ]";
         goto PRINT_DATA;
      case VIPER_LOG_LEVEL_CRITICAL:
         level = "[ CRITICAL ]";
         goto PRINT_DATA;
      case VIPER_LOG_LEVEL_ALERT:
         level = "[ ALERT ]";
         goto PRINT_DATA;
      case VIPER_LOG_LEVEL_EMERGENCY:
         level = "[ EMERGENCY ]";
         goto PRINT_DATA;
   }

   // EXIT when no data is printed.
   return;
   
PRINT_DATA:
   va_start(args, format);

   ViperPrintNSFB(2, "\t%s File [ %s ] Line [ %i ] Function [ %s ] Message : ", 
         __viperLogBuffer, BUFFER_SIZE, &__viperLogBufferUsed,
         level, file, line, function
      );

   ViperPrintVNSFB(2, format, __viperLogBuffer, BUFFER_SIZE, &__viperLogBufferUsed, args);
   __viperLogBuffer[__viperLogBufferUsed++] = '\n';

   ViperPrintFlush(2, __viperLogBuffer, __viperLogBufferUsed);

   va_end(args);
}

void ViperLogEnableLevel(u32 flag) {
   atomic_store(&__viperLogLevel, atomic_load(&__viperLogLevel) | flag);
}


void ViperLogDisableLevel(u32 flag) {
   atomic_store(&__viperLogLevel, atomic_load(&__viperLogLevel) & ~flag);
}

