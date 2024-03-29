#ifndef __header_viper_core_lua_math_stringer__
#define __header_viper_core_lua_math_stringer__

#include<lua.h>
#include<lauxlib.h>
#include<lualib.h>

/**
 * Wrapper function for the ViperUtoa function so it can
 * be called from Lua.
 */
extern int ViperLuaUtoa(lua_State* lua);

/**
 * Wrapper function for the ViperItoa function so it can
 * be called from Lua.
 */
extern int ViperLuaItoa(lua_State* lua);

/**
 * wrapper function for the ViperAtou function so it can
 * be called from Lua.
 */
extern int ViperLuaAtou(lua_State* lua);

#endif /* __header_viper_core_lua_maths_stringer__ */
