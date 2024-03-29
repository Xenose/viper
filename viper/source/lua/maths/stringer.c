
#include<viper/lua/maths/stringer.h>
#include<viper/core/maths/stringer.h>

#include<viper/core/debug/logger.h>

int ViperLuaUtoa(lua_State* lua) {
   u64 value = luaL_checkinteger(lua, 1);
   char* buffer = (char*)luaL_checkstring(lua, 2);
   u64 size = luaL_checkinteger(lua, 3);
   i64 base = luaL_checkinteger(lua, 4);

   u64 result = ViperUtoa(value, buffer, size, base);

   lua_pushinteger(lua, result);
   lua_pushstring(lua, buffer);
   return 2;
}

int ViperLuaItoa(lua_State* lua) {
   i64 value = luaL_checkinteger(lua, 1);
   char* buffer = (char*)luaL_checkstring(lua, 2);
   u64 size = luaL_checkinteger(lua, 3);
   i64 base = luaL_checkinteger(lua, 4);

   i64 result = ViperItoa(value, buffer, size, base);

   lua_pushinteger(lua, result);
   lua_pushstring(lua, buffer);
   return 2;
}

int ViperLuaAtou(lua_State* lua) {
   u64 value = 0;

   char* buffer = (char*)luaL_checkstring(lua, 1);
   u64 size = luaL_checkinteger(lua, 2);
   i64 base = luaL_checkinteger(lua, 3);

   i64 result = ViperAtou(&value, buffer, size, base);

   lua_pushinteger(lua, result);
   lua_pushinteger(lua, (i64)value);
   return 2;
}
