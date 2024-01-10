#ifndef __header_viper_api_integer_utils__
#define __header_viper_api_integer_utils__

#include<stdint.h>

#include<lua.h>
#include<lualib.h>
#include<lauxlib.h>

#include<viper/utils/integer.h>
#include<viper/debug/logger.h>

int ViperLuaApiItoa(lua_State* luaState) {
   int64_t value = luaL_checkinteger(luaState, 1);
   int64_t memory = luaL_checkinteger(luaState, 2);
   int32_t base = luaL_checkinteger(luaState, 3);

   char* buffer = calloc(memory, sizeof(char));

   if (-1 == ViperItoa(value, buffer, memory, base)) {
      ViperLogError("Lua script failed to use ViperItoa");
   }

   lua_pushstring(luaState, buffer);
   free(buffer);

   return 1;
}

#endif /* __header_viper_api_integer_utils__ */
