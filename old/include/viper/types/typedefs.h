#ifndef __header_viper_typedefs_types__
#define __header_viper_typedefs_types__

#include<stdatomic.h>

/**
 * These typedef's is just a faster way to
 * type them instead of the full atomic int name.
 */
typedef atomic_int_fast64_t aint64_t;

typedef atomic_uint_fast8_t auint8_t;
typedef atomic_uint_fast64_t auint64_t;

typedef auint64_t ViperStructType_t;

#endif /* __header_viper_typedefs_types__ */
