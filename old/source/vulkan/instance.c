#include "viper/threading/master.h"
#include<viper/debug/logger.h>
#include<viper/vulkan/instance.h>

/**
 * Hardcoding the name of the engine no reason to
 * make it dymanic
 */
static const char* _VIPER_ENGINE_NAME = "viper";

/**
 * Additional dependencies for the instance
 */
static const char* _VIPER_INSTANCE_EXTENSIONS[] = {
};

/**
 * count is used both for input and the resulting size of the new list
 *
 * @param count :: Is used first to tell the function how many extensions \
 * are provided and then as the return of how many extensions are returned.
 * @param extensions :: Is the list of the extensions that will be copied.
 *
 * @return This function will return the extensions in a new list, this \
 * list needs to be freed by the developer.
 */
char** ViperVulkanGetExtensions(uint32_t* count, const char** extensions) {
	uint32_t c = *count;
	char** result = NULL;

	glfwGetRequiredInstanceExtensions(count);
	result = calloc(c + *count, sizeof(char*));

	if (NULL == result) {
		goto ERROR_EXIT;
	}

	for (uint32_t i = 0; i < c; i++) {
		result[i] = strdup(extensions[i]);
		ViperLogDebug("Extensions : %s", extensions[i]);
	}

	extensions = glfwGetRequiredInstanceExtensions(count);

	for (uint32_t i = 0; i < *count; i++) {
		result[c + i] = strdup(extensions[i]);
		ViperLogDebug("Extensions : %s", extensions[i]);
	}

	*count += c;
	return result;
ERROR_EXIT:
	return NULL;
}

/**
 * This function will create a VkInstance using the Vulkan_t->instance
 * varible, allowing for smoth start of the application.
 *
 * If Application_t->name is set this will be used for the application
 * name, as for the engine name its hard coded to Viper.
 *
 * @param app :: Is the main Application_t struct.
 * @param vk :: Is the Vulkan_t struct that contains all the vulkan spesfic data.
 */
int ViperVulkanInstanceCreate(ViperApplication_t* app, ViperVulkan_t* vk) {
	int64_t errorCode = 0;
	uint32_t extensionCount = sizeof(_VIPER_INSTANCE_EXTENSIONS) / sizeof(_VIPER_INSTANCE_EXTENSIONS[0]);

	VkApplicationInfo ai = {
		.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO,
		.pNext = NULL,
		.pApplicationName = app->name.data,
		.applicationVersion = VK_MAKE_VERSION(0,0,1),
		.pEngineName = app->name.data,
		.engineVersion = VK_MAKE_VERSION(0,0,1),
		.apiVersion = VK_MAKE_VERSION(1,2,0),
	};

	VkInstanceCreateInfo ci = {
		.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO,
		.pNext = NULL,
		.flags = 0x0,
		.pApplicationInfo = &ai,
		.enabledLayerCount = 0,
		.ppEnabledLayerNames = NULL,
		.enabledExtensionCount = 0,
		.ppEnabledExtensionNames = NULL,
	};

	ci.ppEnabledExtensionNames = (const char**)ViperVulkanGetExtensions(&extensionCount, _VIPER_INSTANCE_EXTENSIONS);
	ci.enabledExtensionCount = extensionCount;
	
	ViperLogDebug("%i", extensionCount);

	ViperUnsafeStructAccess(vk->instance);
	if (VK_SUCCESS != (errorCode = vkCreateInstance(&ci, NULL, &vk->instance.data))) {
		ViperLogError("Failed to create instance VkCreateInstance %v", errorCode);
		goto ERROR_EXIT;
	}
	ViperUnsafeStructRelease(vk->instance);


	// freeing the allocated memory
	for (uint32_t i = 0; i < ci.enabledExtensionCount; i++) {
		ViperLogDebug("Extensions : %s", ci.ppEnabledExtensionNames[i]);
		free((char*)ci.ppEnabledExtensionNames[i]);
	}
	free((char**)ci.ppEnabledExtensionNames);

	return 0;
ERROR_EXIT:
	ViperUnsafeStructRelease(vk->instance);
	return -1;
}
