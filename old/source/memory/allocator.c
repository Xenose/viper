#include<viper/memory/allocator.h>

static auint64_t __heapStaticSizeCurrent = 0;
static auint64_t __heapDynamicSizeCurrent = 0;

static auint64_t __heapStaticSize = 0;
static auint64_t __heapDynamicSize = 0;

static auint8_t* __heapStatic = NULL;
static auint8_t* __heapDynamic = NULL;

/**
 * Instead of allocating the memory at runtime we should instead allocate it
 * at startup time allowing for faster memory operations.
 *
 * @param heapStaticSize :: the size for the static heap that will be pre-allocated
 * @param heapDynamicSize :: the size for the dynamic heap that will be pre-allocated
 */
void InitAllocator(uint64_t heapStaticSize, uint64_t heapDynamicSize) {
	__heapStatic = (auint8_t*)mmap(NULL, heapStaticSize, PROT_WRITE, MAP_SHARED, 0, 0);
	__heapDynamic = (auint8_t*)mmap(NULL, heapDynamicSize, PROT_WRITE, MAP_SHARED, 0, 0);
}

void* DynamicAllocation() {
	return NULL;
}

void* StaticAllocation() {
	return NULL;
}

void* StaticHugeAllocation() {
	return NULL;
}

void* DynamicHugeAllocation() {
	return NULL;
}

void* Allocate() {
	return NULL;
}

void* Reallocate() {
	return NULL;
}

void* FreeStatic(void* ptr) {
	return NULL;
}

void* FreeDynamic(void* ptr) {
	return NULL;
}
