#include<stdlib.h>
#include<errno.h>
#include<string.h>
#include<stdarg.h>

#include<viper/core/types/enums.h>
#include<viper/core/memory/allocator.h>
#include<viper/core/algorithm/dynamic_array.h>
#include<viper/core/debug/logger.h>

/**
 * The ViperDynamicArrayExpand function can be used to either
 * shrink or expand the function, but this function should be
 * used by the other dynamic array function instead of being
 * used directly.
 *
 * @param array :: The array object.
 * @param count :: The count of objects.
 *
 * @return On success 0 and on error -1.
 */
i8 ViperDynamicArrayExpand(ViperDynamicArray_t* array, u64 count) {
   void* tmp = ViperRealloc(array->ptr, count * array->size);

   if (NULL == tmp) {
      ViperLogError("Failed to realloc memory [ %e ]", errno);
      goto ERROR_EXIT;
   }

   memset(((u8*)tmp) + count, 0, count - array->count);
   array->ptr = tmp;
   array->count = count;

   return 0;
ERROR_EXIT:
   return -1;
}

/**
 * The ViperDynamicArrayCreate function will set all the initial data
 * of the dynamic array.
 *
 * @param array :: The array object.
 * @param type :: The type of the object to be stored.
 * @param size :: The size of the item that will be stored.
 * @param count :: The number of objects to pre-allocate.
 *
 * @return Returns 0 on succes and -1 on error.
 */
i8 ViperDynamicArrayCreate(ViperDynamicArray_t* array, ViperStructType_t type, u64 size, u64 count) {
   *array = (ViperDynamicArray_t){
      .sType = VIPER_STRUCT_TYPE_DYNAMIC_ARRAY,
      .storedType = type,
      .size = size,
      .count = count,
   };

   if (0 != ViperDynamicArrayExpand(array, count)) {
      // No log needed provided by the function.
      goto ERROR_EXIT;
   }

   return 0;
ERROR_EXIT:
   return -1;
}

/**
 * The ViperDynamicArrayGetItem function will return the item
 * at the index.
 *
 * @param array :: The array object.
 * @param index :: The index where the item will be retrived.
 *
 * @return The void pointer where the item is stored.
 */
void* ViperDynamicArrayGetItem(ViperDynamicArray_t* array, u64 index) {
   return ((u8*)array->ptr) + (array->size * index);
}

/**
 * The ViperDynamicArrayInserItem will insert a single item into the
 * array object.
 *
 * @param array :: The array object.
 * @param index :: The location where the item will be inserted.
 * @param item :: The item that will be copied to.
 *
 * @return On success will return 0 and on error will return -1.
 */
i8 ViperDynamicArrayInsertItem(ViperDynamicArray_t* array, u64 index, void* item) {
   if (index >= array->count) {
      if (0 != ViperDynamicArrayExpand(array, index + 1)) {
         // No log needed provided by the function.
         goto ERROR_EXIT;
      }
   }

   memmove(((u8*)array->ptr) + (array->size * index), item, array->size);

   return 0;
ERROR_EXIT:
   return -1;
}

/**
 * The ViperDynamicArrayInsertItems function is a more complex
 * function compared to ViperDynamicArrayInsertItem as it takes
 * several pointers to the varbiles to be inserted and copies them
 * one by one into the storage array.
 *
 * @param array :; The array object.
 * @param index :: Where the items start there insertion.
 * @param count :: How many object will be inserted.
 * @param ... :: The pointers to the object.
 *
 * @return On success 0 and on failure -1.
 */
i8 ViperDynamicArrayInsertItems(ViperDynamicArray_t* array, u64 index, u64 count, ...) {
   va_list items;
   va_start(items, count);

   if ((index + count) >= array->count) {
      if (0 != ViperDynamicArrayExpand(array, index + count + 1)) {
         // No log needed provided by the function.
         goto ERROR_EXIT;
      }
   }

   for (u64 i = 0; i < count; i++) {
      memmove(((u8*)array->ptr) + (array->size * i), va_arg(items, void*), array->size);
   }

   va_end(items);
   return 0;
ERROR_EXIT:
   va_end(items);
   return -1;
}

/**
 * This function will add a new item at the end of the array.
 *
 * @param array :: The array that will be used.
 * @param item :: The item that will be added to the end of the array.
 *
 * @return On error -1 will be returned and on success 0.
 */
i8 ViperDynamicArrayPushItem(ViperDynamicArray_t* array, void* item) {
   u64 newCount = array->count + 1;

   if (0 != ViperDynamicArrayExpand(array, newCount)) {
      // No log needed provided by the function.
      goto ERROR_EXIT;
   }

   memmove(((u8*)array->ptr) + array->count, item, array->size);
   array->count = newCount;

   return 0;
ERROR_EXIT:
   return -1;
}

/**
 * The ViperDynamicArrayClearItem function will clear the item at the
 * given index and if the index is outside the array->count varible
 * then the array will be expanded.
 *
 * @param array :: The array object.
 * @param index :: The index where the item will be cleared.
 *
 * @return success 0 and on error -1.
 */
i8 ViperDynamicArrayClearItem(ViperDynamicArray_t* array, u64 index) {
   if (index >= array->count) {
      if (0 != ViperDynamicArrayExpand(array, index + 1)) {
         // No log needed provided by the function.
         goto ERROR_EXIT;
      }
   }

   memset(((u8*)array->ptr) + (array->size * index), 0, array->size);

   return 0;
ERROR_EXIT:
   return -1;
}

/**
 * The ViperDynamicArrayDelete will delete the array
 * and all its contenet and reset the information of
 * the array object allowing for reuse of the varible.
 *
 * @param arry :: The array object.
 *
 * @return For now a 0 will always return, in the future
 * this might change and in that case it will be a negative
 * number for errors.
 */
i8 ViperDynamicArrayDelete(ViperDynamicArray_t* array) {
   *array = (ViperDynamicArray_t){
      .sType = 0, // TODO set right type
      .storedType = 0,
      .size = 0,
      .count = 0,
   };

   if (NULL != array->ptr) {
      ViperFree(array->ptr);
      array->ptr = NULL;
   }

   return 0;
}
