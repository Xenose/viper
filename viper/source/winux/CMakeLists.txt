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
ENDIF ()

enable_language(Fortran)
project(viper LANGUAGES C Fortran)

set(CMAKE_Fortran_STANDARD 95)
set(CMAKE_C_STANDARD 17)

## More Windows Magic
IF (MSVC)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /experimental:c11atomics")
ENDIF ()

IF(MSVC)

    add_compile_options(
       -Wall
    )

ELSE ()

    add_compile_options(
       -O0 
       -g 
       -rdynamic 
       ## Warnings
       -Wall
       -Wextra
       -pedantic
       -Wno-unused-parameter
       -Wno-unused-label
    )

ENDIF () # MSVC

if (CMAKE_C_COMPILER_ID STREQUAL "GNU" AND CMAKE_LANG STREQUAL "C")
   add_compile_options(
      -Wformat-security
      )
endif ()

IF (WIN32)
   set(C_SOURCE
      "dirent.c"
      "unistd.c"
      "mman.c"
   )
ENDIF ()
