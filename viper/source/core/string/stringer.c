#include<viper/core/string/stringer.h>

i8 __ViperStringIsMatch(cc* format, cc* input, i64 offsetFormat, i64 offsetInput) {
   switch (format[offsetFormat]) {
      case '\0':
         return '\0' == input[offsetInput];

      case '*':
         while ('\0' != input[offsetInput++]) {
            if (VIPER_TRUE == __ViperStringIsMatch(format, input, offsetFormat + 1, offsetInput)) {
               return VIPER_TRUE;
            }
         }
         
         return __ViperStringIsMatch(format, input, offsetFormat + 1, offsetInput);

      default:
         if (format[offsetFormat] != input[offsetInput]) {
            return VIPER_FALSE;
         }
   }

   return __ViperStringIsMatch(format, input, offsetFormat + 1, offsetInput + 1);
}

i8 ViperStringIsMatch(cc* format, cc* input) {
   return __ViperStringIsMatch(format, input, 0, 0);
}
