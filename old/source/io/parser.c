#include "viper/debug/logger.h"
#include "viper/types.h"
#include "viper/types/networking.h"
#include "viper/types/opengl.h"
#include "viper/types/parser.h"
#include<stdint.h>
#include<getopt.h>
#include<stdlib.h>

static struct __StructViperInternalParserData {
	int commandCount;
	char opts[4096];
	
	ViperOptionAction_t* action;
	struct option* long_options;

} __viperInternalParserData = {

	.commandCount = 1,
	.opts = { 0 },
	.action = NULL,
	.long_options = NULL,
};

int8_t ViperAddParserOption(const char* longCommand, const char* shortCommand, char shortChar, int hasArg, int* flags, void (*function)(ViperConfig_t* config, void* customData), void* customData) {
	int length = 0;
	struct __StructViperInternalParserData* in = &__viperInternalParserData;

	in->action = realloc(in->action, in->commandCount * sizeof(ViperOptionAction_t));
	in->long_options = realloc(in->long_options, in->commandCount * sizeof(struct option));
	
	
	in->long_options[in->commandCount - 1] = (struct option) {
		longCommand,
		hasArg,
		flags,
		shortChar,
	};

	in->action[in->commandCount - 1] = (ViperOptionAction_t){
		.function = function,
		.customData = customData,
	};

	length = strlen(in->opts); 
	memmove(in->opts + length, shortCommand, strlen(shortCommand));

	in->commandCount++;
	return 0;
}

/**
 */
int8_t ViperParseCommands(int arc, char* const* arv, ViperConfig_t* config) {
	struct __StructViperInternalParserData* in = &__viperInternalParserData;
	int index = 0;
	int optValue = 0;

	if (NULL == __viperInternalParserData.long_options) {
		ViperLogError("This function is allowed one call only!");
		return -1;
	}

	in->long_options = realloc(in->long_options, (++in->commandCount) * sizeof(struct option));
	memset(&in->long_options[in->commandCount - 1], 0, sizeof(struct option));

	do {
		optValue = getopt_long(arc, arv, in->opts, in->long_options, &index);

		if (-1 == optValue) {
			break;
		} else if (0 == optValue) {
			if (NULL == in->action[index].function) {
				ViperLogError("Function at index %i is NULL", index);
				continue;
			}

			in->action[index].function(config, NULL);
			continue;
		}

		for (int i = 0; i < in->commandCount; i++) {
			if (optValue == in->long_options[i].val) {
				if (NULL == in->action[i].function) {
					ViperLogError("Function at index %i is NULL", index);
					continue;
				}
				in->action[i].function(config, NULL);
			}
		}

	} while(1);

	
	free(__viperInternalParserData.long_options);
	__viperInternalParserData.long_options = NULL;
	return 0;
}
