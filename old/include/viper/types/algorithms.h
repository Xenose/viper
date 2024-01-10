#ifndef __header_viper_algorithms_types__
#define __header_viper_algorithms_types__

#include <stdatomic.h>
#include<viper/types/typedefs.h>
#include<viper/types/structs.h>
#include<viper/types/memory.h>

#pragma pack(push,1)
	typedef struct {
		ViperStructType_t sType;
		atomic_flag locked;

		struct {
			// [ FLG ] first bytes
			uint8_t flg_version   		: 2;
			uint8_t flg_bindep    		: 1;
			uint8_t flg_bchecksum 		: 1;
			uint8_t flg_contentSize    : 1;
			uint8_t flg_cchecksum 		: 1;
			uint8_t flg_reserved  		: 1;
			uint8_t flg_doctonaryID		: 1;

			// [ BD ] second byte
			uint8_t bd_reserved1 		: 1;
			uint8_t bd_blockMaxSize 	: 3;
			uint8_t bd_reserved2 		: 4;
		} data;
	} ViperHeaderLZ4;

	typedef struct {
		ViperStructType_t sType;
		atomic_flag locked;

		struct {
			int8_t length : 4;
			int8_t offset : 4;
		} Data;
	} ViperTokenLZ4;
#pragma pack(pop)

typedef struct {
	ViperStructType_t sType;
	atomic_flag lock;
	ViperMemoryRegion_t region;
} ViperNodeLZ77_t;

typedef struct {
	ViperStructType_t sType;
	atomic_flag looked;

	ViperStructType_t stored;
	uint64_t count;

	union {
		void* ptr;
		int8_t* buffer;
	};
} ViperDynamicArray_t;

#endif /* __header_viper_algorithms_types__ */
