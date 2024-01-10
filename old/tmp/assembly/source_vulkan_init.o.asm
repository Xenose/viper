	.text
	.intel_syntax noprefix
	.file	"init.c"
	.globl	ViperVulkanGetPhysicalDevice    # -- Begin function ViperVulkanGetPhysicalDevice
	.p2align	4, 0x90
	.type	ViperVulkanGetPhysicalDevice,@function
ViperVulkanGetPhysicalDevice:           # @ViperVulkanGetPhysicalDevice
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 1072
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 1000], rdi
	mov	qword ptr [rbp - 1008], rsi
	mov	qword ptr [rbp - 1016], 0
	mov	dword ptr [rbp - 836], 0
	mov	qword ptr [rbp - 1024], 0
	lea	rdi, [rbp - 832]
	xor	esi, esi
	mov	edx, 824
	call	memset@PLT
	mov	qword ptr [rbp - 864], 0
	mov	qword ptr [rbp - 856], 4
	mov	qword ptr [rbp - 848], 0
	lea	rax, [rbp - 864]
	lea	rdi, [rip + .L.str]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rbp - 1008]
	mov	byte ptr [rbp - 1025], 1
	mov	al, byte ptr [rbp - 1025]
	xchg	byte ptr [rcx + 8], al
	mov	byte ptr [rbp - 1026], al
	test	byte ptr [rbp - 1026], 1
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_1
.LBB0_3:
	mov	rax, qword ptr [rbp - 1008]
	mov	rdi, qword ptr [rax + 96]
	lea	rsi, [rbp - 836]
	xor	eax, eax
	mov	edx, eax
	call	vkEnumeratePhysicalDevices@PLT
	movsxd	rcx, eax
	mov	qword ptr [rbp - 1016], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	je	.LBB0_5
# %bb.4:
	mov	qword ptr [rbp - 888], 0
	mov	qword ptr [rbp - 880], 4
	mov	qword ptr [rbp - 872], 0
	mov	rsi, qword ptr [rbp - 1016]
	lea	rax, [rbp - 888]
	lea	rdi, [rip + .L.str.1]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_22
.LBB0_5:
	mov	rax, qword ptr [rbp - 1008]
	mov	byte ptr [rbp - 1027], 0
	mov	cl, byte ptr [rbp - 1027]
	mov	byte ptr [rax + 8], cl
	mov	eax, 1
	cmp	eax, dword ptr [rbp - 836]
	jne	.LBB0_9
# %bb.6:
	mov	rax, qword ptr [rbp - 1008]
	mov	byte ptr [rbp - 1028], 0
	mov	cl, byte ptr [rbp - 1028]
	mov	byte ptr [rax + 8], cl
	mov	rax, qword ptr [rbp - 1008]
	mov	rdi, qword ptr [rax + 96]
	mov	rdx, qword ptr [rbp - 1008]
	add	rdx, 104
	add	rdx, 16
	lea	rsi, [rbp - 836]
	call	vkEnumeratePhysicalDevices@PLT
	movsxd	rcx, eax
	mov	qword ptr [rbp - 1016], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	je	.LBB0_8
# %bb.7:
	mov	qword ptr [rbp - 912], 0
	mov	qword ptr [rbp - 904], 4
	mov	qword ptr [rbp - 896], 0
	lea	rax, [rbp - 912]
	lea	rdi, [rip + .L.str.2]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_22
.LBB0_8:
	mov	rax, qword ptr [rbp - 1008]
	mov	byte ptr [rbp - 1029], 0
	mov	cl, byte ptr [rbp - 1029]
	mov	byte ptr [rax + 8], cl
	jmp	.LBB0_21
.LBB0_9:
	mov	eax, dword ptr [rbp - 836]
	mov	edi, eax
	mov	esi, 8
	call	calloc@PLT
	mov	rcx, rax
	mov	qword ptr [rbp - 1024], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	jne	.LBB0_11
