
#include<lua.h>
#include<lauxlib.h>
#include<lualib.h>

#include<string.h>

#include<viper/core/types/defines.h>
#include<viper/core/maths/stringer.h>
#include<viper/core/file/directory.h>
#include<viper/core/debug/logger.h>

#include<viper/linux/limits.h>

#include<viper/lua/maths/stringer.h>
#include<viper/lua/maths/hashes.h>

static const struct luaL_Reg viper_lib[] = {
   { "HashBasicCalc", ViperLuaHashBasicCalc },
   { "Itoa", ViperLuaItoa },
   { "Utoa", ViperLuaUtoa },
   { "Atou", ViperLuaAtou },
   { NULL, NULL }
};


i8 ViperExecuteUniteTests(cc* path) {
   char tmp[PATH_MAX + 1] = { 0 };
   u64 fileCount = 0;
   char** files = NULL;
   
   lua_State* state = luaL_newstate();

   // Setting up the LUA library
   luaL_openlibs(state);
  
   luaL_newlib(state, viper_lib);
   lua_setglobal(state, "VIPER");

   strncat(tmp, path, PATH_MAX);
   strncat(tmp, "/utest", PATH_MAX);

   files = ViperDirectorySearch(&fileCount, tmp, "*.lua", 0);

   if (NULL == files) {
      ViperLogNotice("No lua files found");
      goto ERROR_EXIT;
   }

   for (u64 i = 0; i < fileCount; i++) {
      if (0 != luaL_loadfile(state, files[i])) {
         ViperLogWarning("Could not load [ %s ] error [ %s ]", files[i], lua_tostring(state, -1));
      }

      if (0 != lua_pcall(state, 0, 0, 0)) {
         ViperLogError("Failed to execute [ %s ] error [ %s ]", files[i], lua_tostring(state, -1));
      }
   }

   ViperLogNotice("Unite tests completed");
   lua_close(state);
   return 0;
ERROR_EXIT_CLOSE_LUA:
   lua_close(state);
ERROR_EXIT:
   return -1;
}
