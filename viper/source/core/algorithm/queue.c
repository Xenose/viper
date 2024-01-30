#include<viper/core/algorithm/queue.h>
#include<viper/core/algorithm/dynamic_array.h>
#include<viper/core/debug/logger.h>

i8 ViperQueueCreate(ViperQueue_t* queue, ViperStructType_t type, u64 size, u64 itemCount) {
   queue->insertIndex = 0;
   queue->currentIndex = 0;
   queue->count = 0;

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
   return ViperDynamicArrayGetItem(&queue->data, queue->currentIndex++);
}

i8 ViperQueuePopItem(ViperQueue_t* queue) {
   if (-1 == ViperDynamicArrayClearItem(&queue->data, queue->currentIndex++)) {
      ViperLogWarning("Failed to clear internal dynamic array in queue");
   }

   return --queue->count;
}

i64 ViperQueueInsertItemExpand(ViperQueue_t* restrict queue, void* restrict item) {
   if (0 != ViperDynamicArrayInsertItem(&queue->data, queue->insertIndex++, item)) {
      ViperLogDebug("Failed to insert item");
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