# %bb.10:
	mov	qword ptr [rbp - 936], 0
	mov	qword ptr [rbp - 928], 4
	mov	qword ptr [rbp - 920], 0
	mov	rsi, qword ptr [rbp - 1016]
	lea	rax, [rbp - 936]
	lea	rdi, [rip + .L.str.3]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_22
.LBB0_11:
	jmp	.LBB0_12
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rbp - 1008]
	mov	byte ptr [rbp - 1030], 1
	mov	al, byte ptr [rbp - 1030]
	xchg	byte ptr [rcx + 8], al
	mov	byte ptr [rbp - 1031], al
	test	byte ptr [rbp - 1031], 1
	je	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=1
	jmp	.LBB0_12
.LBB0_14:
	mov	rax, qword ptr [rbp - 1008]
	mov	rdi, qword ptr [rax + 96]
	mov	rdx, qword ptr [rbp - 1024]
	lea	rsi, [rbp - 836]
	call	vkEnumeratePhysicalDevices@PLT
	movsxd	rcx, eax
	mov	qword ptr [rbp - 1016], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	je	.LBB0_16
# %bb.15:
	mov	qword ptr [rbp - 960], 0
	mov	qword ptr [rbp - 952], 4
	mov	qword ptr [rbp - 944], 0
	lea	rax, [rbp - 960]
	lea	rdi, [rip + .L.str.2]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_22
.LBB0_16:
	mov	rax, qword ptr [rbp - 1008]
	mov	byte ptr [rbp - 1032], 0
	mov	cl, byte ptr [rbp - 1032]
	mov	byte ptr [rax + 8], cl
	mov	dword ptr [rbp - 1036], 0
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 1036]
	cmp	eax, dword ptr [rbp - 836]
	jae	.LBB0_20
# %bb.18:                               #   in Loop: Header=BB0_17 Depth=1
	mov	rax, qword ptr [rbp - 1024]
	mov	ecx, dword ptr [rbp - 1036]
                                        # kill: def $rcx killed $ecx
	mov	rdi, qword ptr [rax + 8*rcx]
	lea	rsi, [rbp - 832]
	call	vkGetPhysicalDeviceProperties@PLT
	mov	qword ptr [rbp - 984], 0
	mov	qword ptr [rbp - 976], 0
	mov	qword ptr [rbp - 968], 0
	lea	rsi, [rbp - 832]
	add	rsi, 20
	lea	rax, [rbp - 984]
	lea	rdi, [rip + .L.str.4]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
# %bb.19:                               #   in Loop: Header=BB0_17 Depth=1
	mov	eax, dword ptr [rbp - 1036]
	add	eax, 1
	mov	dword ptr [rbp - 1036], eax
	jmp	.LBB0_17
.LBB0_20:
	jmp	.LBB0_21
.LBB0_21:
	mov	dword ptr [rbp - 988], 0
	jmp	.LBB0_23
.LBB0_22:
	mov	rax, qword ptr [rbp - 1008]
	mov	byte ptr [rbp - 1037], 0
	mov	cl, byte ptr [rbp - 1037]
	mov	byte ptr [rax + 8], cl
	mov	dword ptr [rbp - 988], -1
.LBB0_23:
	mov	eax, dword ptr [rbp - 988]
	mov	dword ptr [rbp - 1044], eax     # 4-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_25
# %bb.24:
	mov	eax, dword ptr [rbp - 1044]     # 4-byte Reload
	add	rsp, 1072
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_25:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperVulkanGetPhysicalDevice, .Lfunc_end0-ViperVulkanGetPhysicalDevice
	.cfi_endproc
                                        # -- End function
	.globl	ViperVulkanCreateDevice         # -- Begin function ViperVulkanCreateDevice
	.p2align	4, 0x90
	.type	ViperVulkanCreateDevice,@function
