VIPER = VIPER or nil

local function HashBasicCalcTest(index, value, expected)
   local result = VIPER.HashBasicCalc(index, value)

   assert(expected == result, "Expected " ..
   tostring(expected) .. " we got " ..
   tostring(result))
end -- HashBasicCalcTest

print("[ LUA UTEST ] Executing ViperHashBasicCalc Lua Tests")

-- various tests
HashBasicCalcTest( 1, 9, 2560)
HashBasicCalcTest( 2, 9, 2816)
HashBasicCalcTest( 3, 9, 3072)
HashBasicCalcTest( 4, 9, 3328)
HashBasicCalcTest( 5, 9, 3584)
HashBasicCalcTest( 6, 9, 3840)
HashBasicCalcTest( 7, 9, 4096)
HashBasicCalcTest( 8, 9, 4352)
HashBasicCalcTest( 9, 9, 4608)
HashBasicCalcTest(10, 9, 4864)

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

