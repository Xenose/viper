#include<lua.h>
#include<lauxlib.h>
#include<lualib.h>

#include<viper/core/types/defines.h>
#include<viper/core/maths/stringer.h>

#include"../lua/maths/stringer.c"

static const struct luaL_Reg viper[] = {
   { "ViperItoa", ViperLuaItoa },
   { NULL, NULL }
};

LUAMOD_API i8 luaopen_viper(cc* path) {
   lua_State* state = luaL_newstate();

   luaL_openlibs(state);
   luaL_newlib(state, viper);

   return 0;
}

i8 ViperExecuteUniteTests(cc* path) {
   return luaopen_viper(path);
}
