#include "viper/types/memory.h"
#include<unistd.h>
#include<vulkan/vulkan.h>
#include<viper/io/printer.h>
#include<viper/types.h>
#include<viper/utils/integer.h>

#include<viper/debug/benchmark.h>

#include<stdio.h>
#include<aio.h>
#include<fcntl.h>
#include<unistd.h>
#include<signal.h>

#include<vulkan/vulkan_core.h>

#include<errno.h>

/**
 * This struct is a internal data type to help with
 * passing along crusial data to the next function.
 */
typedef struct {
	int stream;
	ViperBuffer_t* buffer;
	const char* format;
	char* current;
	int64_t* bufferUsed;
} ViperPrintData_t;

#define BUFFER_SIZE MEMORY_4KB
static __thread char __memory[BUFFER_SIZE] = { 0 };

void __ViperAioWriteCompleted(sigval_t sigval) {
   struct aiocb* a = (struct aiocb*) sigval.sival_ptr;

   switch (aio_error(a)) {
      case 0:
         switch (aio_return(a)) {
            case -1:
               write(2, "Failed [ aio_return ]\n", 23);
               break;
            default:
               break;
         }
         break;
      default:
         write(2, "Failed [ aio_error ]\n", 22);
         break;
   }

   free((void*)a->aio_buf);
   free(a);
}

/**
 * This function will check if the buffer exceeds the
 * max buffer value, if so then the buffer will be flushed
 * and the bufferUsed varible will be reset.
 */
static inline int64_t __ViperFlushBuffer(ViperPrintData_t* restrict data) {
	int64_t length = data->buffer->bytes;
	write(data->stream, data->buffer->ptr, data->buffer->bytes);
	*data->bufferUsed = 0;
	return length;
}

/**
 * This function is used to convert errno number into
 * something a bit more readable and adding it to the
 * log print buffer.
 */
static inline int64_t __ViperGetErrorNumber(ViperPrintData_t* restrict data, va_list va) {
	strerror_r(
			va_arg(va, int),
			&data->buffer->str[*data->bufferUsed],
			data->buffer->bytes - *data->bufferUsed);

	return strlen(&data->buffer->str[*data->bufferUsed]);
}

/**
 * This function will extract the va_list string
 * and addit to the buffer so it will be printed.
 */
static inline int64_t __ViperCopyString(ViperPrintData_t* restrict data, va_list va) {
	int64_t length = 0;
	char* str = va_arg(va, char*);

	if (NULL == str) {
		// TODO LOG
		goto ERROR_EXIT;
	}

	length = strlen(str);

	if ((data->buffer->bytes - *data->bufferUsed) < length) {
		__ViperFlushBuffer(data);
	}

	memmove(&data->buffer->str[*data->bufferUsed], str, length);
ERROR_EXIT:
	return length;
}

/*
 * This function is used to convert vulkan result codes
 * into a human readable format.
 */
static inline int64_t __ViperVulkanResultToString(ViperPrintData_t* restrict data, va_list va) {
	int64_t length = 0;

	/// A very long switch with all the VkResult values
	switch (va_arg(va, VkResult)) {
		case VK_SUCCESS:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_SUCCESS", (length = 10));
			break;
		case VK_NOT_READY:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_NOT_READY", (length = 12));
			break;
		case VK_TIMEOUT:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_TIMEOUT", (length = 10));
			break;
		case VK_EVENT_SET:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_EVENT_SET", (length = 12));
			break;
		case VK_INCOMPLETE:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_INCOMPLETE", (length = 13));
			break;
		case VK_ERROR_OUT_OF_HOST_MEMORY:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_OUT_OF_HOST_MEMORY", (length = 27));
			break;
		case VK_ERROR_OUT_OF_DEVICE_MEMORY:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_OUT_OF_DEVICE_MEMORY", (length = 29));
			break;
		case VK_ERROR_INITIALIZATION_FAILED:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_INITIALIZATION_FAILED", (length = 30));
			break;
		case VK_ERROR_DEVICE_LOST:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_DEVICE_LOST", (length = 20));
			break;
		case VK_ERROR_MEMORY_MAP_FAILED:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_MEMORY_MAP_FAILED", (length = 26));
			break;
		case VK_ERROR_LAYER_NOT_PRESENT:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_LAYER_NOT_PRESENT", (length = 26));
			break;
		case VK_ERROR_EXTENSION_NOT_PRESENT:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_EXTENSION_NOT_PRESENT", (length = 30));
			break;
		case VK_ERROR_FEATURE_NOT_PRESENT:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_FEATURE_NOT_PRESENT", (length = 28));
			break;
		case VK_ERROR_INCOMPATIBLE_DRIVER:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_INCOMPATIBLE_DRIVER", (length = 28));
			break;
		case VK_ERROR_TOO_MANY_OBJECTS:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_TOO_MANY_OBJECTS", (length = 25));
			break;
		case VK_ERROR_FORMAT_NOT_SUPPORTED:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_FORMAT_NOT_SUPPORTED", (length = 29));
			break;
		case VK_ERROR_FRAGMENTED_POOL:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_FRAGMENTED_POOL", (length = 24));
		case VK_ERROR_UNKNOWN:
		default:
			memcpy(&data->buffer->str[*data->bufferUsed], "VK_ERROR_UNKNOWN", (length = 15));
	} // switch

	return length;
}

