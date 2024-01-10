#ifndef __header_create__
#define __header_create__

#include<viper/types.h>

extern void* ViperCreate(int64_t type, void* ptr, ...);
extern void* ViperDelete(void* ptr);

#endif /* __header_create__ */
