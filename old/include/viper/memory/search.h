#ifndef __header_viper_search_memory__
#define __header_viper_search_memory__

#include<stdint.h>

extern int64_t ViperMemoryFindLongstMatchFromStart(int8_t* start, int8_t* current, int8_t* end, int64_t maxLength);
extern int64_t ViperMemoryFindLongestMatchFromEnd(int8_t* end, int8_t* current, int8_t* start, int64_t maxLength);

#endif /* __header_viper_search_memory__ */
