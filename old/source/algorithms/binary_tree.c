#include<viper/threading/master.h>
#include<viper/types.h>
#include<viper/algorithms/binary_tree.h>
#include<viper/debug/logger.h>

int8_t BinaryTreeInsertNode(ViperBinaryTree_t* tree, int64_t value, void* ptr) {
	ViperBinaryTreeNode_t* node = NULL;
	
	ViperUnsafeStructAccess(tree[0]);

	if (0 == tree->nodeCount) {
		node = tree->node = calloc(1, sizeof(ViperBinaryTreeNode_t));

		if (NULL == tree->node) {
			ViperLogError("Unable to allocate binary tree with the value [ %i ]", value);
			goto ERROR_EXIT;
		}

		tree->nodeValue = value;
		node->data = ptr;
		goto EXIT;
	}

	node = tree->node;

	while (node != NULL) {
		if (node->rightValue < value) {

		} else {
		}
	}


EXIT:
	ViperUnsafeStructRelease(tree[0]);
	return 0;
ERROR_EXIT:
	ViperUnsafeStructRelease(tree[0]);
	return -1;
}
