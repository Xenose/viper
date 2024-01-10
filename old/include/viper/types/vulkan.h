#ifndef __header_viper_vulkan_types__
#define __header_viper_vulkan_types__

#include <stdatomic.h>
#include<stdint.h>
#include<vulkan/vulkan.h>
#include<GLFW/glfw3.h>
#include<viper/types/typedefs.h>
#include<viper/types/math.h>
#include <vulkan/vulkan_core.h>
#include<viper/types/opengl.h>

typedef struct {
	ViperStructType_t sType;
	uint32_t queueFamilyIndex;
	uint32_t queueCount;
} ViperVulkanSwapchainInfo_t;

typedef struct {
	ViperStructType_t 	sType;
	atomic_flag 	locked;
	VkInstance		data;
} ViperVkInstance_t;

typedef struct {
	ViperStructType_t 		sType;
	atomic_flag 		locked;
	VkPhysicalDevice	data;
} ViperVkPhysicalDevice_t;

typedef struct {
	ViperStructType_t	sType;
	atomic_flag 	locked;
	VkQueue			data;
} ViperVkQueue_t;

typedef struct {
	ViperStructType_t 	sType;
	atomic_flag		locked;
	VkDevice			data;
} ViperVkDevice_t;

typedef struct {
	ViperStructType_t	sType;
	atomic_flag 	locked;
	VkSurfaceKHR	data;
} ViperVkSurfaceKHR_t;

typedef struct {
	ViperStructType_t	sType;
	atomic_flag 	locked;
	VkSwapchainKHR	data;
} ViperVkSwapchainKHR_t;

typedef struct {
	ViperStructType_t	sType;
	atomic_flag 	locked;
	VkRenderPass	data;
} ViperVkRenderPass_t;

typedef struct {
	ViperStructType_t	sType;
	atomic_flag 	locked;
	VkFramebuffer	data;
} ViperVkFrameBuffer_t;

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;

	ViperGLFWwindow_t	window;
	ViperDimensions2_t		dimensionsWindow;

	ViperVulkanSwapchainInfo_t swapchainInfo;

	ViperVkInstance_t			instance;
	ViperVkPhysicalDevice_t	physicalDevice;
	ViperVkQueue_t				queueGraphics;
	ViperVkDevice_t			device;
	ViperVkSurfaceKHR_t		surface;
	ViperVkSwapchainKHR_t	swapchain;
	ViperVkRenderPass_t		renderpass;
	ViperVkFrameBuffer_t		frameBuffer;
} ViperVulkan_t;

#endif /* __header_viper_vulkan_types__ */
