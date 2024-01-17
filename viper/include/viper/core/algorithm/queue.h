#ifndef __header_viper_core_algorithm_queue__
#define __header_viper_core_algorithm_queue__

#include<viper/core/types/queue.h>

extern i8 ViperQueueCreate(ViperQueue_t* queue, ViperStructType_t type, u64 size, u64 itemCount);
extern i64 ViperQueueInsertItem(ViperQueue_t* queue, void* item);
extern void* ViperQueueGetItem(ViperQueue_t* queue);
extern i8 ViperQueuePopItem(ViperQueue_t* queue);

#endif /* __header_viper_core_algorithm_queue__ */
