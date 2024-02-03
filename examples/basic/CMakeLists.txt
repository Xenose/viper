cmake_minimum_required(VERSION 3.28)
project(basic LANGUAGES C Fortran)

#set(CMAKE_C_COMPILER "clang")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -O0 -pg")

add_subdirectory(viper)

include_directories("viper/include")

add_executable(basic "source/source.c")
target_link_libraries(basic PRIVATE viper)