ViperVulkanCreateDevice:                # @ViperVulkanCreateDevice
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 464
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 400], rdi
	mov	qword ptr [rbp - 408], rsi
	mov	dword ptr [rbp - 412], 0
	mov	dword ptr [rbp - 16], 0
	mov	qword ptr [rbp - 424], 0
	mov	eax, dword ptr [rip + .L__const.ViperVulkanCreateDevice.queuePriorities]
	mov	dword ptr [rbp - 12], eax
	mov	qword ptr [rbp - 432], 0
	lea	rdi, [rbp - 56]
	xor	esi, esi
	mov	edx, 40
	call	memset@PLT
	lea	rdi, [rbp - 128]
	xor	esi, esi
	mov	edx, 72
	call	memset@PLT
	mov	rax, qword ptr [rbp - 408]
	mov	rdi, qword ptr [rax + 120]
	lea	rsi, [rbp - 16]
	xor	eax, eax
	mov	edx, eax
	call	vkGetPhysicalDeviceQueueFamilyProperties@PLT
	mov	eax, dword ptr [rbp - 16]
	mov	edi, eax
	mov	esi, 8
	call	calloc@PLT
	mov	rcx, rax
	mov	qword ptr [rbp - 432], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	jne	.LBB1_2
# %bb.1:
	mov	qword ptr [rbp - 152], 0
	mov	qword ptr [rbp - 144], 4
	mov	qword ptr [rbp - 136], 0
	lea	rax, [rbp - 152]
	lea	rdi, [rip + .L.str.5]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB1_11
.LBB1_2:
	mov	rax, qword ptr [rbp - 408]
	mov	rdi, qword ptr [rax + 120]
	mov	rdx, qword ptr [rbp - 432]
	lea	rsi, [rbp - 16]
	call	vkGetPhysicalDeviceQueueFamilyProperties@PLT
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 412]
	cmp	eax, dword ptr [rbp - 16]
	jae	.LBB1_7
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=1
	mov	rax, qword ptr [rbp - 432]
	mov	ecx, dword ptr [rbp - 412]
                                        # kill: def $rcx killed $ecx
	imul	rcx, rcx, 24
	add	rax, rcx
	mov	eax, dword ptr [rax]
	and	eax, 1
	cmp	eax, 0
	je	.LBB1_6
# %bb.5:
	mov	qword ptr [rbp - 176], 0
	mov	qword ptr [rbp - 168], 0
	mov	qword ptr [rbp - 160], 0
	lea	rax, [rbp - 176]
	lea	rdi, [rip + .L.str.6]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB1_8
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	mov	eax, dword ptr [rbp - 412]
	add	eax, 1
	mov	dword ptr [rbp - 412], eax
	jmp	.LBB1_3
.LBB1_7:
	mov	qword ptr [rbp - 200], 0
	mov	qword ptr [rbp - 192], 4
	mov	qword ptr [rbp - 184], 0
	lea	rax, [rbp - 200]
	lea	rdi, [rip + .L.str.7]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB1_11
.LBB1_8:
	mov	dword ptr [rbp - 240], 2
	mov	qword ptr [rbp - 232], 0
	mov	dword ptr [rbp - 224], 0
	mov	eax, dword ptr [rbp - 412]
	mov	dword ptr [rbp - 220], eax
	mov	dword ptr [rbp - 216], 1
	lea	rax, [rbp - 12]
	mov	qword ptr [rbp - 208], rax
	lea	rdi, [rbp - 56]
	lea	rsi, [rbp - 240]
	mov	edx, 40
	call	memcpy@PLT
	mov	dword ptr [rbp - 312], 3
	mov	qword ptr [rbp - 304], 0
	mov	dword ptr [rbp - 296], 0
	mov	dword ptr [rbp - 292], 0
	lea	rax, [rbp - 56]
	mov	qword ptr [rbp - 288], rax
	mov	dword ptr [rbp - 280], 0
	mov	qword ptr [rbp - 272], 0
	mov	dword ptr [rbp - 264], 1
	lea	rax, [rip + _DEVICE_EXTENSIONS]
	mov	qword ptr [rbp - 256], rax
	mov	qword ptr [rbp - 248], 0
	lea	rdi, [rbp - 128]
	lea	rsi, [rbp - 312]
	mov	edx, 72
	call	memcpy@PLT
	mov	rax, qword ptr [rbp - 408]
	mov	rdi, qword ptr [rax + 120]
	mov	rcx, qword ptr [rbp - 408]
	add	rcx, 152
	add	rcx, 16
	lea	rsi, [rbp - 128]
	xor	eax, eax
	mov	edx, eax
	call	vkCreateDevice@PLT
	movsxd	rcx, eax
	mov	qword ptr [rbp - 424], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	je	.LBB1_10
