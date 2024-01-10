#include<viper/debug/logger.h>
#include<viper/io/printer.h>
#include<stdarg.h>

static int64_t __logLevelMax = VIPER_LOG_LEVEL_EMERGANCY;
static int64_t __logLevelMin = VIPER_LOG_LEVEL_DEBUG;

void __ViperLogger(ViperLogInfo_t info, const char* restrict format, ...) {
	va_list va;
	const char* logLevel = NULL;
	int64_t bufferUsed = 0;

	if (info.logLevel >= __logLevelMax && info.logLevel <= __logLevelMin) {
		return;
	}

	switch (info.logLevel) {
		case VIPER_LOG_LEVEL_DEBUG:
			logLevel = "DEBUG";
			break;
		case VIPER_LOG_LEVEL_INFO:
			logLevel = "INFO";
			break;
		case VIPER_LOG_LEVEL_NOTICE:
			logLevel = "NOTICE";
			break;
		case VIPER_LOG_LEVEL_WARNING:
			logLevel = "WARNING";
			break;
		case VIPER_LOG_LEVEL_ERROR:
			logLevel = "ERROR";
			break;
		case VIPER_LOG_LEVEL_CRITICAL:
			logLevel = "CRITICAL";
			break;
		case VIPER_LOG_LEVEL_ALERT:
			logLevel = "ALERT";
			break;
		case VIPER_LOG_LEVEL_EMERGANCY:
			logLevel = "EMERGANCY";
			break;
		default:
			return;
	}

	ViperBuffer_t buffer = {
		.bytes = 512,
		.ptr = calloc(sizeof(char), 512),
	};

	va_start(va, format);

	bufferUsed += ViperPrintNSBUF(VIPER_PRINT_STDERR, &buffer, bufferUsed, "[ %s ]%s",
			logLevel, "\n\n\tMessage: ");

	bufferUsed += ViperPrintNSBUFVA(VIPER_PRINT_STDERR, &buffer, bufferUsed, format, va);
	buffer.str[bufferUsed - 1] = '\n';
	ViperPrintFlush(VIPER_PRINT_STDERR, &buffer, bufferUsed);

	// cleaning up
	va_end(va);
	free(buffer.ptr);
}
