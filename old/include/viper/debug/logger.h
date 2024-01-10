#ifndef __header_logger__
#define __header_logger__

#include<viper/types.h>
#include<viper/io/printer.h>

#define ViperLogEmergancy(...) 	__ViperLogger((ViperLogInfo_t)	{ .logLevel = VIPER_LOG_LEVEL_EMERGANCY }, 	__VA_ARGS__)
#define ViperLogAlert(...) 		__ViperLogger((ViperLogInfo_t)	{ .logLevel = VIPER_LOG_LEVEL_ALERT }, 		__VA_ARGS__)
#define ViperLogCritical(...) 	__ViperLogger((ViperLogInfo_t)	{ .logLevel = VIPER_LOG_LEVEL_CRITICAL }, 	__VA_ARGS__)
#define ViperLogError(...) 		__ViperLogger((ViperLogInfo_t)	{ .logLevel = VIPER_LOG_LEVEL_ERROR }, 		__VA_ARGS__)
#define ViperLogWarning(...)	 	__ViperLogger((ViperLogInfo_t)	{ .logLevel = VIPER_LOG_LEVEL_WARNING }, 		__VA_ARGS__)
#define ViperLogNotice(...) 		__ViperLogger((ViperLogInfo_t)	{ .logLevel = VIPER_LOG_LEVEL_NOTICE }, 		__VA_ARGS__)
#define ViperLogInfo(...) 			__ViperLogger((ViperLogInfo_t)	{ .logLevel = VIPER_LOG_LEVEL_INFO }, 			__VA_ARGS__)
#define ViperLogDebug(...) 		__ViperLogger((ViperLogInfo_t)	{ .logLevel = VIPER_LOG_LEVEL_DEBUG }, 		__VA_ARGS__) 

typedef struct {
	ViperStructType_t sType;
	int64_t logLevel;
	const char* format;
} ViperLogInfo_t;

enum {
	VIPER_LOG_LEVEL_DEBUG,
	VIPER_LOG_LEVEL_INFO,
	VIPER_LOG_LEVEL_NOTICE,
	VIPER_LOG_LEVEL_WARNING,
	VIPER_LOG_LEVEL_ERROR,
	VIPER_LOG_LEVEL_CRITICAL,
	VIPER_LOG_LEVEL_ALERT,
	VIPER_LOG_LEVEL_EMERGANCY,
};


extern void __ViperLogger(ViperLogInfo_t info, const char* format, ...);

#endif /* __header_types__ */
