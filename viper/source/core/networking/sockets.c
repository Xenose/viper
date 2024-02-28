#include<netdb.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<unistd.h>

#include<viper/core/networking/sockets.h>

i8 ViperSocketCreate(ViperSocket_t* sock, const ViperSocketCreateInfo_t* info) {
   struct addrinfo hints = {
      .ai_family = AF_INET6,
   };



   if (info->flags & VIPER_SOCKET_CREATE_FLAG_IPV4) {
   }


   return 0;
}
