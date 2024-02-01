#ifndef __header_viper_core_algorithm_queue__
#define __header_viper_core_algorithm_queue__

#include<viper/core/types/queue.h>

extern i8 ViperQueueCreate(ViperQueue_t* queue, ViperStructType_t type, u64 size, u64 itemCount);
extern i64 ViperQueueInsertItemExpand(ViperQueue_t* restrict queue, void* restrict item);
extern i64 ViperQueueInsertItem(ViperQueue_t* queue, void* item);
extern void* ViperQueueGetItem(ViperQueue_t* queue);
extern void* ViperQueueGetNextItem(ViperQueue_t* queue);
extern i64 ViperQueuePopItem(ViperQueue_t* queue);

// ------------------------------------------------------------------------------------------------------------
// 	Atomic Queue Functions
// ------------------------------------------------------------------------------------------------------------

extern i8 ViperAtomicQueueCreate(ViperAtomicQueue_t* queue, ViperStructType_t type, u64 size, u64 itemCount);
extern i8 ViperAtomicQueueDestroy();
extern void* ViperAtomicQueueGetItem(ViperAtomicQueue_t* queue);
extern void* ViperAtomicQueueGetNextItem(ViperAtomicQueue_t* queue);
extern i64 ViperAtomicQueuePopItem(ViperAtomicQueue_t* queue);
extern i64 ViperAtomicQueueInsertItemExpand(ViperAtomicQueue_t* restrict queue, void* restrict item);
extern i64 ViperAtomicQueueInsertItem(ViperAtomicQueue_t* restrict queue, void* restrict item);

#endif /* __header_viper_core_algorithm_queue__ */
