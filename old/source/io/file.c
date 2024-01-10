#include "viper/types/memory.h"
#include<stdio.h>
#include<errno.h>
#include<fcntl.h>
#include<unistd.h>
#include <sys/mman.h>

#include<viper/io/file.h>
#include<viper/debug/logger.h>

/**
 */
ViperFile_t* ViperLoadFile(const char* file) {
	int fd = -1;
	ViperFile_t* out = NULL;

	if (-1 == (fd = open(file, O_RDONLY))) {
		ViperLogError("Failed to open file [ %s ] error [ %n ]", file, errno);
		goto ERROR_EXIT;
	}

	if (NULL == (out = calloc(1, sizeof(ViperFile_t)))) {
		ViperLogError("Failed to allocate memory for File_t with error [ %n ]", errno);
		goto ERROR_EXIT;
	}

	out->buffer.bytes = (uint64_t)lseek(fd, 0, SEEK_END);

	if (-1 == out->buffer.bytes) {
		ViperLogError("Failed to seek end for memory with error [ %n ]", errno);
		goto ERROR_EXIT;
	}

	if (NULL == (out->buffer.data = mmap(0, out->buffer.bytes, PROT_READ, MAP_SHARED, fd, 0))) {
		goto ERROR_EXIT;
	}

	if (-1 == close(fd)) {
		ViperLogEmergancy("Failed to close fd for [ %s ]", file);
		goto EXIT;
	}
EXIT:
	return out;
ERROR_EXIT:
	return NULL;
}

/**
 */
ViperFile_t* ViperUnloadFile(ViperFile_t* file) {
	if (munmap(file->buffer.ptr, file->buffer.bytes)) {
		ViperLogCritical("Failed to munmap file [ %n ]", errno);
		goto ERROR_EXIT;
	}

	// cleaning up the struct
	free(file);
	file = NULL;
ERROR_EXIT:
	return file;
}

int8_t ViperBufferFlushToFile(const char* fileName, ViperBuffer_t* buffer) {
	int fd = open(fileName, O_CREAT | O_WRONLY | O_EXCL, S_IRUSR | S_IWUSR);
	int64_t lenght = 0;

	if (-1 == fd) {
		ViperLogError("Failed to create file");
		goto ERROR_EXIT;
	}

	lenght = write(fd, buffer->str, buffer->bytes);

	if (lenght != buffer->bytes) {
		ViperLogError("Failed to write all the data to file [ %n ]", errno);
		goto ERROR_EXIT;
	}

	return 0;
ERROR_EXIT:
	return -1;
}
