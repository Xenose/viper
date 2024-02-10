#include<string.h>
#include<stdio.h>
#include<GL/glew.h>
#include<viper/core/string/opengl.h>

inline u64 ViperToSrringGlew(i64 e, char* buffer, u64 size) {
   cc* tmp = (cc*)glewGetErrorString(e);
   i64 length = strlen(tmp);

   if (length >= size) {
      goto ERROR_EXIT;
   }

   memcpy(buffer, tmp, length);
   return length;
ERROR_EXIT:
   return 0;
}

inline u64 ViperToStringOpenglEnum(i64 e, char* buffer, u64 size) {
   switch (e) {
      case GL_NO_ERROR:
         if (11 > size) {
            break;
         }
         memcpy(buffer, "GL_NO_ERROR",  11);
         return 11;

      case GL_INVALID_ENUM:
         if (15 > size) {
            break;
         }

         memcpy(buffer, "GL_INVALID_ENUM",  15);
         return 15;

      case GL_INVALID_VALUE:
         if (16 > size) {
            break;
         }

         memcpy(buffer, "GL_INVALID_VALUE",  16);
         return 16;

      case GL_INVALID_OPERATION:
         if (20 > size) {
            break;
         }

         memcpy(buffer, "GL_INVALID_OPERATION",  20);
         return 20;

      case GL_STACK_OVERFLOW:
         if (17 > size) {
            break;
         }

         memcpy(buffer, "GL_STACK_OVERFLOW",  17);
         return 17;

      case GL_STACK_UNDERFLOW:
         if (18 > size) {
            break;
         }

         memcpy(buffer, "GL_STACK_UNDERFLOW",  18);
         return 18;

      case GL_OUT_OF_MEMORY:
         if (16 > size) {
            break;
         }

         memcpy(buffer, "GL_OUT_OF_MEMORY",  16);
         return 16;

      case GL_INVALID_FRAMEBUFFER_OPERATION:
         if (32 > size) {
            break;
         }

         memcpy(buffer, "GL_INVALID_FRAMEBUFFER_OPERATION",  32);
         return 32;

      case GL_CONTEXT_LOST:
         if (15 > size) {
            break;
         }

         memcpy(buffer, "GL_CONTEXT_LOST",  15);
         return 15;

      case GL_TABLE_TOO_LARGE:
         if (18 > size) {
            break;
         }

         memcpy(buffer, "GL_TABLE_TOO_LARGE",  18);
         return 18;

   }

   return 0;
} /* ToStringOpenGLEnum */
