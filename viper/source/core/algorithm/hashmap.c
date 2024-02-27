#include<errno.h>
#include<string.h>
#include<stdarg.h>

#include<viper/core/algorithm/hashmap.h>
#include<viper/core/algorithm/dynamic_array.h>
#include<viper/core/algorithm/hash.h>
#include<viper/core/debug/logger.h>
#include<viper/core/memory/allocator.h>

i8 ViperHashmapCreate(ViperHashmap_t* hash, ViperStructType_t hashType, u64 resize, ViperStructType_t type, u64 size, u64 count) {
   hash->sType = hashType;
   hash->size = size;
   hash->count = count;

   if (NULL != hash->data) {
      ViperLogWarning("Hashmap is not null");
      goto ERROR_EXIT;
   }

   hash->data = ViperCalloc(count, sizeof(ViperHashmapItem_t));

   return 0;
ERROR_EXIT:
   return -1;
}

i8 ViperHashmapClearItem(ViperHashmap_t* hash, cc* key) {
   u64 index = ViperHashSimple(hash->count, key);

   if (NULL == hash->data[index].ptr) {
      ViperLogNotice("No item at [ %s ]", key);
      goto EXIT;
   }

   ViperFree(hash->data[index].key.ptr);
   ViperFree(hash->data[index].ptr);

   hash->data[index].key.ptr = NULL;
   hash->data[index].key.length = 0;
   hash->data[index].ptr = NULL;
EXIT:
   return 0;
}

i8 ViperHashmapExpand(ViperHashmap_t* hash) {
   u64 index = 0;
   void* tmp = ViperRealloc(hash->data, (hash->count * sizeof(ViperHashmapItem_t) + hash->resize));

   if (NULL == tmp) {
      ViperLogError("Failed to realloc memory [ %e ]", errno);
      goto ERROR_EXIT;
   }

   for (u64 i = 0; i < hash->count; i++) {
      if (NULL != hash->data[i].ptr) {
         index = ViperHashSimple(hash->count, hash->data[i].key.str);
      }
   }

   return 0;
ERROR_EXIT:
   return -1;
}

void* ViperHashmapGetByIndex(ViperHashmap_t* hash, u64 index) {
   return hash->data[index].ptr;
}

void* ViperHashmapGet(ViperHashmap_t* hash, cc* key) {
   u64 index = ViperHashSimple(hash->count, key);
   return ViperHashmapGetByIndex(hash, index);
}


i8 ViperHashmapInsert(ViperHashmap_t* hash, cc* key, void* ptr) {
   u64 index = 0;

RETRY:
   index = ViperHashSimple(hash->count, key);
   
   if (NULL != hash->data[index].ptr) {
      if (VIPER_STRUCT_TYPE_DYNAMIC_HASHMAP == hash->sType) {
         if (0 != ViperHashmapExpand(hash)) {
            ViperLogError("Failed to expand hashmap");
            goto ERROR_EXIT;
         }

         // We have expanded the array lets try again.
         goto RETRY;
      }

      ViperLogWarning("Static Hashmap :: Location is taken [ %i ]", index);
      goto ERROR_EXIT;
   }

   hash->data[index].key.length = strlen(key);
   hash->data[index].key.str =  ViperStringDuplicate(key);
   hash->data[index].ptr = ViperMalloc(hash->size);
   memcpy(hash->data[index].ptr, ptr, hash->size);

   return 0;
ERROR_EXIT:
   return -1;
}

i8 ViperHashmapInsertItems(ViperHashmap_t* hash, u64 count, ...) {
   va_list args;
   va_start(args, count);

   for (u64 i = 0; i < count; i++) {
      char* key = va_arg(args, char*);
      char* ptr = va_arg(args, void*);

      if (ViperHashmapInsert(hash, key, ptr)) {
         ViperLogError("Failed to insert item [ %s ]", key);
      }
   }

   va_end(args);

   return 0;
}
