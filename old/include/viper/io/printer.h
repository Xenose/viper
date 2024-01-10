#ifndef __header_printer__
#define __header_printer__

#include<stdlib.h>
#include<string.h>

#include<viper/types.h>

#define VIPER_PRINT_STDOUT 1
#define VIPER_PRINT_STDERR 2

extern int64_t ViperPrintFlush(int stream, ViperBuffer_t* buffer, int64_t used);

extern int64_t ViperPrintNSBUFVA(int stream, ViperBuffer_t* buffer, int64_t used, const char* format, va_list va);
extern int64_t ViperPrintNSBFVA(int stream, ViperBuffer_t* buffer, const char* format, va_list va);
extern int64_t ViperPrintSBFVA(int stream, ViperBuffer_t* buffer, const char* format, va_list va);
extern int64_t ViperPrintSFVA(int stream, const char* format, va_list va);
extern int64_t ViperPrintFVA(const char* format, va_list va);

extern int64_t ViperPrintNSBUF(int stream, ViperBuffer_t* buffer, int64_t used, const char* format, ...);
extern int64_t ViperPrintNSBF(int stream, ViperBuffer_t* buffer, const char* format, ...);
extern int64_t ViperPrintSF(int stream, const char* format, ...);
extern int64_t ViperPrintF(const char* format, ...);

extern int64_t ViperPrint(const char* msg);
#endif /* __header_printer__ */
