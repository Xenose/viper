#ifndef __header_viper_types_defines__
#define __header_viper_types_defines__

#include<stdint.h>

#ifndef _WIN32
	#include<stdatomic.h>
#else
	#include<vcruntime_c11_stdatomic.h>
#endif

#ifdef _WIN32
	typedef int64_t  int128_t;
	typedef uint64_t uint128_t;
#else
	typedef __int128_t  int128_t;
	typedef __uint128_t uint128_t;
#endif


#define VIPER_TRUE   1
#define VIPER_FALSE  0

/* Normal varibles */

typedef char c;
typedef const char cc;

typedef int8_t   i8;
typedef int16_t  i16;
typedef int32_t  i32;
typedef int64_t  i64;
typedef int128_t i128; 

typedef uint8_t   u8;
typedef uint16_t  u16;
typedef uint32_t  u32;
typedef uint64_t  u64;
typedef uint128_t u128;

/* Atomics */
#ifdef _WIN32
	typedef int8_t  ai8;
	typedef int16_t ai16;
	typedef int32_t ai32;
	typedef int64_t ai64;

	typedef uint64_t  au8;
	typedef uint16_t au16;
	typedef uint32_t au32;
	typedef uint64_t au64;
#else
	typedef atomic_int_least8_t  ai8;
	typedef atomic_int_least16_t ai16;
	typedef atomic_int_least32_t ai32;
	typedef atomic_int_least64_t ai64;

	typedef atomic_uint_least8_t  au8;
	typedef atomic_uint_least16_t au16;
	typedef atomic_uint_least32_t au32;
	typedef atomic_uint_least64_t au64;
#endif

typedef u64 ViperStructType_t;


/* Various types */
#ifdef _WIN32
	#define __thread __declspec(thread)

	#define sigjmp_buf jmp_buf
#endif

#endif /* __header_viper_types_defines__ */
