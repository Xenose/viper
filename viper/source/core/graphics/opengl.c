#include<GL/glew.h>
#include<fcntl.h>

#include<viper/core/debug/logger.h>
#include<viper/core/graphics/opengl.h>
#include<viper/core/file/file.h>

static inline int8_t __ViperCreateShaderOpenGL(u64* restrict shader, u64 type, ViperFile_t* restrict file) {
   i32 result = 0;
   i32 length = 0;

   if (NULL == file || NULL == shader) {
      goto ERROR_EXIT;
   }

   *shader = glCreateShader(type);

   length = file->buffer.length;
   glShaderSource(*shader, 1, (cc**)&file->buffer.str, &length);
   glCompileShader(*shader);

   glGetShaderiv(*shader, GL_COMPILE_STATUS, &result);

   if (GL_TRUE != result) {
      i32 logLength = 0;
      char log[1025] = { 0 };

      glGetShaderInfoLog(*shader, 1024, &logLength, log);
      ViperLogError("Shader failed to compile [ %s ]", log);
      goto ERROR_EXIT;
   }

   return 0;
ERROR_EXIT:
   return -1;
}

int8_t ViperCreateShaderOpenGL(ViperShader_t* restrict shader, const ViperShaderCreateInfo_t* restrict info) {
   ViperFile_t file = { 0 };

   i32 result = 0;

   u64 fragment      = 0;
   u64 vertex        = 0;
   u64 geometric     = 0;
   u64 tesselation   = 0;
   u64 compute       = 0;


   if (NULL == shader || NULL == info) {
      ViperLogError("NUll values provided");
      goto ERROR_EXIT;
   }

   shader->id = glCreateProgram();
   
   if (NULL != info->computePath) {
      if (0 != ViperFileOpenLoad(&file, info->computePath, O_RDWR, 0)) {
         ViperLogError("Failed to load compute shader [ %s ]", info->computePath);
         goto ERROR_EXIT;
      }

      if (0 != __ViperCreateShaderOpenGL(&compute, GL_COMPUTE_SHADER, &file)) {
         goto ERROR_EXIT;
      }

      glAttachShader(shader->id, compute);
      glLinkProgram(shader->id);
      goto EXIT;
   }

   if (NULL != info->geometricPath) {
      if (0 != ViperFileOpenLoad(&file, info->geometricPath, O_RDWR, 0)) {
         ViperLogError("Failed to load geometric shader [ %s ]", info->geometricPath);
         goto ERROR_EXIT;
      }

      if (0 != __ViperCreateShaderOpenGL(&geometric, GL_GEOMETRY_SHADER, &file)) {
         goto ERROR_EXIT;
      }
      
      glAttachShader(shader->id, geometric);
   }

   if (NULL != info->tesselationPath) {
      // TODO :: implement tesselation shader
   }

   // Non optional shaders if compute is not used
   if (0 != ViperFileOpenLoad(&file, info->fragmentPath, O_RDWR, 0)) {
      ViperLogError("Failed to load fragment shader [ %s ]", info->fragmentPath);
      goto ERROR_EXIT;
   }

   if (0 != __ViperCreateShaderOpenGL(&fragment, GL_FRAGMENT_SHADER, &file)) {
      goto ERROR_EXIT;
   }

   if (0 != ViperFileOpenLoad(&file, info->vertexPath, O_RDWR, 0)) {
      ViperLogError("Failed to load vertex shader [ %s ]", info->vertexPath);
      goto ERROR_EXIT;
   }

   if (0 != __ViperCreateShaderOpenGL(&vertex, GL_VERTEX_SHADER, &file)) {
      goto ERROR_EXIT;
   }
   
   glAttachShader(shader->id, fragment);
   glAttachShader(shader->id, vertex);
   glLinkProgram(shader->id);
EXIT:

   glGetProgramiv(shader->id, GL_LINK_STATUS, &result);

   if (GL_TRUE != result) {
      i32 logLength = 0;
      char log[1025] = { 0 };

      glGetShaderInfoLog(shader->id, 1024, &logLength, log);
      ViperLogError("Shader program failed to link [ %s ]", log);
      goto ERROR_EXIT;
   }

   return 0;
ERROR_EXIT:
   return -1;
}
