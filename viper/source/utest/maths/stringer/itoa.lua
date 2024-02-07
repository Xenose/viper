local viper = require("viper")

local value = 0;
local buffer = string.rep(" ", 10)
local size = 10
local base = 10

local result, bufout = viper.ViperItoa(value, buffer, size, base)

assert(2 == result, "Expected 2 characters written")
assert("0" == bufout, "Expected value to be '0'")

