#ifndef __header_viper_core_io_printer__
#define __header_viper_core_io_printer__

#include<stdarg.h>
#include<viper/core/types/defines.h>

extern i64 ViperPrintFlush(i64 stream, char* buffer, u64 bufferSize);

extern i64 ViperPrintVNSFB(i64 stream, const char* fomrat, char* buffer, u64 bufferSize, u64* restrict bufferUsed, va_list args);
extern i64 ViperPrintVSFB(i64 stream, const char* fomrat, char* buffer, u64 bufferSize, u64* restrict bufferUsed, va_list args);
extern i64 ViperPrintVSF(i64 stream, const char* format, va_list args);
extern i64 ViperPrintVF(const char* format, va_list args);

extern i64 ViperPrintNSFB(i64 stream, const char* fomrat, char* buffer, u64 bufferSize, u64* restrict bufferUsed, ...);
extern i64 ViperPrintSFB(i64 stream, const char* fomrat, char* buffer, u64 bufferSize, u64* restrict bufferUsed, ...);
extern i64 ViperPrintSF(i64 stream, const char* format, ...);
extern i64 ViperPrintF(const char* format, ...);

/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define PrintF ViperPrintF

#endif /* VIPER_USE_NAMESPACE */

#endif /* __header_viper_core_io_printer__ */
