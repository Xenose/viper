cmake_minimum_required(VERSION 3.28)
project(viper LANGUAGES C Fortran)

enable_language(Fortran)

set(CMAKE_C_FLAGS "${CMAKE_fortran_FLAGS} ")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall ")
set(CMAKE_C_STANDARD 17)

set(F95_SOURCE
   "source/core/dummy/hello.f95"
   "source/core/maths/basic.f95"
)

set(C_SOURCE
   "source/api/image/image.c"
   "source/api/main.c"
   "source/core/algorithm/dynamic_array.c"
   "source/core/algorithm/queue.c"
   "source/core/debug/benchmark.c"
   "source/core/debug/exceptions.c"
   "source/core/debug/logger.c"
   "source/core/debug/signaller.c"
   "source/core/file/directory.c"
   "source/core/file/file.c"
   "source/core/file/format.c"
   "source/core/graphics/glfw.c"
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
   "source/core/string/stringer.c"
   "source/core/terminal/parser.c"
   "source/core/threading/foreman.c"
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
target_link_libraries(viper INTERFACE "viper_c" "viper_f95" "m" "GL" "GLEW" "glfw" "vulkan")

