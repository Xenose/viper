#ifndef __header_viper_structs_types__
#define __header_viper_structs_types__

#include<viper/types/typedefs.h>

enum {
	VIPER_VARIBALE_TYPE_UNKOWN = -1,
	VIPER_STRUCTURE_TYPE_UNKOWN = 0,

	/* these are not structures but its useful to have them here also */
	VIPER_VARIABLE_TYPE_CHAR,
	VIPER_VARIABLE_TYPE_INT,
	VIPER_VARIABLE_TYPE_FLOAT,
	VIPER_VARIABLE_TYPE_DOUBLE,

	/* pointers for lists and so on */
	VIPER_VARIABLE_TYPE_P_CHAR,
	VIPER_VARIABLE_TYPE_PP_CHAR,
	VIPER_VARIABLE_TYPE_PPP_CHAR,

	VIPER_VARIABLE_TYPE_P_INT,
	VIPER_VARIABLE_TYPE_PP_INT,
	VIPER_VARIABLE_TYPE_PPP_INT,

	/* we are addig the proper structs here */
	VIPER_STRUCTURE_TYPE_INT,
	VIPER_STRUCTURE_TYPE_FLOAT,

	VIPER_STRUCTURE_TYPE_CONFIG,
	VIPER_STRUCTURE_TYPE_STRING,
   VIPER_STRUCTURE_TYPE_SOCKET,
	VIPER_STRUCTURE_TYPE_CLIENT,
	VIPER_STRUCTURE_TYPE_SERVER,
	VIPER_STRUCTURE_TYPE_SERVER_CREATE_INFO,
	VIPER_STRUCTURE_TYPE_VULKAN,
	VIPER_STRUCTURE_TYPE_OPENGL,
	VIPER_STRUCTURE_TYPE_APPLICATION,
};

typedef struct {
	ViperStructType_t sType; /// the type must always be first
	atomic_flag locked;
} ViperGenericStruct_t;

#endif /* __header_viper_structs_types__ */
