#include<errno.h>
#include<netdb.h>
#include<netinet/in.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<stdint.h>
#include<unistd.h>
#include<sys/epoll.h>

#include<viper/debug/logger.h>
#include<viper/types/memory.h>
#include<viper/types/networking.h>

/**
 * This function is responsible for creating both TCP and UDP sockets,
 *
 * @param sock :: the output with the new socket
 * @param info :: the information used to create the socket
 */
int8_t ViperSocketCreate(ViperSocket_t* sock, ViperSocketCreateInfo_t* const info) {
	int off = 0;
	int error = 0;
	int retry = info->retry;
	struct addrinfo* results = NULL;
	struct addrinfo hints = {
		.ai_family		= 0 == info->sockType ? AF_INET6 : info->sockType,
		.ai_socktype	= 0 == info->sockProtocol ? SOCK_STREAM : info->sockProtocol,
	};
	
	if (VIPER_SOCKET_FLAG_SERVER & info->flags) {
		hints.ai_flags		= AI_PASSIVE;
	}

RETRY_getaddrinfo:
	switch(error = getaddrinfo(info->address, info->port, &hints, &results)) {
		case 0:
			ViperLogDebug("getaddrinfo success");
			retry = info->retry;
			break;
		case EAI_AGAIN:
			if (0 != retry--) {
				usleep(5);
				goto RETRY_getaddrinfo;
			}
		default:
			ViperLogError("getaddrinfo failed : %n", error);
			goto ERROR_EXIT;
	}

   sock->socket = socket(results->ai_family, results->ai_socktype, results->ai_protocol);

	if (-1 == sock->socket) {
		ViperLogError("Failed to create socket : %n", errno);
		goto ERROR_EXIT_FREE_INFO;
	}


	if (AF_INET6 == hints.ai_family) {
		if (-1 == setsockopt(sock->socket, IPPROTO_IPV6, IPV6_V6ONLY, &off, sizeof(int))) {
			ViperLogWarning("Turning off IPv6 only mode failed : %n", errno);
		}
	}

	if (VIPER_SOCKET_FLAG_SERVER & info->flags) {
		if (SOCK_STREAM == hints.ai_socktype) {
			if (-1 == bind(sock->socket, results->ai_addr, results->ai_addrlen)) {
				ViperLogError("Failed to bind socket : %n", errno);
				goto ERROR_EXIT_FREE_INFO;
			}
		}

		if (-1 == listen(sock->socket, info->backlog)) {
			ViperLogError("Failed to listen socket : %n", errno);
			goto ERROR_EXIT_FREE_INFO;
		}
	}

EXIT:
	freeaddrinfo(results);
	return 0;
ERROR_EXIT_FREE_INFO:
	freeaddrinfo(results);
ERROR_EXIT:
	return -1;
}

int64_t ViperSocketSend(ViperSocket_t* s, ViperBuffer_t* buffer) {
   int64_t retry = 0;
   int64_t total = 0;
   ssize_t rv = 0;
   char* data = buffer->str;
   int64_t length = buffer->bytes;

LOOP:
   rv = send(s->socket, data, length, 0);

   if (-1 == rv) switch (errno) {
      case EAGAIN:
         if (3 < retry++) {
            return ENETUNREACH;
         }
         goto LOOP;
      case EMSGSIZE:
         length /= 2;
         if (length < 512) {
            return EMSGSIZE;
         }
         goto LOOP;
      default:
         return errno;
   }

   total += rv;

   if (total < buffer->bytes) {
      data += rv;
      goto LOOP;
   }

   return 0;
}

int64_t ViperSokcetReceive(ViperSocket_t* s, ViperBuffer_t* buffer) {
   int64_t retry = 0;
   int rv = 0;

LOOP:
   rv = recv(s->socket, buffer->ptr, buffer->bytes - 1, 0);

   if (-1 == rv) switch (rv) {
      case EINTR:
      case EAGAIN:
         if (3 < retry++) {
            return ENETUNREACH;
         }
         goto LOOP;
      default:
         return errno;
   }

   return rv;
}


int64_t ViperSocketAccept(ViperSocket_t const* restrict ss, ViperNetworkClient_t* restrict c) {
   *c = (ViperNetworkClient_t){
      .socket = accept(ss->socket, NULL, 0),
   };

   return c->socket;
}

int8_t ViperEpollAddServer(ViperNetworkClient_t* restrict client) {
   return 0;
}

int8_t ViperEpollAddClient(ViperNetworkClient_t* restrict client) {
   return 0;
}

void ViperEpoll(int fd, struct epoll_event* events, int64_t max) {
   int nfds = epoll_wait(fd, events, max, -1);

   if (-1 == nfds) {
      return;
   }

   for (int i = 1; i < nfds; i++) {
   }
}







