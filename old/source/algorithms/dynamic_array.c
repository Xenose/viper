#include "viper/memory/utils.h"
#include "viper/types/algorithms.h"
#include "viper/types/structs.h"
#include<viper/algorithms/dynamic_array.h>

#include<stdlib.h>
#include<string.h>


int8_t ViperDynamicArrayAdd(ViperDynamicArray_t* array, void* ptr) {
	int64_t bytes = 0;
	int8_t* current = NULL;
	ViperGenericStruct_t* gen = ptr;

	if (array->stored != gen->sType) {
		return -1;
	}

	bytes = ViperGetStructureSize(gen->sType);

	array->ptr = realloc(array->ptr, bytes * array->count);
	current = &array->buffer[bytes * array->count];
	memcpy(current, ptr, bytes);
	array->count++;
	return 0;
}
