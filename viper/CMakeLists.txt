cmake_minimum_required(VERSION 3.28)

## Windows needs to be the special case as allways
IF (WIN32)
    find_program(Fortran_COMPILER NAMES ifx ifort gfortran PATHS "C:/Program Files (x86)/Intel/oneAPI/compiler/latest/bin")
    message("Fortran compiler [ ${Fortran_COMPILER} ]")

    IF (Fortran_COMPILER)
        set(ENV{FC} ${Fortran_COMPILER})
    ENDIF()
    
    include_directories("C:/usr/include/")
    link_directories(AFTER "C:/usr/lib/")
ENDIF()

enable_language(Fortran)
project(viper LANGUAGES C Fortran)

set(CMAKE_Fortran_STANDARD 95)
set(CMAKE_C_STANDARD 17)

## More Windows Magic
IF (MSVC)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /experimental:c11atomics")
ENDIF()

IF(MSVC)

    add_compile_options(
       -Wall
    )

ELSE()

    add_compile_options(
       -O0 
       -g 
       -rdynamic 
       ## Warnings
       -Wall
       ## -Wextra :: no suport for windows
       -pedantic
       ## -Wno-unused-parameter :: no support for windows
       ## -Wno-unused-label :: no support for windows
    )

ENDIF() # MSVC



if (CMAKE_C_COMPILER_ID STREQUAL "GNU" AND CMAKE_LANG STREQUAL "C")
   add_compile_options(
      -Wformat-security
      )
endif()

set(F95_SOURCE
   "source/core/dummy/hello.f95"
   "source/core/maths/basic.f95"
   "source/core/maths/hashes.f95"
)

set(C_SOURCE
   "source/api/image/image.c"
   "source/api/main.c"
   "source/core/algorithm/dynamic_array.c"
   "source/core/algorithm/hash.c"
   "source/core/algorithm/hashmap.c"
   "source/core/algorithm/queue.c"
   "source/core/debug/benchmark.c"
   "source/core/debug/exceptions.c"
   "source/core/debug/logger.c"
   "source/core/debug/signaller.c"
   "source/core/file/directory.c"
   "source/core/file/dirent.c"
   "source/core/file/file.c"
   "source/core/file/format.c"
   "source/core/graphics/glfw.c"
   "source/core/graphics/opengl.c"
   "source/core/graphics/window.c"
   "source/core/image/jpeg.c"
   "source/core/image/jpeg2k.c"
   "source/core/io/printer.c"
   "source/core/maths/stringer.c"
   "source/core/memory/allocator.c"
   "source/core/memory/utils.c"
   "source/core/platform/cpu.c"
   "source/core/platform/dynamic_loading.c"
   "source/core/platform/error.c"
   "source/core/platform/io.c"
   "source/core/string/copy.c"
   "source/core/string/opengl.c"
   "source/core/string/stringer.c"
   "source/core/terminal/parser.c"
   "source/core/test/unit_tests.c"
   "source/core/threading/foreman.c"
   "source/lua/maths/stringer.c"
   "source/lua/maths/hashes.c"
)

include_directories("include")

# Create a library from Fortran sources
add_library(viper_f95 STATIC ${F95_SOURCE})
target_include_directories(viper_f95 PUBLIC "include")

# Create a library from C sources
add_library(viper_c STATIC ${C_SOURCE})
target_include_directories(viper_c PUBLIC "include")

# Link the C library with the Fortran library
add_library(viper INTERFACE)
target_link_libraries(viper INTERFACE "viper_c" "viper_f95" "m" "GL" "GLEW" "glfw" "vulkan" "lua" "bsd")

