#include<viper/lua/init.h>

#include<stdatomic.h>

#include<lua.h>
#include<lualib.h>
#include<lauxlib.h>

#include<viper/threading/master.h>

#include<viper/lua/api/utils/integer.h>

static atomic_flag _accessingState;
static lua_State* _luaState;

int8_t LuaInit() {
   ViperThreadUnsafeVaribleAccess(_accessingState);

   _luaState = luaL_newstate();
   luaL_openlibs(_luaState);

   ViperThreadUnsafeVaribleRelease(_accessingState);

   return 0;
}

int8_t LuaUnload() {
   ViperThreadUnsafeVaribleAccess(_accessingState);
  
   lua_close(_luaState);

   ViperThreadUnsafeVaribleRelease(_accessingState);

   return 0;
}

/**
 * A very simple "hello, world" function made so
 * the 
 */
void LuaHelloWorld() {
   char* const hello = "print('Hello, World')";

   ViperThreadUnsafeVaribleAccess(_accessingState);
   
   if (LUA_OK == luaL_loadstring(_luaState, hello)) {
      if (LUA_OK == lua_pcall(_luaState, 0, 0, 0)) {
         // removing code form lua stack
         lua_pop(_luaState, lua_gettop(_luaState));
      }
   }


   ViperThreadUnsafeVaribleRelease(_accessingState);
}

void LuaLoadApi() {
   ViperThreadUnsafeVaribleAccess(_accessingState);
   
   lua_register(_luaState, "Itoa", ViperLuaApiItoa);
   
   ViperThreadUnsafeVaribleRelease(_accessingState);
}
