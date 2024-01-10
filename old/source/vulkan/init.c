#include<viper/debug/logger.h>
#include<viper/types.h>
#include<viper/threading/master.h>
#include<GLFW/glfw3.h>
#include<viper/vulkan/init.h>
#include<vulkan/vulkan_core.h>

#include<viper/vulkan/instance.h>

/**
 * The needed devices extensions
 */
static const char* _DEVICE_EXTENSIONS[] = {
	VK_KHR_SWAPCHAIN_EXTENSION_NAME,
};

/**
 * The default value for the window size in the x direction
 * if no value is set.
 */
#define DEFAULT_WINDOW_SIZE_X 1920
/**
 * The default value for the window size in the y direction
 * if no value is set.
 */
#define DEFAULT_WINDOW_SIZE_Y 1080

int ViperVulkanGetPhysicalDevice(ViperApplication_t* app, ViperVulkan_t* vk) {
	int64_t returnCode = VK_SUCCESS;
	uint32_t count = 0;
	VkPhysicalDevice* devices = NULL;
	VkPhysicalDeviceProperties properties = { 0 };

	ViperLogError("VulkanGetPhysicalDevice");
	ViperUnsafeStructAccess(vk[0]);
	
	if (VK_SUCCESS != (returnCode = vkEnumeratePhysicalDevices(vk->instance.data, &count, NULL))) {
		ViperLogError("Failed to retrive count of physical devices [ %v ]", returnCode);
		goto ERROR_EXIT;
	}

	ViperUnsafeStructRelease(vk[0]);

	/// We don't need to check for other devices if there is only one device
	if (1 == count) {
		ViperUnsafeStructRelease(vk[0]);
		if (VK_SUCCESS != (returnCode = vkEnumeratePhysicalDevices(vk->instance.data, &count, &vk->physicalDevice.data))) {
			ViperLogError("Failed to retrive devices");
			goto ERROR_EXIT;
		}
		
		ViperUnsafeStructRelease(vk[0]);
		goto EXIT;
	}

	if (NULL == (devices = calloc(count, sizeof(VkPhysicalDevice)))) {
		ViperLogError("Failed to allocate temproary physical devices [ %v ]", returnCode);
		goto ERROR_EXIT;
	}

	
	ViperUnsafeStructAccess(vk[0]);
	if (VK_SUCCESS != (returnCode = vkEnumeratePhysicalDevices(vk->instance.data, &count, devices))) {
		ViperLogError("Failed to retrive devices");
		goto ERROR_EXIT;
	}
	ViperUnsafeStructRelease(vk[0]);

	for (uint32_t i = 0; i < count; i++) {
		vkGetPhysicalDeviceProperties(devices[i], &properties);
		ViperLogDebug("Name %s", properties.deviceName);
	}

EXIT:
	return 0;
ERROR_EXIT:
	ViperUnsafeStructRelease(vk[0]);
	return -1;
}

/**
 * Creates the graphics device that will be used by the
 * application.
 */
int64_t ViperVulkanCreateDevice(ViperApplication_t* app, ViperVulkan_t* vk) {
	uint32_t selectedQueue = 0;
	uint32_t queuePropertiesCount = 0;
	int64_t returnCode = VK_SUCCESS;
	float queuePriorities[] = { 1.0f };

	VkQueueFamilyProperties* queueProperties = NULL;
	VkDeviceQueueCreateInfo qci = { };
	VkDeviceCreateInfo dci = { };

	vkGetPhysicalDeviceQueueFamilyProperties(vk->physicalDevice.data, &queuePropertiesCount, NULL);

	if (NULL == (queueProperties = calloc(queuePropertiesCount, sizeof(queueProperties)))) {
		ViperLogError("Failed to allocate queueProperties");
		goto ERROR_EXIT;
	}

	vkGetPhysicalDeviceQueueFamilyProperties(vk->physicalDevice.data, &queuePropertiesCount, queueProperties);

	while (selectedQueue < queuePropertiesCount) {
		if (queueProperties[selectedQueue].queueFlags & VK_QUEUE_GRAPHICS_BIT) {
			ViperLogDebug("Found family queue");
			goto FOUND_QUEUE; // We found a queue lets break out
		}
		selectedQueue++;
	}
	ViperLogError("No queue family founed exiting...");
	goto ERROR_EXIT; // no queue was found so lets exit
FOUND_QUEUE: // instead of having a million unneeded checks

	qci = (VkDeviceQueueCreateInfo) {
		.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO,
		.pNext = NULL,
		.flags = 0,
		.queueFamilyIndex = selectedQueue,
		.queueCount = 1,
		.pQueuePriorities = (float*)queuePriorities,
	};

	dci = (VkDeviceCreateInfo) {
		.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO,
		.pNext = NULL,
		.flags = 0,
		.pQueueCreateInfos = &qci,
		.enabledLayerCount = 0,
		.ppEnabledLayerNames = 0,
		.enabledExtensionCount = sizeof(_DEVICE_EXTENSIONS) / sizeof(_DEVICE_EXTENSIONS[0]),
		.ppEnabledExtensionNames = _DEVICE_EXTENSIONS,
		.pEnabledFeatures = NULL,
	};

	if (VK_SUCCESS != (returnCode = vkCreateDevice(vk->physicalDevice.data, &dci, NULL, &vk->device.data))) {
		ViperLogError("%v", returnCode);
		goto ERROR_EXIT;
	}

	ViperLogDebug("Created logical device");

	vk->swapchainInfo.queueFamilyIndex = selectedQueue;
	vk->swapchainInfo.queueCount = 1;

	//free(queueProperties);
	return 0;
ERROR_EXIT:
	ViperLogError("%v", returnCode);
	return -1;
}

