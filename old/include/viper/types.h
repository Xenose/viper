#ifndef __header_types__
#define __header_types__

#include <vulkan/vulkan_core.h>
#define GLFW_INCLUDE_VULKAN

#ifndef _GNU_SOURCE
	#define _GNU_SOURCE
#endif /* _GNU_SOURCE */

#include<stdint.h>
#include<stdlib.h>
#include<stdarg.h>
#include<string.h>
#include<math.h>
#include<stdatomic.h>

// Linux system
#include<sys/mman.h>

// 3rd party
#include<GL/glew.h>
#include<vulkan/vulkan.h>
#include<GLFW/glfw3.h>

/* Include base files into the main type file. */
#include<viper/types/structs.h>
#include<viper/types/typedefs.h>
#include<viper/types/memory.h>
#include<viper/types/math.h>
#include<viper/types/str.h>
#include<viper/types/vulkan.h>
#include<viper/types/error.h>
#include<viper/types/binary_tree.h>
#include<viper/types/networking.h>
#include<viper/types/images.h>
#include<viper/types/system.h>
#include<viper/types/opengl.h>
#include<viper/types/varibles.h>

#define Main main

#define VIPER_APPLICATION_FLAG_GRAPHICS_VULKAN  0x0001
#define VIPER_APPLICATION_FLAG_GRAPHICS_OPENGL  0x0002
#define VIPER_APPLICATION_FLAG_ENABLE_LUA       0x0004

enum {
	VIPER_APPLICATION_STATUS_EXIT		= 0,
	VIPER_APPLICATION_STATUS_EXITING,
	VIPER_APPLICATION_STATUS_RUNNING,
	VIPER_APPLICATION_STATUS_PAUSED,
};


typedef struct {
	ViperStructType_t sType;
} ViperConfig_t;

typedef struct {
	ViperStructType_t sType;
	int64_t heapSize;
} ViperProperties_t;

typedef struct __ViperApplication_t {
	ViperStructType_t sType; // the type must always be first
	atomic_flag locked;

	atomic_int_least64_t status;

	ViperString_t name;
	ViperSystemInfo_t sysInfo;

	ViperServer_t* server;
	ViperNetworkClient_t* client;

	union {
		void*			graphicsPtr;
		ViperVulkan_t* 	vulkan;
		ViperOpenGL_t* 	opengl;
	};

	void (*applicationLoop)(struct __ViperApplication_t* app);

} ViperApplication_t;

typedef struct __ViperGame_t {
	ViperStructType_t sType;
	atomic_flag locked;
	ViperApplication_t application;
} ViperGame_t;

typedef struct {
	ViperStructType_t sType;
	uint64_t flags;

	const int arc;
	char* const* arv;

	const char* name;
	void (*applicationLoop)(ViperApplication_t* app);
} ViperApplicationCreateInfo_t;


#endif /* __header_types__ */