# %bb.9:
	mov	qword ptr [rbp - 336], 0
	mov	qword ptr [rbp - 328], 4
	mov	qword ptr [rbp - 320], 0
	mov	rsi, qword ptr [rbp - 424]
	lea	rax, [rbp - 336]
	lea	rdi, [rip + .L.str.8]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB1_11
.LBB1_10:
	mov	qword ptr [rbp - 360], 0
	mov	qword ptr [rbp - 352], 0
	mov	qword ptr [rbp - 344], 0
	lea	rax, [rbp - 360]
	lea	rdi, [rip + .L.str.9]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	ecx, dword ptr [rbp - 412]
	mov	rax, qword ptr [rbp - 408]
	mov	dword ptr [rax + 72], ecx
	mov	rax, qword ptr [rbp - 408]
	mov	dword ptr [rax + 76], 1
	mov	qword ptr [rbp - 392], 0
	jmp	.LBB1_12
.LBB1_11:
	mov	qword ptr [rbp - 384], 0
	mov	qword ptr [rbp - 376], 4
	mov	qword ptr [rbp - 368], 0
	mov	rsi, qword ptr [rbp - 424]
	lea	rax, [rbp - 384]
	lea	rdi, [rip + .L.str.8]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	qword ptr [rbp - 392], -1
.LBB1_12:
	mov	rax, qword ptr [rbp - 392]
	mov	qword ptr [rbp - 440], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB1_14
# %bb.13:
	mov	rax, qword ptr [rbp - 440]      # 8-byte Reload
	add	rsp, 464
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_14:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	ViperVulkanCreateDevice, .Lfunc_end1-ViperVulkanCreateDevice
	.cfi_endproc
                                        # -- End function
	.globl	VulkanCreateSwapchain           # -- Begin function VulkanCreateSwapchain
	.p2align	4, 0x90
	.type	VulkanCreateSwapchain,@function
VulkanCreateSwapchain:                  # @VulkanCreateSwapchain
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 432
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 384], rdi
	mov	qword ptr [rbp - 392], rsi
	mov	dword ptr [rbp - 396], 0
	lea	rdi, [rbp - 64]
	xor	esi, esi
	mov	edx, 52
	call	memset@PLT
	lea	rdi, [rbp - 168]
	xor	esi, esi
	mov	edx, 104
	call	memset@PLT
	mov	qword ptr [rbp - 192], 0
	mov	qword ptr [rbp - 184], 0
	mov	qword ptr [rbp - 176], 0
	lea	rax, [rbp - 192]
	lea	rdi, [rip + .L.str.10]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	rax, qword ptr [rbp - 392]
	mov	rdi, qword ptr [rax + 120]
	mov	rax, qword ptr [rbp - 392]
	mov	rsi, qword ptr [rax + 192]
	lea	rdx, [rbp - 64]
	call	vkGetPhysicalDeviceSurfaceCapabilitiesKHR@PLT
	mov	ecx, eax
	mov	dword ptr [rbp - 396], ecx
	xor	eax, eax
	cmp	eax, ecx
	je	.LBB2_2
# %bb.1:
	mov	qword ptr [rbp - 216], 0
	mov	qword ptr [rbp - 208], 4
	mov	qword ptr [rbp - 200], 0
	mov	esi, dword ptr [rbp - 396]
	lea	rax, [rbp - 216]
	lea	rdi, [rip + .L.str.11]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB2_5
