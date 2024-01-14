
workspace "ViperEngine"
   configurations { "Debug", "Release", "Windows" }
   location "build"

project "ViperEngine"
   location "build"
   kind "StaticLib"
   language "C"
   includedirs { "viper/include" }
   buildoptions{ "-mavx2 -mbmi2 -mpopcnt -mfma -mcx16 -mtune=znver1 -msse -msse2 -msse3 -msse4.1 -msse4.2 -mssse3 -mavx -mavx2 -mfma -mavx512f -mavx512dq -mavx512cd -mavx512bw -mavx512vl" }
   
   files { "viper/include/**.h", "viper/source/**.c" }

   filter { "configurations:Debug" }
      defines { "DEBUG" }
      symbols "On"

   filter { "configurations:Release" }
      defines { "NDEBUG" }
      optimize "On"

   filter { "configurations:Windows"}
      defines { "NDEBUG" }
      optimize "On"

project "ViperEgnineExampleBasic"
   location "build"
   kind "ConsoleApp"
   language "C"
   links { "m", "ViperEngine", "GL", "GLEW", "glfw", "vulkan", "dl", "jpeg" }
   includedirs { "viper/include" }
   buildoptions{ "-mavx2 -mbmi2 -mpopcnt -mfma -mcx16 -mtune=znver1 -msse -msse2 -msse3 -msse4.1 -msse4.2 -mssse3 -mavx -mavx2 -mfma -mavx512f -mavx512dq -mavx512cd -mavx512bw -mavx512vl" }
   
   files { "examples/basic/source/**.h", "examples/basic/source/**.c" }

   filter { "configurations:Debug" }
      defines { "DEBUG" }
      symbols "On"
      libdirs { "./build/Debug/" }
