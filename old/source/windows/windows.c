#include<stdlib.h>
#include<viper/debug/logger.h>
#include<viper/windows/windows.h>

#include<GL/gl.h>
#include<GLFW/glfw3.h>

#ifdef VIPER_WINDOWS_MODE

/* HWND hWnd = CreateWindow(
    "ClassName",           // Class name
    "WindowName",          // Window name
    WS_OVERLAPPEDWINDOW,    // Window style
    CW_USEDEFAULT,          // X-coordinate
    CW_USEDEFAULT,          // Y-coordinate
    800,                    // Width
    600,                    // Height
    NULL,                   // Parent window
    NULL,                   // Menu
    hInstance,              // Instance handle
    NULL                    // Additional application data
); */

HWND CreateWindow(const char* className, const char* windowName, uint64_t xCord, uint64_t yCord, uint64_t width, uint64_t height, HWND* parent, void* menu, void* hInstance, void* appData) {
	HWND out = (HWND)calloc(1, sizeof(struct HWND__));

	if (NULL == out) {
		LogError("Failed to allocate memory");
		goto ERROR_EXIT;
	}

	out->window = glfwCreateWindow(width, height, windowName, NULL, NULL);

	if (NULL != out->window) {
		ViperLogError("Failed to allocate window glfw");
		goto ERROR_EXIT_FREE_OUT;
	}

	return out;
ERROR_EXIT_FREE_OUT:
	free(out);
ERROR_EXIT:
	return NULL;
}

void DestroyWindow(HWND window) {
	glfwDestroyWindow(window->window);
	free(window);
}

#endif /* VIPER_WINDOWS_MODE */
