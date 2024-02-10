#include<viper/core/platform/io.h>
#include<viper/core/io/printer.h>
#include<viper/core/maths/stringer.h>

// helper functions
#include<viper/core/platform/error.h>

// testing avx instructions
#include<viper/core/string/copy.h>
#include<viper/core/string/opengl.h>

#include<stdio.h>
#include<unistd.h>
#include<string.h>

#define BUFFER_SIZE 2048

static __thread char __viperPrintBuffer[BUFFER_SIZE] = { 0 };

void __ViperPrintMemory(i64* total, i64 stream, const char* restrict format, char* buffer, u64 bufferSize, u64* restrict bufferUsed, va_list args) {
   u8* data = va_arg(args, u8*);
   i64 length = va_arg(args, i64);

   for (i64 i = 0; i < length; i++) {
      if (16 > data[i]) {
         buffer[*bufferUsed] = '0';
         ++(*bufferUsed);
      }

      *bufferUsed += ViperItoa(data[i], &buffer[*bufferUsed], bufferSize - *bufferUsed, 16);
      buffer[*bufferUsed] = ' ';
      ++(*bufferUsed);
   }
}

/**
 */
void __ViperPrinterParseString(i64* total, i64 stream, cc* restrict format, char* buffer, u64 bufferSize, u64* restrict bufferUsed, va_list args) {
LOOP:
   if (bufferSize <= (*bufferUsed) + 1) {
      ViperPrintFlush(stream, buffer, *bufferUsed);
      *total += *bufferUsed;
      *bufferUsed = 0;
   }

   switch(*format) {
      case '%':
         switch (*(++format)) {
            case '%':
               buffer[*bufferUsed] = '%';
               ++(*bufferUsed);
               break;
            case 'b': // binary to string
               break;
            case 'e': // errno to string
               *bufferUsed += ViperErrnoToBuffer(va_arg(args, int), &buffer[*bufferUsed], bufferSize - *bufferUsed);
               break;
            case 'f':
               break;
            case 'g':
               *bufferUsed += ViperToStringOpenglEnum(va_arg(args, i64), &buffer[*bufferUsed], bufferSize - *bufferUsed);
               break;
            case 'G':
               *bufferUsed += ViperToSrringGlew(va_arg(args, i64), &buffer[*bufferUsed], bufferSize - *bufferUsed);
               break;
            case 'i':
               *bufferUsed += ViperItoa(va_arg(args, i64), &buffer[*bufferUsed], bufferSize - *bufferUsed, 10);
               break;
            case 'm':
               __ViperPrintMemory(total, stream, format, buffer, bufferSize, bufferUsed, args);
               break;
            case 's':
               *bufferUsed += ViperStpnCpy(&buffer[*bufferUsed], va_arg(args, char*), bufferSize - *bufferUsed);
               break;
            case 'x':
               break;
         }
         ++format;
         goto LOOP;
      case '$':
         ++format;
         goto LOOP;
      case '\0':
         break;
      default:
         buffer[*bufferUsed] = *format;
         ++format;
         ++(*bufferUsed);
         goto LOOP;
   }
}

// flush buffer functions
inline i64 ViperPrintFlush(i64 stream, char* buffer, u64 bufferSize) {
   ViperWrite(stream, buffer, bufferSize);
   return 0;
}

// va_list functions
inline i64 ViperPrintVNSFB(i64 stream, const char* restrict format, char* restrict buffer, u64 bufferSize, u64* restrict bufferUsed, va_list args) {
   i64 total = 0;
   __ViperPrinterParseString(&total, stream, format, buffer, bufferSize, bufferUsed, args);
   return total;
}

inline i64 ViperPrintVSFB(i64 stream, const char* restrict format, char* restrict buffer, u64 bufferSize, u64* restrict bufferUsed, va_list args) {
   i64 total = ViperPrintVNSFB(stream, format, buffer, bufferSize, bufferUsed, args);
   ViperPrintFlush(stream, buffer, *bufferUsed);
   return total;
}

inline i64 ViperPrintVSF(i64 stream, const char* restrict format, va_list args) {
   u64 used = 0;
   return ViperPrintVSFB(stream, format, __viperPrintBuffer, BUFFER_SIZE, &used, args);
}

inline i64 ViperPrintVF(const char* format, va_list args) {
   return ViperPrintVSF(1, format, args);
}

// Non va_list functions
inline i64 ViperPrintNSFB(i64 stream, const char* restrict format, char* restrict buffer, u64 bufferSize, u64* restrict bufferUsed, ...) {
   i64 out = 0;
   va_list args;

   va_start(args, bufferUsed);
   out = ViperPrintVNSFB(stream, format, buffer, bufferSize, bufferUsed, args);
   va_end(args);

   return out;
}

inline i64 ViperPrintSFB(i64 stream, const char* restrict format, char* restrict buffer, u64 bufferSize, u64* restrict bufferUsed, ...) {
   va_list args;

   va_start(args, bufferUsed);
   ViperPrintVSFB(stream, format, buffer, bufferSize, bufferUsed, args);
   va_end(args);

   return ViperPrintFlush(stream, buffer, *bufferUsed);
}

inline i64 ViperPrintSF(i64 stream, const char* format, ...) {
   i64 out = 0;
   va_list args;

   va_start(args, format);
   out = ViperPrintVSF(stream, format, args);
   va_end(args);

   return out;
}

inline i64 ViperPrintF(const char* format, ...) {
   i64 out = 0;
   va_list args;

   va_start(args, format);
   out = ViperPrintVF(format, args);
   va_end(args);

   return out;
}