/**
 * Instead of wasting time on parsing in the _Percentage function
 * these function will handle more complex parsing allowing for
 * faster parsing over all.
 */
static inline int64_t __ViperDollar(ViperPrintData_t* restrict data, va_list va) {
REDO:
	switch (data->current[1]) {
			case '$':
				data->buffer->str[*data->bufferUsed++] = '$';
				break;
			case 's':
				*data->bufferUsed += __ViperCopyString(data, va);
				break;
			case 't':
				break;
			default:
				switch(*data->current) {
					case 0: case 1: case 2: case 3:
					case 4: case 5: case 6: case 7:
					case 8: case 9: case '.':
						// add value parser TODO
						goto REDO;
					default:
						break;
				}
		}
   
   data->current += 2;
	return *data->bufferUsed;
}

/**
 * This function is the faster alternative to _Dollar allowing
 * for less time spent on the printing parsing.
 */
static inline int64_t __ViperPercentage(ViperPrintData_t* restrict data, va_list va) {
		switch (data->current[1]) {
			case '%':
				data->buffer->str[*data->bufferUsed] = '%';
				(*data->bufferUsed)++;
			case 'a':
			case 'b': /// b is used for binary
				break;
			case 'c':
				data->buffer->str[*data->bufferUsed++] = va_arg(va, int);
				break;
			case 'd': /// d is used for double
			case 'e':
			case 'f': /// f is used for floats
			case 'g':
			case 'h': /// h is used for hexdecimal
				break;
			case 'i': /// i is used for int
				*data->bufferUsed += ViperItoa(va_arg(va, int), (data->buffer->str + *data->bufferUsed), data->buffer->bytes, 10);
				break;
			case 'n': /// n is used print errno
				*data->bufferUsed += __ViperGetErrorNumber(data, va);
				break;
			case 'o': /// o is used for octets
				break;
			case 's': /// s is used for c strings
				*data->bufferUsed += __ViperCopyString(data, va);
				break;
			case 'S': /// S is used for String_t
				break;
			case 't': /// t is used to print the current time with no argument
				break;
			case 'v': /// v is used for printing VkResult
				*data->bufferUsed += __ViperVulkanResultToString(data, va);
				break;
		}
   
   data->current += 2;
	return *data->bufferUsed;
}

/**
 * This function is to flush the buffer for all the print function
 * or if the above function does so.
 *
 * @param stream :: The stream to output to like [ stdout, stderr or other stream ]
 * @param buffer :: Is the buffer that's used for storing the data.
 * @param used :: Allows the above function to set the buffer index
 */

inline int64_t ViperPrintFlush(int stream, ViperBuffer_t* restrict buffer, int64_t used) {
   (&buffer->str[used])[1] = '\0';
   return write(stream, buffer->str, used);;
}

/**
 * This function is slow then the normal ViperPrintFlush, so this is only here
 * for future refrence and nothing more.
 *
 * This function will flush the print buffer and print it to the stream.
 *
 * @param stream :: The stream to output to like [ stdout, stderr or other stream ]
 * @param buffer :: Is the buffer that's used for storing the data.
 * @param used :: Allows the above function to set the buffer index
 */
inline int64_t ViperPrintFlushAIO(int stream, ViperBuffer_t* restrict buffer, int64_t used) {
   struct aiocb* a = calloc(1, sizeof(struct aiocb));

   buffer->str[++used] = '\0';
   
   *a = (struct aiocb){
      .aio_fildes = stream,
      .aio_nbytes = used,
      .aio_buf = memcpy(malloc(used), buffer->ptr, used),
      .aio_sigevent = {
         .sigev_notify = SIGEV_THREAD,
         .sigev_notify_function = &__ViperAioWriteCompleted,
         .sigev_value = {
            .sival_ptr = a,
         },
      },
   };

   aio_write(a);
   return used;
}

