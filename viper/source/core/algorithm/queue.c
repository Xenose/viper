#include <stdatomic.h>
#include<unistd.h>
#include<viper/core/algorithm/queue.h>
#include<viper/core/algorithm/dynamic_array.h>
#include<viper/core/debug/logger.h>

i8 ViperQueueCreate(ViperQueue_t* queue, ViperStructType_t type, u64 size, u64 itemCount) {
	queue->insertIndex = 0;
	queue->currentIndex = 0;
	queue->count = 0;

   sleep(1);
	if (-1 == ViperDynamicArrayCreate(&queue->data, type, size, itemCount)) {
		ViperLogError("Failed to allocate queue dynamic array");
		goto ERROR_EXIT;
	}

	return 0;
ERROR_EXIT:
	return -1;
}

i8 ViperQueueDestroy() {
	return 0;
}

void* ViperQueueGetItem(ViperQueue_t* queue) {
	return ViperDynamicArrayGetItem(&queue->data, queue->currentIndex);
}

void* ViperQueueGetNextItem(ViperQueue_t* queue) {
   u64 index = 0;

   if (0 == queue->count) {
      goto ERROR_EXIT;
   }

   index = queue->currentIndex++;

   if (queue->count <= index) {
      index = 0;
      queue->currentIndex = 1;
   }

	return ViperDynamicArrayGetItem(&queue->data, index);
ERROR_EXIT:
   return NULL;
}

i64 ViperQueuePopItem(ViperQueue_t* queue) {
	if (-1 == ViperDynamicArrayClearItem(&queue->data, queue->currentIndex++)) {
		ViperLogWarning("Failed to clear internal dynamic array in queue");
	}

	return --queue->count;
}

i64 ViperQueueInsertItemExpand(ViperQueue_t* restrict queue, void* restrict item) {
	if (0 != ViperDynamicArrayInsertItem(&queue->data, queue->insertIndex++, item)) {
		ViperLogDebug("Failed to insert item");
      queue->insertIndex--;
		goto ERROR_EXIT;
	}

	++queue->count;

	return 0;
ERROR_EXIT:
	return -1;
}

i64 ViperQueueInsertItem(ViperQueue_t* restrict queue, void* restrict item) {
	if (queue->count >= queue->data.count) {
		ViperLogWarning("Queue is full");
		goto ERROR_EXIT;
	}

	return ViperQueueInsertItemExpand(queue, item);
ERROR_EXIT:
	return -1;
}

// --------------------------------------------------------------------------------------------------
// 	Atomic Queue Operations
// --------------------------------------------------------------------------------------------------

i8 ViperAtomicQueueCreate(ViperAtomicQueue_t* queue, ViperStructType_t type, u64 size, u64 itemCount) {
	i8 out = 0;

	// spin-lock
	while (atomic_flag_test_and_set(&queue->locked));

	out = ViperQueueCreate(&queue->queue, type, size, itemCount);
	atomic_flag_clear(&queue->locked);

	return out;
}

i8 ViperAtomicQueueDestroy() {
	return 0;
}

void* ViperAtomicQueueGetItem(ViperAtomicQueue_t* queue) {
	void* out = NULL;

	// spin-lock
	while (atomic_flag_test_and_set(&queue->locked));

	out = ViperQueueGetItem(&queue->queue);
	atomic_flag_clear(&queue->locked);

	return out;
}

void* ViperAtomicQueueGetNextItem(ViperAtomicQueue_t* queue) {
	void* out = NULL;

	// spin-lock
	while (atomic_flag_test_and_set(&queue->locked));

	out = ViperQueueGetNextItem(&queue->queue);
	atomic_flag_clear(&queue->locked);

	return out;
}

i64 ViperAtomicQueuePopItem(ViperAtomicQueue_t* queue) {
	i64 out = 0;

	// spin-lock
	while (atomic_flag_test_and_set(&queue->locked));

	out = ViperQueuePopItem(&queue->queue);
	atomic_flag_clear(&queue->locked);

	return out;
}

i64 ViperAtomicQueueInsertItemExpand(ViperAtomicQueue_t* restrict queue, void* restrict item) {
	i64 out = 0;

	// spin-lock
	while (atomic_flag_test_and_set(&queue->locked));

	out = ViperQueueInsertItemExpand(&queue->queue, item);
	atomic_flag_clear(&queue->locked);

	return out;
}

i64 ViperAtomicQueueInsertItem(ViperAtomicQueue_t* restrict queue, void* restrict item) {
	i64 out = 0;

	// spin-lock
	while (atomic_flag_test_and_set(&queue->locked));

	out = ViperQueueInsertItemExpand(&queue->queue, item);
	atomic_flag_clear(&queue->locked);

	return out;
}
