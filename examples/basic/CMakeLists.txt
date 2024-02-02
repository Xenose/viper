cmake_minimum_required(VERSION 3.28)
project(basic LANGUAGES C Fortran)

add_subdirectory(viper)

include_directories("viper/include")

add_executable(basic "source/source.c")
target_link_libraries(basic PRIVATE viper)
