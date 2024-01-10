#ifndef __header_viper_core_debug_logger__
#define __header_viper_core_debug_logger__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>
#include<viper/core/types/logger.h>

#define ViperLog(level, format, ...) ViperLogFunction(level, __LINE__, __FILE__, __func__, format, ##__VA_ARGS__)

#define ViperLogDebug(format, ...)       ViperLog(VIPER_LOG_LEVEL_DEBUG,      format, ##__VA_ARGS__)
#define ViperLogInfo(format, ...)        ViperLog(VIPER_LOG_LEVEL_INFO,       format, ##__VA_ARGS__)
#define ViperLogNotice(format, ...)      ViperLog(VIPER_LOG_LEVEL_NOTICE,     format, ##__VA_ARGS__)
#define ViperLogWarning(format, ...)     ViperLog(VIPER_LOG_LEVEL_WARNING,    format, ##__VA_ARGS__)
#define ViperLogError(format, ...)       ViperLog(VIPER_LOG_LEVEL_ERROR,      format, ##__VA_ARGS__)
#define ViperLogFatal(format, ...)       ViperLog(VIPER_LOG_LEVEL_FATAL,      format, ##__VA_ARGS__)
#define ViperLogEmergancy(format, ...)   ViperLog(VIPER_LOG_LEVEL_EMERGANCY,  format, ##__VA_ARGS__)

extern void ViperLogFunction(u32 logLevel, i64 line, cc* file, cc* function, cc* format, ...);

extern void ViperLogEnableLevel(u32 flag);
extern void ViperLogDisableLevel(u32 flag);

#endif /* __header_viper_core_debug_logger__ */