.LBB2_2:
	mov	dword ptr [rbp - 320], 1000001000
	mov	qword ptr [rbp - 312], 0
	mov	dword ptr [rbp - 304], 0
	mov	rax, qword ptr [rbp - 392]
	mov	rax, qword ptr [rax + 192]
	mov	qword ptr [rbp - 296], rax
	mov	eax, dword ptr [rbp - 64]
	mov	dword ptr [rbp - 288], eax
	mov	dword ptr [rbp - 284], 23
	mov	dword ptr [rbp - 280], 1000104002
	mov	rax, qword ptr [rbp - 56]
	mov	qword ptr [rbp - 276], rax
	mov	dword ptr [rbp - 268], 0
	mov	dword ptr [rbp - 264], 0
	mov	dword ptr [rbp - 260], 1
	mov	rax, qword ptr [rbp - 392]
	mov	eax, dword ptr [rax + 76]
	mov	dword ptr [rbp - 256], eax
	mov	qword ptr [rbp - 248], 0
	mov	dword ptr [rbp - 240], 0
	mov	dword ptr [rbp - 236], 0
	mov	dword ptr [rbp - 232], 0
	mov	dword ptr [rbp - 228], 1
	mov	qword ptr [rbp - 224], 0
	lea	rdi, [rbp - 168]
	lea	rsi, [rbp - 320]
	mov	edx, 104
	call	memcpy@PLT
	mov	qword ptr [rbp - 344], 0
	mov	qword ptr [rbp - 336], 0
	mov	qword ptr [rbp - 328], 0
	lea	rax, [rbp - 344]
	lea	rdi, [rip + .L.str.12]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	rax, qword ptr [rbp - 392]
	mov	rdi, qword ptr [rax + 168]
	mov	rcx, qword ptr [rbp - 392]
	add	rcx, 200
	add	rcx, 16
	lea	rsi, [rbp - 168]
	xor	eax, eax
	mov	edx, eax
	call	vkCreateSwapchainKHR@PLT
	mov	ecx, eax
	xor	eax, eax
	cmp	eax, ecx
	je	.LBB2_4
# %bb.3:
	mov	qword ptr [rbp - 368], 0
	mov	qword ptr [rbp - 360], 4
	mov	qword ptr [rbp - 352], 0
	lea	rax, [rbp - 368]
	lea	rdi, [rip + .L.str.13]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB2_5
.LBB2_4:
	mov	qword ptr [rbp - 376], 0
	jmp	.LBB2_6
.LBB2_5:
	mov	qword ptr [rbp - 376], -1
.LBB2_6:
	mov	rax, qword ptr [rbp - 376]
	mov	qword ptr [rbp - 408], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB2_8
# %bb.7:
	mov	rax, qword ptr [rbp - 408]      # 8-byte Reload
	add	rsp, 432
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB2_8:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end2:
	.size	VulkanCreateSwapchain, .Lfunc_end2-VulkanCreateSwapchain
	.cfi_endproc
                                        # -- End function
	.globl	ViperVulkanInit                 # -- Begin function ViperVulkanInit
	.p2align	4, 0x90
	.type	ViperVulkanInit,@function
ViperVulkanInit:                        # @ViperVulkanInit
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 288
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 240], rdi
	mov	qword ptr [rbp - 248], rsi
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 4
	mov	qword ptr [rbp - 16], 0
	lea	rax, [rbp - 32]
	lea	rdi, [rip + .L.str.14]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 248]
	jne	.LBB3_14
# %bb.1:
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 96]
	jne	.LBB3_8
# %bb.2:
	jmp	.LBB3_3
.LBB3_3:                                # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rbp - 240]
	mov	byte ptr [rbp - 249], 1
	mov	al, byte ptr [rbp - 249]
	xchg	byte ptr [rcx + 8], al
	mov	byte ptr [rbp - 250], al
	test	byte ptr [rbp - 250], 1
	je	.LBB3_5
# %bb.4:                                #   in Loop: Header=BB3_3 Depth=1
	jmp	.LBB3_3
.LBB3_5:
	mov	edi, 1
	mov	esi, 272
	call	calloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 240]
	mov	qword ptr [rax + 96], rcx
	mov	rax, qword ptr [rbp - 240]
	mov	byte ptr [rbp - 251], 0
	mov	cl, byte ptr [rbp - 251]
	mov	byte ptr [rax + 8], cl
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 96]
	jne	.LBB3_7
