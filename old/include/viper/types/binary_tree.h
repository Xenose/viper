#ifndef __header_viper_binary_tree_types__
#define __header_viper_binary_tree_types__

#include<stdatomic.h>
#include<viper/types/structs.h>

typedef struct __ViperBinaryTreeNode_t {
	ViperStructType_t sType;
	atomic_flag locked;

	void* data;

	auint64_t rightValue;
	struct __BinaryTreeNode_t* right;

	auint64_t leftValue;
	struct __BinaryTreeNode_t* left;
} ViperBinaryTreeNode_t;

typedef struct {
	ViperStructType_t sType;
	atomic_flag locked;

	auint64_t nodeCount;
	auint64_t nodeValue;
	ViperBinaryTreeNode_t* node;
} ViperBinaryTree_t;

#endif /* __header_viper_binary_tree_types__ */
