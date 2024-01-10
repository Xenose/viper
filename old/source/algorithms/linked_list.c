#include<stdint.h>
#include<stdlib.h>
#include<viper/types.h>
#include<viper/types/linked_list.h>
#include<viper/algorithms/linked_list.h>
#include<viper/types/structs.h>
#include<viper/types/varibles.h>
#include<viper/debug/logger.h>

#define CASE_VARIBLE_ADD(STRUCTURE_TYPE, LIST, NODES, TYPE, VAR_TYPE, COUNT, VA, GOTO) case STRUCTURE_TYPE: {\
		TYPE* data = (TYPE*)calloc(count, sizeof(TYPE)); \
		\
		if (NULL == data) { \
			ViperLogError("Failed to alloacte memory for #TYPE"); \
			goto GOTO; \
		} \
		\
		for (int64_t i = 0; i < COUNT; i++) { \
			data->sType = STRUCTURE_TYPE; \
			data->value = va_arg(VA, VAR_TYPE); \
			\
			NODES[i].data = data; \
			\
			if (NULL != list->head && NULL != list->tail) { \
				LIST->tail->pNext = &NODES[i]; \
			} else { \
				ViperLogDebug("Creating new list %s", #TYPE); \
			} \
			NODES[i].pPrivous = LIST->tail; \
			LIST->tail = &NODES[i]; \
		} \
	} break

#define CASE_STRUCTURE_ADD(STRUCTURE_TYPE, LIST, NODES, TYPE, COUNT, VA, GOTO) case STRUCTURE_TYPE: {\
		for (int64_t i = 0; i < COUNT; i++) { \
			TYPE* ptr = va_arg(VA, TYPE*); \
			NODES[i].data = malloc(sizeof(TYPE)); \
			memcpy(NODES[i].data, ptr, sizeof(TYPE)); \
			\
			if (NULL != list->head && NULL != list->tail) { \
				LIST->tail->pNext = &NODES[i]; \
			} else { \
				ViperLogDebug("Creating new list %s", #TYPE); \
			} \
			NODES[i].pPrivous = LIST->tail; \
			LIST->tail = &NODES[i]; \
		} \
	} break

/**
 * This function will add items to a existing LinkedList_t object,
 * the objects or variables needs to match the stored items.
 *
 * @param list :: the list that will have the items added.
 * @param count :: the count of the new items that will be added.
 * @param args :: the va_list with the itmes stored in it.
 */
int __ViperLinkedListAddItemVA(ViperLinkedList_t* list, int64_t count, va_list args) {
	ViperLinkedListNode_t* node = list->tail;
	ViperLinkedListNode_t* newNodes = NULL;

	if (NULL == (newNodes = (ViperLinkedListNode_t*)calloc(count, sizeof(ViperLinkedListNode_t)))) {
		ViperLogError("Failed to allocate LinkedList_t nodes");
		goto ERROR_EXIT;
	}
	newNodes->pPrivous = node;

	if (NULL != list->head && NULL != list->tail) {
		node->pNext = newNodes;
	}

	switch (atomic_load(&list->sType)) {
		/* Normal varibles */
		CASE_VARIBLE_ADD(VIPER_VARIABLE_TYPE_INT, list, newNodes, ViperInt_t, int64_t, count, args, ERROR_EXIT);
		CASE_VARIBLE_ADD(VIPER_VARIABLE_TYPE_FLOAT, list, newNodes, ViperFloat_t, double, count, args, ERROR_EXIT);

		/* Structures */
		CASE_STRUCTURE_ADD(VIPER_STRUCTURE_TYPE_APPLICATION, list, newNodes, ViperApplication_t, count, args, ERROR_EXIT);
		CASE_STRUCTURE_ADD(VIPER_STRUCTURE_TYPE_VULKAN, list, newNodes, ViperVulkan_t, count, args, ERROR_EXIT);
		default:
			ViperLogError("Unknown type");
	} /* switch (atomic_load(&list->sType)) */

	if (NULL == list->head) {
		list->head = newNodes;
	}
	ViperLogDebug("Exiting __LinkedListAddItemVA");
	return 0;
ERROR_EXIT:
	return -1;
}

/**
 * This function will set the structures memory to zero and the sType
 * to the type tat is passed in, after this is done object will be
 * added to the list itself.
 *
 * @note This function will conver basic type like **int** into Int_t, \
 * so when using this function keep this in mind.
 *
 * @param list :: is the object that will be used to store information.
 * @param type :: is the type that will be use STRUCTURE_TYPE_XXX or VARBIALE_TYPE_XXX
 * @param count :: is the number passed in to the function.
 * @param ... :: is the actual values.
 *
 * @return This function will return a copy of the LinkedList_t.
 */
ViperLinkedList_t ViperLinkedListInit(ViperLinkedList_t* list, int64_t type, int64_t count, ...) {
	va_list args;
	int returnCode = 0;

	memset(list, 0, sizeof(ViperLinkedListNode_t));
	list->sType = type;

	va_start(args, count);
	returnCode = __ViperLinkedListAddItemVA(list, count, args);
	va_end(args);

	return *list;
}

/**
 * Wrapper function for __LinkedListAddItemVA.
 *
 * @param list :: the list that will have the items added.
 * @param count :: the count of the new items that will be added.
 */
int __ViperLinkedListAddItem(ViperLinkedList_t* list, int64_t count, ...) {
	va_list args;
	int returnCode = 0;

	va_start(args, count);
	returnCode = __ViperLinkedListAddItemVA(list, count, args);
	va_end(args);

	return returnCode;
}

int LinkedListDeleteItem(ViperLinkedList_t* list, uint64_t index) {
	return index;
}

int LinkedListInsertItem(ViperLinkedList_t* list, uint64_t index, ...) {
	return index;
}

/**
 * This function is the underlaying function for retriving items
 * in a linked list.
 *
 * @param list :: The list object.
 * @param index :: The index where the obejct is stored.
 */
void* __LinkedListGetItem(ViperLinkedList_t* list, uint64_t index) {
	ViperLinkedListNode_t* node = list->head;

	if (NULL != node) for (register int i = 0; i < index; i++) {
		if (NULL == node->pNext) {
			ViperLogDebug("LinkedList_t item not found");
			return NULL;
		}
		node = node->pNext;
	}
	return node->data;
}

ViperLinkedList_t* LinkedListClear(ViperLinkedList_t* list) {
	return list;
}

ViperLinkedList_t* LinkedListDelete(ViperLinkedList_t* list) {
	return list;
}

void* LinkedListToArray(ViperLinkedList_t* list) {
	return NULL;
}

