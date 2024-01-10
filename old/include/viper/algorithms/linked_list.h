#ifndef __header_viper_linked_list__
#define __header_viper_linked_list__

#include<viper/types/linked_list.h>

#define LinkedListGetItem(TYPE, LIST, INDEX) ((TYPE*)__LinkedListGetItem(LIST, INDEX))

extern ViperLinkedList_t LinkedListInit(ViperLinkedList_t* list, int64_t type, int64_t count, ...);
extern void* __ViperLinkedListGetItem(ViperLinkedList_t* list, uint64_t index);

#endif /* __header_viper_linked_list__ */
