#ifndef __header_viper_linux_types__
#define __header_viper_linux_types__

#include<sys/types.h>

#ifdef _WIN32
#include<stdint.h>

// Defined in Windows
//typedef int64_t off_t;
//typedef uint64_t dev_t;
//typedef uint64_t ino_t;

typedef int64_t blksize_t;
typedef int64_t blkcnt_t;
typedef int64_t pid_t;
typedef int64_t ssize_t;
typedef int64_t suseconds_t;

typedef uint64_t clock_t;
typedef uint64_t clockid_t;
typedef uint64_t fsblkcnt_t;
typedef uint64_t fsfilcnt_t;
typedef uint64_t gid_t;
typedef uint64_t id_t;
typedef uint64_t key_t;
typedef uint64_t mode_t;
typedef uint64_t nlink_t;
typedef uint64_t time_t;
typedef uint64_t trace_attr_t;
typedef uint64_t trace_event_set_t;
typedef uint64_t uid_t;

#endif /* _WIN32 */

#endif /* __header_viper_linux_types__ */
