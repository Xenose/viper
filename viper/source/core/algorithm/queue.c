#include<viper/core/algorithm/queue.h>
#include<viper/core/algorithm/dynamic_array.h>
#include<viper/core/debug/logger.h>

i8 ViperQueueCreate(ViperQueue_t* queue, ViperStructType_t type, u64 size, u64 itemCount) {
   queue->index = 0;

   if (-1 == ViperDynamicArrayCreate(&queue->data, type, size, itemCount)) {
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
   return ViperDynamicArrayGetItem(&queue->data, queue->index);
}

void* ViperQueuePopItem(ViperQueue_t* queue) {
   void* tmp = ViperDynamicArrayGetItem(&queue->data, queue->index);

   if (-1 == ViperDynamicArrayClearItem(&queue->data, queue->index)) {
      ViperLogWarning("Failed to clear internal dynamic array in queue");
   }

   if (++queue->index >= queue->data.count) {
      queue->index = 0;
   }

   return tmp;
}

i64 ViperQueueInsertItem(ViperQueue_t* queue, void* item) {
	i64 index = queue->index + 1;

	if (queue->data.size < queue->count + 1) {
		goto ERROR_EXIT;
	}

	if (index >= queue->data.size) {
		queue->index = 0;
	}

	index = 0 == queue->index ? queue->count : queue->index - 1;

	if (0 != ViperDynamicArrayInsertItem(&queue->data, index, item)) {
		goto ERROR_EXIT;
	}

	++queue->count;

	return 0;
ERROR_EXIT:
	return -1;
}