# %bb.6:
	mov	qword ptr [rbp - 56], 0
	mov	qword ptr [rbp - 48], 4
	mov	qword ptr [rbp - 40], 0
	lea	rax, [rbp - 56]
	lea	rdi, [rip + .L.str.15]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB3_40
.LBB3_7:
	jmp	.LBB3_8
.LBB3_8:
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 96]
	mov	qword ptr [rbp - 248], rax
	mov	rcx, qword ptr [rbp - 248]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx]
	jne	.LBB3_10
# %bb.9:
	mov	rcx, qword ptr [rbp - 248]
	mov	eax, 19
	xchg	qword ptr [rcx], rax
.LBB3_10:
	mov	rcx, qword ptr [rbp - 248]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 48]
	je	.LBB3_12
# %bb.11:
	mov	rcx, qword ptr [rbp - 248]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 56]
	jne	.LBB3_13
.LBB3_12:
	mov	rax, qword ptr [rbp - 248]
	mov	qword ptr [rax + 48], 1920
	mov	rax, qword ptr [rbp - 248]
	mov	qword ptr [rax + 56], 1080
.LBB3_13:
	jmp	.LBB3_14
.LBB3_14:
	call	glfwInit@PLT
	cmp	eax, 0
	jne	.LBB3_16
# %bb.15:
	mov	qword ptr [rbp - 80], 0
	mov	qword ptr [rbp - 72], 4
	mov	qword ptr [rbp - 64], 0
	lea	rax, [rbp - 80]
	lea	rdi, [rip + .L.str.16]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB3_40
.LBB3_16:
	call	glfwVulkanSupported@PLT
	cmp	eax, 0
	jne	.LBB3_18
# %bb.17:
	mov	qword ptr [rbp - 104], 0
	mov	qword ptr [rbp - 96], 4
	mov	qword ptr [rbp - 88], 0
	lea	rax, [rbp - 104]
	lea	rdi, [rip + .L.str.17]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB3_39
.LBB3_18:
	mov	edi, 139265
	xor	esi, esi
	call	glfwWindowHint@PLT
.LBB3_19:                               # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rbp - 248]
	mov	byte ptr [rbp - 252], 1
	mov	al, byte ptr [rbp - 252]
	xchg	byte ptr [rcx + 24], al
	mov	byte ptr [rbp - 253], al
	test	byte ptr [rbp - 253], 1
	je	.LBB3_21
# %bb.20:                               #   in Loop: Header=BB3_19 Depth=1
	jmp	.LBB3_19
.LBB3_21:
	mov	rax, qword ptr [rbp - 248]
	mov	rax, qword ptr [rax + 48]
	mov	edi, eax
	mov	rax, qword ptr [rbp - 248]
	mov	rax, qword ptr [rax + 56]
	mov	esi, eax
	mov	rax, qword ptr [rbp - 240]
	mov	rdx, qword ptr [rax + 40]
	xor	eax, eax
	mov	r8d, eax
	mov	rcx, r8
	call	glfwCreateWindow@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 248]
	mov	qword ptr [rax + 32], rcx
	mov	rcx, qword ptr [rbp - 248]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 32]
	jne	.LBB3_23
# %bb.22:
	mov	qword ptr [rbp - 128], 0
	mov	qword ptr [rbp - 120], 4
	mov	qword ptr [rbp - 112], 0
	lea	rax, [rbp - 128]
	lea	rdi, [rip + .L.str.18]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB3_40
.LBB3_23:
	mov	rax, qword ptr [rbp - 248]
	mov	byte ptr [rbp - 254], 0
	mov	cl, byte ptr [rbp - 254]
	mov	byte ptr [rax + 24], cl
	mov	rdi, qword ptr [rbp - 240]
	mov	rsi, qword ptr [rbp - 248]
	call	ViperVulkanInstanceCreate@PLT
	mov	ecx, eax
	xor	eax, eax
	cmp	eax, ecx
	je	.LBB3_25
