#ifndef __header_viper_core_algorithm__
#define __header_viper_core_algorithm__

#include<viper/core/types/enums.h>
#include<viper/core/types/hashmap.h>
/**
 * ViperHashmapCreate is a function to in initialize the ViperHashmap_t struct and set its initial size.
 *
 * @param hash :: This is the ViperHashmap_t that will store all the data.
 * @param flags ::
 * @paran resize :: 
 * @param type :: The type of the struct that will be stored.
 * @param size :: The size of the data to be stored.
 * @param count :: Number of items that can be stored in the hashmap.
 *
 * @return Either returns 0 for success or -1 for failure.
 */
extern i8 ViperHashmapCreate(ViperHashmap_t* hash, ViperStructType_t hashType, u64 resize, ViperStructType_t type, u64 size, u64 count);
extern i8 ViperHashmapClearItem(ViperHashmap_t* hash, cc* key);
extern i8 ViperHashmapExpand(ViperHashmap_t* hash);
extern void* ViperHashmapGetByIndex(ViperHashmap_t* hash, u64 index);
extern void* ViperHashmapGet(ViperHashmap_t* hash, cc* key);
extern i8 ViperHashmapInsert(ViperHashmap_t* hash, cc* key, void* ptr);
extern i8 ViperHashmapInsertItems(ViperHashmap_t* hash, u64 count, ...);

#endif /* __header_viper_core_algorithm__ */
