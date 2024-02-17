#include<viper/core/maths/hashes.h>
#include<viper/lua/maths/hashes.h>

int ViperLuaHashBasicCalc(lua_State* lua) {
   u64 c = luaL_checkinteger(lua, 1);
   u64 index = luaL_checkinteger(lua, 2);


   u64 result = ViperHashBasicCalc(index, c);

   lua_pushinteger(lua, result);
   return 1;
}