# %bb.24:
	mov	qword ptr [rbp - 152], 0
	mov	qword ptr [rbp - 144], 4
	mov	qword ptr [rbp - 136], 0
	lea	rax, [rbp - 152]
	lea	rdi, [rip + .L.str.19]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB3_38
.LBB3_25:
	mov	rdi, qword ptr [rbp - 240]
	mov	rsi, qword ptr [rbp - 248]
	call	ViperVulkanGetPhysicalDevice
	mov	ecx, eax
	xor	eax, eax
	cmp	eax, ecx
	je	.LBB3_27
# %bb.26:
	mov	qword ptr [rbp - 176], 0
	mov	qword ptr [rbp - 168], 4
	mov	qword ptr [rbp - 160], 0
	lea	rax, [rbp - 176]
	lea	rdi, [rip + .L.str]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB3_37
.LBB3_27:
	mov	rdi, qword ptr [rbp - 240]
	mov	rsi, qword ptr [rbp - 248]
	call	ViperVulkanCreateDevice
	mov	rcx, rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	je	.LBB3_29
# %bb.28:
	mov	qword ptr [rbp - 200], 0
	mov	qword ptr [rbp - 192], 4
	mov	qword ptr [rbp - 184], 0
	lea	rax, [rbp - 200]
	lea	rdi, [rip + .L.str.20]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB3_40
.LBB3_29:
	jmp	.LBB3_30
.LBB3_30:                               # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rbp - 248]
	mov	byte ptr [rbp - 255], 1
	mov	al, byte ptr [rbp - 255]
	xchg	byte ptr [rcx + 8], al
	mov	byte ptr [rbp - 256], al
	test	byte ptr [rbp - 256], 1
	je	.LBB3_32
# %bb.31:                               #   in Loop: Header=BB3_30 Depth=1
	jmp	.LBB3_30
.LBB3_32:
	mov	rax, qword ptr [rbp - 248]
	mov	rdi, qword ptr [rax + 96]
	mov	rax, qword ptr [rbp - 248]
	mov	rsi, qword ptr [rax + 32]
	mov	rcx, qword ptr [rbp - 248]
	add	rcx, 176
	add	rcx, 16
	xor	eax, eax
	mov	edx, eax
	call	glfwCreateWindowSurface@PLT
	mov	ecx, eax
	xor	eax, eax
	cmp	eax, ecx
	je	.LBB3_34
# %bb.33:
	mov	qword ptr [rbp - 224], 0
	mov	qword ptr [rbp - 216], 4
	mov	qword ptr [rbp - 208], 0
	lea	rax, [rbp - 224]
	lea	rdi, [rip + .L.str.21]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB3_40
.LBB3_34:
	mov	rax, qword ptr [rbp - 248]
	mov	byte ptr [rbp - 257], 0
	mov	cl, byte ptr [rbp - 257]
	mov	byte ptr [rax + 8], cl
	mov	rdi, qword ptr [rbp - 240]
	mov	rsi, qword ptr [rbp - 248]
	call	VulkanCreateSwapchain
	mov	rcx, rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	je	.LBB3_36
# %bb.35:
	jmp	.LBB3_40
.LBB3_36:
	mov	dword ptr [rbp - 228], 0
	jmp	.LBB3_41
.LBB3_37:
	jmp	.LBB3_38
.LBB3_38:
	mov	rax, qword ptr [rbp - 248]
	mov	rdi, qword ptr [rax + 32]
	call	glfwDestroyWindow@PLT
.LBB3_39:
	call	glfwTerminate@PLT
.LBB3_40:
	mov	dword ptr [rbp - 228], -1
.LBB3_41:
	mov	eax, dword ptr [rbp - 228]
	mov	dword ptr [rbp - 264], eax      # 4-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB3_43
