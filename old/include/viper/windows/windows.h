#ifndef __header_viper_windows__
#define __header_viper_windows__

#ifndef VIPER_WINDOWS_MODE

#elif defined(_WIN32) || defined(WIN32)

#include<windows.h>

#else

#include<stdint.h>
#include<GL/gl.h>
#include<GLFW/glfw3.h>

typedef struct HWND__ {
	GLFWwindow* window;
} *HWND;


extern HWND CreateWindow(const char* className, const char* windowName, uint64_t xCord, uint64_t yCord, uint64_t width, uint64_t height, HWND* parent, void* menu, void* hInstance, void* appData);
extern void DestroyWindow(HWND window);


#endif /* VIPER_WINDOWS_MODE, _WIN32 || WIN32 */

#endif /* __header_viper_windows__ */
