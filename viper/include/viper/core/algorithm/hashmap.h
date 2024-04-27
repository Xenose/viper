#ifndef __header_viper_core_algorithm__
#define __header_viper_core_algorithm__

#include<viper/core/types/enums.h>
#include<viper/core/types/hashmap.h>

/**
 * ViperHashmapCreate is a function to in initialize the ViperHashmap_t struct and set its initial size.
 *
 * @param hash :: This is the ViperHashmap_t that will store all the data.
 * @param flags ::
 * @paran resize :: If memory is not enough this variable will be used for the resize count.
 * @param type :: The type of the struct that will be stored.
 * @param size :: The size of the data to be stored.
 * @param count :: Number of items that can be stored in the hashmap.
 *
 * @return Either returns 0 for success or -1 for failure.
 */
extern i8 ViperHashmapCreate(ViperHashmap_t* hash, ViperStructType_t hashType, u64 resize, ViperStructType_t type, u64 size, u64 count);

/**
 * ViperHashmapClearItem will clear the item at the stored location.
 *
 * @param hash :: The ViperHashmap_t that stores the data.
 * @param key :: The key for the item to be cleared.
 */
extern i8 ViperHashmapClearItem(ViperHashmap_t* hash, cc* key);

/**
 * ViperHashmapExpand will expand the under laying dynamic array,
 * allowing for more items to be stored, the hashmaps resize
 * variable will be used to expand the hashmap.
 *
 * @return Returns 0 on success and -1 on error.
 */
extern i8 ViperHashmapExpand(ViperHashmap_t* hash);

/**
 * ViperHashmapGetByIndex this function is not to useful for the developer,
 * but this can be used to loop through the entire hashmap.
 *
 * @param hash :: The ViperHashmap_t with the stored data.
 * @param index :: The index for the item.
 *
 * @return Returns a pointer to the object.
 */
extern void* ViperHashmapGetByIndex(ViperHashmap_t* hash, u64 index);

/**
 * ViperHashmapGet will return the item at the key location or
 * NULL if the item is not found.
 *
 * @param hash :: The ViperHashmap_t object with the data.
 * @param key :: The key to the item.
 *
 * @return Returns the item on success and NULL on error.
 */
extern void* ViperHashmapGet(ViperHashmap_t* hash, cc* key);

/**
 */
extern i8 ViperHashmapInsert(ViperHashmap_t* hash, cc* key, void* ptr);

/**
 */
extern i8 ViperHashmapInsertItems(ViperHashmap_t* hash, u64 count, ...);

#endif /* __header_viper_core_algorithm__ */
