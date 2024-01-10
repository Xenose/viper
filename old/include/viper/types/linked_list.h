#ifndef __header_viper_linked_list_types__
#define __header_viper_linked_list_types__

#include<viper/types/structs.h>
#include<viper/types/typedefs.h>

typedef struct __LinkedListNode_t {
	ViperStructType_t sType;
	struct __LinkedListNode_t* pNext;
	struct __LinkedListNode_t* pPrivous;
	void* data;
} ViperLinkedListNode_t;

typedef struct {
	ViperStructType_t sType;

	uint64_t count;
	ViperStructType_t stored;

	ViperLinkedListNode_t* head;
	ViperLinkedListNode_t* tail;
} ViperLinkedList_t;

#endif /* __header_viper_linked_list_types__ */