/**
 * This function is the main print function all the other function
 * and allows the most freedom when printing, but it also requires
 * more setup over the smaller functions.
 *
 * @param stream :: The stream to output to like [ stdout, stderr or other stream ]
 * @param buffer :: Is the buffer that's used for storing the data.
 * @param used :: Allows the above function to set the buffer index
 * @param format :: The formatting string for the va_list.
 * @param va :: Is the va_list.
 */
int64_t ViperPrintNSBUFVA(int stream, ViperBuffer_t* restrict buffer, int64_t used, const char* restrict format, va_list va) {
	ViperPrintData_t data = {
		.stream = stream,
		.buffer = buffer,
		.format = format,
		.current = (char*)format,
		.bufferUsed = &used,
	};

	if (NULL == format) {
		goto ERROR_EXIT;
	}
   
LOOP:
   switch (*data.current) {
      case '$':
         __ViperDollar(&data, va);
         goto LOOP;
      case '%':
         __ViperPercentage(&data, va);
         goto LOOP;
      case '\0':
         goto END_LOOP;
      default:
         buffer->str[used++] = *data.current;
         data.current++;
         goto LOOP;
   }
END_LOOP:
   return used;
ERROR_EXIT:
   return -1;
}

/**
 * PrintNSBF or [ Print No-buffer Stream Used Format ] is a print
 * function wrapping PrintNSBFVA allowing for simpler calls.
 *
 * @param stream is the output stream like [ stdout or stderr ]
 * @param buffer is used to supply the buffer to the function
 * @param used is to tell the function if the buffer has a pre-existing used space
 * @param format is the input format of the va_list
 * @param ... is the actual data described in the format string
 */
int64_t ViperPrintNSBUF(int stream, ViperBuffer_t* restrict buffer, int64_t used, const char* restrict format, ...) {
   int length = 0;
   va_list va;
   va_start(va, format);
   length = ViperPrintNSBUFVA(stream, buffer, used, format, va);
	va_end(va);
	return length;
}

/**
 */
int64_t ViperPrintNSBFVA(int stream, ViperBuffer_t* restrict buffer, const char* restrict format, va_list va) {
	return ViperPrintNSBUFVA(stream, buffer, 0, format, va);
}

int64_t ViperPrintNSBF(int stream, ViperBuffer_t* buffer, const char* format, ...) {
	va_list va;
	int64_t bufferUsed = 0;
	va_start(va, format);
	bufferUsed = ViperPrintNSBFVA(stream, buffer, format, va);
	va_end(va);
	return bufferUsed;
}

int64_t ViperPrintSBFVA(int stream, ViperBuffer_t* restrict buffer, const char* restrict format, va_list va) {
	int64_t bufferUsed = ViperPrintNSBFVA(stream, buffer, format, va);
   ViperPrintFlush(stream, buffer, bufferUsed);
	return bufferUsed;
}

int64_t ViperPrintSBF(int stream, ViperBuffer_t* restrict buffer, const char* restrict format, ...) {
	int length = 0;
	va_list va;
	va_start(va, format);
	length = ViperPrintSBFVA(stream, buffer, format, va);
	va_end(va);
	return length;
}

int64_t ViperPrintSFVA(int stream, const char* restrict format, va_list va) {
	ViperBuffer_t buffer = {
		.bytes = MEMORY_256B,
		.str = __memory,
	};

	return ViperPrintSBFVA(stream, &buffer, format, va);
}


int64_t ViperPrintFVA(const char* restrict format, va_list va) {
	return ViperPrintSFVA(1, format, va);
}

int64_t ViperPrintSF(int stream, const char* restrict format, ...) {
	int length = 0;
	va_list args;

	va_start(args, format);
	length = ViperPrintSFVA(stream, format, args);
	va_end(args);

	return length;

}

/**
 * The functions mimics the printf function, but is
 * thread safe and have more options or will have.
 *
 * @param msg :: The fomrated string for the input.
 * @param ... :: Is va_arg list.
 */
int64_t ViperPrintF(const char* restrict format, ...) {
	int length = 0;
	va_list args;

	va_start(args, format);
	length = ViperPrintSFVA(1, format, args);
	va_end(args);

	return length;
}

/**
 * The simplest function for printting with no formatting.
 *
 * @param msg :: the message.
 */
int64_t ViperPrint(const char* msg) {
	return ViperPrintF("%s", msg);
}
