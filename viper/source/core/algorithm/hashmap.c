#include<viper/core/algorithm/hashmap.h>


/**
 * ViperHashmapCreate is a function to in initialize the ViperHashmap_t struct and set its initial size.
 *
 * @param hash :: This is the ViperHashmap_t that will store all the data.
 * @param hashmapType :: For now this will be either a static or dynamic hashmap.
 * @param type :: The type of the struct that will be stored.
 * @param size :: The size of the data to be stored.
 * @param count :: Number of items that can be stored in the hashmap.
 *
 * @return Either returns 0 for success or -1 for failure.
 */
i8 ViperHashmapCreate(ViperHashmap_t hash, ViperStructType_t hashmapType, ViperStructType_t type, u64 size, u64 count) {
   return 0;
}

i8 ViperHashmapInsert(ViperHashmap_t hash, void* ptr) {
   return 0;
}

i8 ViperHashmapInsertItems(ViperHashmap_t hash, u64 count, ...) {
   return 0;
}

i8 ViperHashmapRemove(ViperHashmap_t hash, cc* key) {
   return 0;
}

void* ViperHashmapGet(ViperHashmap_t hash, cc* key) {
   return 0;
}

void* ViperHashmapGetByIndex(ViperHashmap_t hash, u64 index) {
   return 0;
}

i8 ViperHashmapExpand(ViperHashmap_t hash, u64 count) {
   return 0;
}
