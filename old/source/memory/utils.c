#include<viper/types.h>
#include "viper/debug/logger.h"
#include "viper/types/networking.h"
#include "viper/types/opengl.h"
#include "viper/types/str.h"
#include "viper/types/structs.h"

#include<viper/memory/utils.h>

int64_t ViperGetStructureSize(uint64_t type) {
	switch (type) {
		case VIPER_STRUCTURE_TYPE_APPLICATION:		return sizeof(ViperApplication_t);
		case VIPER_STRUCTURE_TYPE_STRING:			return sizeof(ViperString_t);
      case VIPER_STRUCTURE_TYPE_SOCKET:         return sizeof(ViperSocket_t);
		case VIPER_STRUCTURE_TYPE_SERVER:			return sizeof(ViperServer_t);
		case VIPER_STRUCTURE_TYPE_OPENGL:			return sizeof(ViperOpenGL_t);
	}

	ViperLogError("Couldn't find type");
	return -1;
}
