/**
 * @file macro/include.h
 *
 * This file is not used for any functions or macros it self,
 * but it will instead define _GNU_SOURCE and other macros
 * if not already defined.
 */


#ifndef _GNU_SOURCE
   #define _GUN_SOURCE
#endif 

#ifndef _POSIX_C_SOURCE
   #define _POSIX_C_SOURCE
#endif

#ifndef _POSIX_SOURCE
   #define _POSIX_SOURCE
#endif 