# %bb.42:
	mov	eax, dword ptr [rbp - 264]      # 4-byte Reload
	add	rsp, 288
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB3_43:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end3:
	.size	ViperVulkanInit, .Lfunc_end3-ViperVulkanInit
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"VulkanGetPhysicalDevice"
	.size	.L.str, 24

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Failed to retrive count of physical devices [ %v ]"
	.size	.L.str.1, 51

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Failed to retrive devices"
	.size	.L.str.2, 26

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Failed to allocate temproary physical devices [ %v ]"
	.size	.L.str.3, 53

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Name %s"
	.size	.L.str.4, 8

	.type	.L__const.ViperVulkanCreateDevice.queuePriorities,@object # @__const.ViperVulkanCreateDevice.queuePriorities
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.L__const.ViperVulkanCreateDevice.queuePriorities:
	.long	0x3f800000                      # float 1
	.size	.L__const.ViperVulkanCreateDevice.queuePriorities, 4

	.type	.L.str.5,@object                # @.str.5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5:
	.asciz	"Failed to allocate queueProperties"
	.size	.L.str.5, 35

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Found family queue"
	.size	.L.str.6, 19

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"No queue family founed exiting..."
	.size	.L.str.7, 34

	.type	_DEVICE_EXTENSIONS,@object      # @_DEVICE_EXTENSIONS
	.data
	.p2align	3, 0x0
_DEVICE_EXTENSIONS:
	.quad	.L.str.22
	.size	_DEVICE_EXTENSIONS, 8

	.type	.L.str.8,@object                # @.str.8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.8:
	.asciz	"%v"
	.size	.L.str.8, 3

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"Created logical device"
	.size	.L.str.9, 23

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"Getting physicalDevice surface properties"
	.size	.L.str.10, 42

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"Failed to retrive surface capabilities [ %v ]"
	.size	.L.str.11, 46

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"Vulkan creating swapchain"
	.size	.L.str.12, 26

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"Failed to create swapchain"
	.size	.L.str.13, 27

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"VulkanInit"
	.size	.L.str.14, 11

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"Failed to allocate Vulkan_t"
	.size	.L.str.15, 28

	.type	.L.str.16,@object               # @.str.16
.L.str.16:
	.asciz	"glfwInit failed"
	.size	.L.str.16, 16

	.type	.L.str.17,@object               # @.str.17
.L.str.17:
	.asciz	"Vulkan not suppored"
	.size	.L.str.17, 20

	.type	.L.str.18,@object               # @.str.18
.L.str.18:
	.asciz	"glfwCreateWindow == NULL"
	.size	.L.str.18, 25

	.type	.L.str.19,@object               # @.str.19
.L.str.19:
	.asciz	"Failed to create instance vulkan"
	.size	.L.str.19, 33

	.type	.L.str.20,@object               # @.str.20
.L.str.20:
	.asciz	"Failed to create logical device"
	.size	.L.str.20, 32

	.type	.L.str.21,@object               # @.str.21
.L.str.21:
	.asciz	"Failed to create surface"
	.size	.L.str.21, 25

	.type	.L.str.22,@object               # @.str.22
.L.str.22:
	.asciz	"VK_KHR_swapchain"
	.size	.L.str.22, 17

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ViperVulkanGetPhysicalDevice
	.addrsig_sym __ViperLogger
	.addrsig_sym vkEnumeratePhysicalDevices
	.addrsig_sym calloc
	.addrsig_sym vkGetPhysicalDeviceProperties
	.addrsig_sym ViperVulkanCreateDevice
	.addrsig_sym vkGetPhysicalDeviceQueueFamilyProperties
	.addrsig_sym vkCreateDevice
	.addrsig_sym VulkanCreateSwapchain
	.addrsig_sym vkGetPhysicalDeviceSurfaceCapabilitiesKHR
	.addrsig_sym vkCreateSwapchainKHR
	.addrsig_sym glfwInit
	.addrsig_sym glfwVulkanSupported
	.addrsig_sym glfwWindowHint
	.addrsig_sym glfwCreateWindow
	.addrsig_sym ViperVulkanInstanceCreate
	.addrsig_sym glfwCreateWindowSurface
	.addrsig_sym glfwDestroyWindow
	.addrsig_sym glfwTerminate
	.addrsig_sym __stack_chk_fail
	.addrsig_sym _DEVICE_EXTENSIONS
