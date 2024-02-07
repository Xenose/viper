#ifndef __header_viper_core_platform_io__
#define __header_viper_core_platform_io__

#include<viper/core/types/defines.h>
#include<viper/core/types/struct.h>

#define VIPER_FILE_FLAG_READ        O_RDONLY
#define VIPER_FILE_FLAG_WRITE       O_WRONLY
#define VIPER_FILE_FLAG_READ_WRITE  VIPER_FILE_FLAG_READ | VIPER_FILE_FLAG_WRITE

#define VIPER_FILE_FLAG_APPEND      O_APPEND
#define VIPER_FILE_FLAG_ASYNC       O_ASYNC
#define VIPER_FILE_FLAG_CLOEXEC     O_CLOEXEC
#define VIPER_FILE_FLAG_CREATE      O_CREATE
#define VIPER_FILE_FLAG_DIRECT      O_DIRECT
#define VIPER_FILE_FLAG_DIRECTORY   O_DIRECTORY
#define VIPER_FILE_FLAG_DSYNC       O_DSYNC
#define VIPER_FILE_FLAG_EXEL        O_EXEL
#define VIPER_FILE_FLAG_LARGEFILE   O_LARGEFILE
#define VIPER_FILE_FLAG_NOATIME     O_NOATIME
#define VIPER_FILE_FLAG_NOCTTY      O_NOCTTY
#define VIPER_FILE_FLAG_NOFOLLOW    O_NOFOLLOW
#define VIPER_FILE_FLAG_NONBLOCK    O_NONBLOCK
#define VIPER_FILE_FLAG_PATH        O_PATH
#define VIPER_FILE_FLAG_SYNC        O_SYNC
#define VIPER_FILE_FLAG_TMPFILE     O_TMPFILE
#define VIPER_FILE_FLAG_TRUNC       O_TRUNC


extern i64 ViperWrite(i64 fd, void* const buffer, u64 bytes);
extern i64 ViperOpen(cc* fullpath, int flags, u64 modes);

#endif /* __header_viper_core_platform_io__ */