int64_t VulkanCreateSwapchain(ViperApplication_t* app, ViperVulkan_t* vk) {
	int result = VK_SUCCESS;
	VkSurfaceCapabilitiesKHR sc = {};
	VkSwapchainCreateInfoKHR sci = {};

	ViperLogDebug("Getting physicalDevice surface properties");
	if (VK_SUCCESS != (result = vkGetPhysicalDeviceSurfaceCapabilitiesKHR(vk->physicalDevice.data, vk->surface.data, &sc))) {
		ViperLogError("Failed to retrive surface capabilities [ %v ]", result);
		goto ERROR_EXIT;
	}

	sci = (VkSwapchainCreateInfoKHR) {
		.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR,
		.pNext = NULL,
		.flags = 0,
		.surface = vk->surface.data,
		.minImageCount = sc.minImageCount,
		.imageFormat = VK_FORMAT_R8G8B8_UNORM,
		.imageColorSpace =  VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT,
		.imageExtent = sc.currentExtent,
		.imageSharingMode = VK_SHARING_MODE_CONCURRENT,
		.queueFamilyIndexCount = vk->swapchainInfo.queueCount,
		.clipped = VK_TRUE,
	};

	ViperLogDebug("Vulkan creating swapchain");

	if (VK_SUCCESS != vkCreateSwapchainKHR(vk->device.data, &sci, NULL, &vk->swapchain.data)) {
		ViperLogError("Failed to create swapchain");
		goto ERROR_EXIT;
	}

	return 0;
ERROR_EXIT:
	return -1;
}

/**
 * This function is used to setup a vulkan rendering
 * enviroment and all the needed functionallity.
 */
int ViperVulkanInit(ViperApplication_t* app, ViperVulkan_t* vk) {
	ViperLogError("VulkanInit");
	// vk can be NULL meaning that we need to allocate it
	if (NULL == vk) {
		if (NULL == app->vulkan) {
			ViperUnsafeStructAccess(app[0]);
			app->vulkan = calloc(1, sizeof(ViperVulkan_t));
			ViperUnsafeStructRelease(app[0]);

			if (NULL == app->vulkan) {
				ViperLogError("Failed to allocate Vulkan_t");
				goto ERROR_EXIT;
			}
		}
		vk = app->vulkan;

		if (VIPER_STRUCTURE_TYPE_UNKOWN == vk->sType) {
			vk->sType = VIPER_STRUCTURE_TYPE_VULKAN;
		}

		if (0 == vk->dimensionsWindow.x || 0 == vk->dimensionsWindow.y) {
			vk->dimensionsWindow.x = DEFAULT_WINDOW_SIZE_X;
			vk->dimensionsWindow.y = DEFAULT_WINDOW_SIZE_Y;
		}
	}


	if (!glfwInit()) {
		ViperLogError("glfwInit failed");
		goto ERROR_EXIT;
	}

	if (!glfwVulkanSupported()) {
		ViperLogError("Vulkan not suppored");
		goto ERROR_EXIT_KILL_GLFW;
	}

	glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);

	ViperUnsafeStructAccess(vk->window);
	vk->window.data = glfwCreateWindow(vk->dimensionsWindow.x, vk->dimensionsWindow.y, app->name.data, NULL,NULL);

	if (NULL == vk->window.data) {
		ViperLogError("glfwCreateWindow == NULL");
		goto ERROR_EXIT;
	}
	ViperUnsafeStructRelease(vk->window);

	if (0 != ViperVulkanInstanceCreate(app, vk)) {
		ViperLogError("Failed to create instance vulkan");
		goto ERROR_EXIT_CLOSE_WINDOW;
	}

	if (0 != ViperVulkanGetPhysicalDevice(app, vk)) {
		ViperLogError("VulkanGetPhysicalDevice");
		goto ERROR_EXIT_PHYSICAL_DEVICE;
	}

	if (0 != ViperVulkanCreateDevice(app, vk)) {
		ViperLogError("Failed to create logical device");
		goto ERROR_EXIT;
	}

	ViperUnsafeStructAccess(vk[0]);
	if (VK_SUCCESS != glfwCreateWindowSurface(vk->instance.data, vk->window.data, NULL, &vk->surface.data)) {
		ViperLogError("Failed to create surface");
		goto ERROR_EXIT;
	}
	ViperUnsafeStructRelease(vk[0]);

	if (0 != VulkanCreateSwapchain(app, vk)) {
		goto ERROR_EXIT;
	}

	return 0;
ERROR_EXIT_PHYSICAL_DEVICE:
ERROR_EXIT_CLOSE_WINDOW:
	glfwDestroyWindow(vk->window.data);
ERROR_EXIT_KILL_GLFW:
	glfwTerminate();
ERROR_EXIT:
	return -1;
} // VulkanInit
