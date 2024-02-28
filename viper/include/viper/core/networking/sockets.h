#ifndef __header_viper_core_networking_sockets__
#define __header_viper_core_networking_sockets__

#include<viper/core/types/networking.h>

#define VIPER_SOCKET_CREATE_FLAG_SERVER   0x0001
#define VIPER_SOCKET_CREATE_FLAG_UDP      0x0001
#define VIPER_SOCKET_CREATE_FLAG_TCP      0x0001
#define VIPER_SOCKET_CREATE_FLAG_IPV4     0x0001

extern i8 ViperSocketCreate(ViperSocket_t* sock, const ViperSocketCreateInfo_t* info);

#endif /* __header_viper_core_networking_sockets__ */
