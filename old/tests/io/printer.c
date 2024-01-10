#include "viper/types/tests.h"
#include <asm-generic/errno-base.h>
#include<stdint.h>
#include<viper/debug/exceptions.h>
#include<viper/io/printer.h>
#include<viper/debug/logger.h>
#include<errno.h>
#include<stdio.h>

int errnoValues[] = {
	EPERM,
	ENOENT,
	ESRCH,
	EINTR,
	EIO,
	ENXIO,
	E2BIG,
	ENOEXEC,
	EBADF,
	ECHILD,
	EAGAIN,
	ENOMEM,
	EFAULT,
	EACCES,
	ENOTBLK,
	EBUSY,
	EEXIST,
	EXDEV,
	ENODEV,
	ENOTDIR,
	EISDIR,
	EINVAL,
	ENFILE,
	EMFILE,
	ENOTTY,
	ETXTBSY,
};

int vulkanResultValues[] = {
	VK_SUCCESS,
    VK_NOT_READY,
    VK_TIMEOUT,
    VK_EVENT_SET,
    VK_EVENT_RESET,
    VK_INCOMPLETE,
    VK_ERROR_OUT_OF_HOST_MEMORY,
    VK_ERROR_OUT_OF_DEVICE_MEMORY,
    VK_ERROR_INITIALIZATION_FAILED,
    VK_ERROR_DEVICE_LOST,
    VK_ERROR_MEMORY_MAP_FAILED,
    VK_ERROR_LAYER_NOT_PRESENT,
    VK_ERROR_EXTENSION_NOT_PRESENT,
    VK_ERROR_FEATURE_NOT_PRESENT,
    VK_ERROR_INCOMPATIBLE_DRIVER,
    VK_ERROR_TOO_MANY_OBJECTS,
    VK_ERROR_FORMAT_NOT_SUPPORTED,
    VK_ERROR_FRAGMENTED_POOL,
    VK_ERROR_UNKNOWN,
    VK_ERROR_OUT_OF_POOL_MEMORY,
    VK_ERROR_INVALID_EXTERNAL_HANDLE,
    VK_ERROR_FRAGMENTATION,
    VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS,
    VK_PIPELINE_COMPILE_REQUIRED,
    VK_ERROR_SURFACE_LOST_KHR,
    VK_ERROR_NATIVE_WINDOW_IN_USE_KHR,
    VK_SUBOPTIMAL_KHR,
    VK_ERROR_OUT_OF_DATE_KHR,
    VK_ERROR_INCOMPATIBLE_DISPLAY_KHR,
    VK_ERROR_VALIDATION_FAILED_EXT,
    VK_ERROR_INVALID_SHADER_NV,
    VK_ERROR_IMAGE_USAGE_NOT_SUPPORTED_KHR,
    VK_ERROR_VIDEO_PICTURE_LAYOUT_NOT_SUPPORTED_KHR,
    VK_ERROR_VIDEO_PROFILE_OPERATION_NOT_SUPPORTED_KHR,
    VK_ERROR_VIDEO_PROFILE_FORMAT_NOT_SUPPORTED_KHR,
    VK_ERROR_VIDEO_PROFILE_CODEC_NOT_SUPPORTED_KHR,
    VK_ERROR_VIDEO_STD_VERSION_NOT_SUPPORTED_KHR,
    VK_ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT,
    VK_ERROR_NOT_PERMITTED_KHR,
    VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT,
    VK_THREAD_IDLE_KHR,
    VK_THREAD_DONE_KHR,
    VK_OPERATION_DEFERRED_KHR,
    VK_OPERATION_NOT_DEFERRED_KHR,
#ifdef VK_ENABLE_BETA_EXTENSIONS
    VK_ERROR_INVALID_VIDEO_STD_PARAMETERS_KHR,
#endif
    VK_ERROR_COMPRESSION_EXHAUSTED_EXT,
    VK_ERROR_INCOMPATIBLE_SHADER_BINARY_EXT,
    VK_ERROR_OUT_OF_POOL_MEMORY_KHR,
    VK_ERROR_INVALID_EXTERNAL_HANDLE_KHR,
    VK_ERROR_FRAGMENTATION_EXT,
    VK_ERROR_NOT_PERMITTED_EXT,
    VK_ERROR_INVALID_DEVICE_ADDRESS_EXT,
    VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS_KHR,
    VK_PIPELINE_COMPILE_REQUIRED_EXT,
    VK_ERROR_PIPELINE_COMPILE_REQUIRED_EXT,
};

void ExecutePrintTestFormat(char* format) {
}

int8_t ExecutePrintTest(ViperTestInfo_t* info) {
	int64_t total = 2;
	int64_t current = 0;
	int64_t success = 0;
	int64_t failed = 0;
	int i = 0;

	int min = -10000;
	int max = abs(min);

	ViperTry {
		info->testTotal++;

		for (i = min; i <= max; i++) {
			ViperPrintF("\33[2K\r[ \033[32m OK \033[0m ] %i.", i);
		}

		ViperPrintF("\33[2K\r[ \033[32m Passed \033[0m ] passed test for integer printing [ %i ] to [ %i ]\n", min, max);
	} ViperCatch {
		info->testFailed++;
		printf("\33[2K\r[ \033[31m Failed \033[0m ] ViperPrintF('%i', 64) \n", i);
	}

	ViperTry {
		info->testTotal++;

		for (i = 0; i < (sizeof(errnoValues) / sizeof(errnoValues[0])); i++) {
			ViperPrintF("\33[2K\r[ \033[32m OK \033[0m ] %n.", errnoValues[i]);
		}

		ViperPrintF("\33[2K\r[ \033[32m Passed \033[0m ] passed test for the errno printing\n");
	} ViperCatch {
		info->testFailed++;
		printf("\33[2K\rFailed test [ ViperPrintF('%i\n', errno);\n]", errnoValues[i]);
	}

	ViperTry {
		info->testTotal++;

		for (i = 0; i < (sizeof(vulkanResultValues) / sizeof(vulkanResultValues[0])); i++) {
			ViperPrintF("\33[2K\r[ \033[32m OK \033[0m ] %v.", vulkanResultValues[i]);
		}

		ViperPrintF("\33[2K\r[ \033[32m Passed \033[0m ] passed test for the vulkan result printing\n");
	} ViperCatch {
		info->testFailed++;
		printf("\33[2K\rFailed test [ ViperPrintF('%i\n', vulkan result);\n]", vulkanResultValues[i]);
	}

	return 0;
}
