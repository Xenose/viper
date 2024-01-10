#ifndef __header_viper_networking_types__
#define __header_viper_networking_types__

#include "viper/types/typedefs.h"
#include<viper/types/structs.h>

#define VIPER_SOCKET_FLAG_SERVER		0x0001
#define VIPER_SOCKET_FLAG_UDP			0x0002

typedef struct {
	ViperStructType_t sType; /// the type must always be first
} ViperIPv4_t;

typedef struct {
	ViperStructType_t sType; /// the type must always be first
} ViperIPv6_t;

typedef struct {
	ViperStructType_t sType; 
	uint64_t flags;
	int sockType;
	int sockProtocol;
	const char* address;
	const char* port;
	uint64_t backlog;
	uint64_t retry;
} ViperSocketCreateInfo_t;

typedef struct {
	ViperStructType_t sType;
	int socket;
} ViperSocket_t;

typedef struct {
	ViperStructType_t sType; /// the type must always be first
	int socket;
} ViperNetworkClient_t;

typedef struct {
	ViperStructType_t sType; /// the type must always be first
} ViperServerCreateInfo_t;

typedef struct {
	ViperStructType_t sType; /// the type must always be first
	int socket;
} ViperServer_t;

#endif /* __header_viper_networking_types__ */
