VIPER = VIPER or nil

local function ItoaTest(value, size, base)
   local buffer = string.rep(" ", size)
   local result, bufout = VIPER.Itoa(value, buffer, size, base)

   assert(string.len(tostring(value)) + 1 == result, "Expected " ..
   string.len(tostring(value)) .. " characters written got " ..
   result)

   assert(value == tonumber(bufout), "Expected value to be '0'")
end -- ItoaTest

print("[ LUA UTEST ] Executing utoa Lua Tests")

-- various 
ItoaTest(-1000, 256, 10)
ItoaTest(-1, 256, 10)

ItoaTest(0, 256, 10)

ItoaTest(2, 256, 10)
ItoaTest(10, 256, 10)
ItoaTest(1000, 256, 10)
