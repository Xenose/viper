#include "viper/memory/utils.h"
#include "viper/types.h"
#include "viper/types/str.h"
#include<viper/memory/create.h>
#include<viper/utils/stringer.h>
#include<viper/networking/socket.h>
#include<viper/application/application.h>

void* ViperCreate(int64_t type, void* ptr, ...) {
	int returnCode = -1;
	va_list args;
	ViperGenericStruct_t* gen = ptr;
	type = (VIPER_STRUCTURE_TYPE_UNKOWN == type ? gen->sType : type);

	if (VIPER_STRUCTURE_TYPE_UNKOWN == type) {
		goto ERROR_EXIT;
	}

	va_start(args, ptr);

	if (NULL == ptr) { 
		ptr = gen = calloc(1, ViperGetStructureSize(type));
	}

	switch (type) {
		case VIPER_STRUCTURE_TYPE_STRING:
			returnCode = ViperStringCreate(ptr, va_arg(args, const char*));
			break;
      case VIPER_STRUCTURE_TYPE_SOCKET:
         returnCode = ViperSocketCreate(ptr, va_arg(args, ViperSocketCreateInfo_t*));
         break;
		case VIPER_STRUCTURE_TYPE_APPLICATION:
			returnCode = ViperApplicationCreate(ptr, va_arg(args, ViperApplicationCreateInfo_t*));
			break;
	}

	va_end(args);
	return ptr;
ERROR_EXIT:
	return NULL;
}

void* ViperDelete(void* ptr) {
	ViperGenericStruct_t* gen = ptr;

	switch (atomic_load(&gen->sType)) {
		case VIPER_STRUCTURE_TYPE_STRING:
			ViperStringDelete(ptr);
			break;
		default:
			goto ERROR_EXIT;
	}

ERROR_EXIT:
	return ptr;
}
