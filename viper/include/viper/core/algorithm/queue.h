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

/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define QueueCreate              ViperQueueCreate
#define QueueInsertItemExpand    ViperQueueInsertItemExpand
#define QueueInsertItem          ViperQueueInsertItem
#define QueueGetItem             ViperQueueGetItem
#define QueueGetNextItem         ViperQueueGetNextItem
#define QueuePopItem             ViperQueuePopItem

#define AtomicQueueCreate           ViperAtomicQueueCreate
#define AtomicQueueDestroy          ViperAtomicQueueDestroy
#define AtomicQueueGetItem          ViperAtomicQueueGetItem
#define AtomicQueueGetNextItem      ViperAtomicQueueGetNextItem
#define AtomicQueueQueuePopItem     ViperAtomicQueuePopItem
#define AtomicQueueInsertItemExpand ViperAtomicQueueInsertItemExpand
#define AtomicQueueInsertItem       ViperAtomicQueueInsertItem

#endif /* VIPER_USE_NAMESPACE */

#endif /* __header_viper_core_algorithm_queue__ */
