VIPER = VIPER or nil

local function AtouTest(value, base)
   local buffer = tostring(value)
   local result, val = VIPER.Atou(buffer, string.len(buffer), base)

   assert(0 == result, "Atou returned a error for " .. tostring(value))
   assert(value == val, "value and val are not the same [ " ..
      tostring(value) .. " != " .. tostring(val) .. " ]")
end -- AtouTest

print("[ LUA UTEST ] Executing itoa Lua Tests")

-- various 
-- AtouTest(0, 10)

AtouTest(2, 10)
AtouTest(10, 10)
AtouTest(1000, 10)
