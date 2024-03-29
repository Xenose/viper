#include<viper/core/string/stringer.h>
#include<viper/core/debug/logger.h>

#include<stdlib.h>
#include<stdio.h>
#include<ctype.h>

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

i8 ViperStringCompare(cc* restrict s0, cc* restrict s1) {
   while (*s0 == *s1) {
      if (0 == *s0) {
         return 1;
      }

      ++s0;
      ++s1;
   }

   return 0;
}

char* ViperStringFindDevider(char* str, char chr) {
   while (chr != *str && '\0' != *str) {
      ++str;
   }

   return str;
}

cc* ViperStringFindNonNumeric(cc* str, u64 length, cc* valid, u64 validLength) {
	i8 tr = 1; // tr == true
	char* cpy = (char*)str;

	if (NULL == str) {
		goto ERROR_EXIT;
	}

	while (tr) {
		tr = 0;

		if ('\0' == *cpy) {
			break;
		}

		for (u64 i = 0; i < validLength; i++) {
			if (valid[i] == *cpy) {
				++cpy;
				tr = 1;
				break;
			}
		}
	}

	return cpy;
ERROR_EXIT:
	return str;

}

char* ViperStringGetSub(char* str, u64* lenght) {
   char* out = NULL;

   if (NULL == str) {
      goto ERROR_EXIT;
   }

   while(' ' == *str || '\t' == *str) {
      ++str;
   }

   out = str;

   while(' ' != *str && '\t' != *str && '\0' != *str && '\n' != *str) {
      ++*lenght;
      ++str;
   }

ERROR_EXIT:
   return out;
}

char* ViperStringGetLine(cc* str) {
   while ('\n' != *str && '\0' != *str) ++str;
   return (char*)str;
}
