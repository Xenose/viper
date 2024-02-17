VIPER = VIPER or nil

local function HashBasicCalcTest(index, value, expected)
   local result = VIPER.HashBasicCalc(index, value)

   assert(expected == result, "Expected " ..
   tostring(expected) .. " we got " ..
   tostring(result))
end -- HashBasicCalcTest

print("[ LUA UTEST ] Executing ViperHashBasicCalc Lua Tests")

-- various
HashBasicCalcTest( 1, 10, 11264)
HashBasicCalcTest( 2, 10, 12288)
HashBasicCalcTest( 3, 10, 13312)
HashBasicCalcTest( 4, 10, 14336)
HashBasicCalcTest( 5, 10, 15360)
HashBasicCalcTest( 6, 10, 16384)
HashBasicCalcTest( 7, 10, 17408)
HashBasicCalcTest( 8, 10, 18432)
HashBasicCalcTest( 9, 10, 19456)
HashBasicCalcTest(10, 10, 20480)
