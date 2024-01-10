#ifndef __header_viper_parser_types__
#define __header_viper_parser_types__

#include<viper/types.h>
#include<viper/types/typedefs.h>

typedef struct {
	ViperStructType_t sType;

	void (*function)(ViperConfig_t* config, void* customData);
	void* customData;
} ViperOptionAction_t;

#endif /* __header_viper_parser_types__ */
