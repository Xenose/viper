#ifndef __header_viper_socket_networking__
#define __header_viper_socket_networking__

#include<viper/types/typedefs.h>
#include<viper/types/networking.h>

extern int8_t ViperSocketCreate(ViperSocket_t* sock, ViperSocketCreateInfo_t* const info);
extern int64_t ViperSocketAccept(ViperSocket_t const* ss);


#endif /* __header_viper_socket_networking__ */
