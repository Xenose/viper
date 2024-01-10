	.text
	.intel_syntax noprefix
	.file	"instance.c"
	.globl	ViperVulkanGetExtensions        # -- Begin function ViperVulkanGetExtensions
	.p2align	4, 0x90
	.type	ViperVulkanGetExtensions,@function
ViperVulkanGetExtensions:               # @ViperVulkanGetExtensions
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 144
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 72], rdi
	mov	qword ptr [rbp - 80], rsi
	mov	rax, qword ptr [rbp - 72]
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 84], eax
	mov	qword ptr [rbp - 96], 0
	mov	rdi, qword ptr [rbp - 72]
	call	glfwGetRequiredInstanceExtensions@PLT
	mov	eax, dword ptr [rbp - 84]
	mov	rcx, qword ptr [rbp - 72]
	add	eax, dword ptr [rcx]
	mov	eax, eax
	mov	edi, eax
	mov	esi, 8
	call	calloc@PLT
	mov	qword ptr [rbp - 96], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 96]
	jne	.LBB0_2
# %bb.1:
	jmp	.LBB0_11
.LBB0_2:
	mov	dword ptr [rbp - 100], 0
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 100]
	cmp	eax, dword ptr [rbp - 84]
	jae	.LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mov	rax, qword ptr [rbp - 80]
	mov	ecx, dword ptr [rbp - 100]
                                        # kill: def $rcx killed $ecx
	mov	rdi, qword ptr [rax + 8*rcx]
	call	strdup@PLT
	mov	rdx, rax
	mov	rax, qword ptr [rbp - 96]
	mov	ecx, dword ptr [rbp - 100]
                                        # kill: def $rcx killed $ecx
	mov	qword ptr [rax + 8*rcx], rdx
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 0
	mov	qword ptr [rbp - 16], 0
	mov	rax, qword ptr [rbp - 80]
	mov	ecx, dword ptr [rbp - 100]
                                        # kill: def $rcx killed $ecx
	mov	rsi, qword ptr [rax + 8*rcx]
	lea	rax, [rbp - 32]
	lea	rdi, [rip + .L.str]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	mov	eax, dword ptr [rbp - 100]
	add	eax, 1
	mov	dword ptr [rbp - 100], eax
	jmp	.LBB0_3
.LBB0_6:
	mov	rdi, qword ptr [rbp - 72]
	call	glfwGetRequiredInstanceExtensions@PLT
	mov	qword ptr [rbp - 80], rax
	mov	dword ptr [rbp - 104], 0
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 104]
	mov	rcx, qword ptr [rbp - 72]
	cmp	eax, dword ptr [rcx]
	jae	.LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	mov	rax, qword ptr [rbp - 80]
	mov	ecx, dword ptr [rbp - 104]
                                        # kill: def $rcx killed $ecx
	mov	rdi, qword ptr [rax + 8*rcx]
	call	strdup@PLT
	mov	rdx, rax
	mov	rax, qword ptr [rbp - 96]
	mov	ecx, dword ptr [rbp - 84]
	add	ecx, dword ptr [rbp - 104]
	mov	ecx, ecx
                                        # kill: def $rcx killed $ecx
	mov	qword ptr [rax + 8*rcx], rdx
	mov	qword ptr [rbp - 56], 0
	mov	qword ptr [rbp - 48], 0
	mov	qword ptr [rbp - 40], 0
	mov	rax, qword ptr [rbp - 80]
	mov	ecx, dword ptr [rbp - 104]
                                        # kill: def $rcx killed $ecx
	mov	rsi, qword ptr [rax + 8*rcx]
	lea	rax, [rbp - 56]
	lea	rdi, [rip + .L.str]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
# %bb.9:                                #   in Loop: Header=BB0_7 Depth=1
	mov	eax, dword ptr [rbp - 104]
	add	eax, 1
	mov	dword ptr [rbp - 104], eax
	jmp	.LBB0_7
.LBB0_10:
	mov	ecx, dword ptr [rbp - 84]
	mov	rax, qword ptr [rbp - 72]
	add	ecx, dword ptr [rax]
	mov	dword ptr [rax], ecx
	mov	rax, qword ptr [rbp - 96]
	mov	qword ptr [rbp - 64], rax
	jmp	.LBB0_12
.LBB0_11:
	mov	qword ptr [rbp - 64], 0
.LBB0_12:
	mov	rax, qword ptr [rbp - 64]
	mov	qword ptr [rbp - 112], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_14
# %bb.13:
	mov	rax, qword ptr [rbp - 112]      # 8-byte Reload
	add	rsp, 144
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_14:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperVulkanGetExtensions, .Lfunc_end0-ViperVulkanGetExtensions
	.cfi_endproc
                                        # -- End function
	.globl	ViperVulkanInstanceCreate       # -- Begin function ViperVulkanInstanceCreate
	.p2align	4, 0x90
	.type	ViperVulkanInstanceCreate,@function
ViperVulkanInstanceCreate:              # @ViperVulkanInstanceCreate
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 272
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 216], rdi
	mov	qword ptr [rbp - 224], rsi
	mov	qword ptr [rbp - 232], 0
	mov	dword ptr [rbp - 12], 0
	mov	dword ptr [rbp - 64], 0
	mov	qword ptr [rbp - 56], 0
	mov	rax, qword ptr [rbp - 216]
	mov	rax, qword ptr [rax + 40]
	mov	qword ptr [rbp - 48], rax
	mov	dword ptr [rbp - 40], 1
	mov	rax, qword ptr [rbp - 216]
	mov	rax, qword ptr [rax + 40]
	mov	qword ptr [rbp - 32], rax
	mov	dword ptr [rbp - 24], 1
	mov	dword ptr [rbp - 20], 4202496
	lea	rdi, [rbp - 128]
	xor	esi, esi
	mov	edx, 64
	call	memset@PLT
	mov	dword ptr [rbp - 128], 1
	lea	rax, [rbp - 64]
	mov	qword ptr [rbp - 104], rax
	lea	rdi, [rbp - 12]
	lea	rsi, [rip + _VIPER_INSTANCE_EXTENSIONS]
	call	ViperVulkanGetExtensions
	mov	qword ptr [rbp - 72], rax
	mov	eax, dword ptr [rbp - 12]
	mov	dword ptr [rbp - 80], eax
	mov	qword ptr [rbp - 152], 0
	mov	qword ptr [rbp - 144], 0
	mov	qword ptr [rbp - 136], 0
	mov	esi, dword ptr [rbp - 12]
	lea	rax, [rbp - 152]
	lea	rdi, [rip + .L.str.1]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rbp - 224]
	mov	byte ptr [rbp - 233], 1
	mov	al, byte ptr [rbp - 233]
	xchg	byte ptr [rcx + 88], al
	mov	byte ptr [rbp - 234], al
	test	byte ptr [rbp - 234], 1
	je	.LBB1_3
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_1
.LBB1_3:
	mov	rdx, qword ptr [rbp - 224]
	add	rdx, 80
	add	rdx, 16
	lea	rdi, [rbp - 128]
	xor	eax, eax
	mov	esi, eax
	call	vkCreateInstance@PLT
	movsxd	rcx, eax
	mov	qword ptr [rbp - 232], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	je	.LBB1_5
# %bb.4:
	mov	qword ptr [rbp - 176], 0
	mov	qword ptr [rbp - 168], 4
	mov	qword ptr [rbp - 160], 0
	mov	rsi, qword ptr [rbp - 232]
	lea	rax, [rbp - 176]
	lea	rdi, [rip + .L.str.2]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB1_10
.LBB1_5:
	mov	rax, qword ptr [rbp - 224]
	mov	byte ptr [rbp - 235], 0
	mov	cl, byte ptr [rbp - 235]
	mov	byte ptr [rax + 88], cl
	mov	dword ptr [rbp - 240], 0
.LBB1_6:                                # =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 240]
	cmp	eax, dword ptr [rbp - 80]
	jae	.LBB1_9
# %bb.7:                                #   in Loop: Header=BB1_6 Depth=1
	mov	qword ptr [rbp - 200], 0
	mov	qword ptr [rbp - 192], 0
	mov	qword ptr [rbp - 184], 0
	mov	rax, qword ptr [rbp - 72]
	mov	ecx, dword ptr [rbp - 240]
                                        # kill: def $rcx killed $ecx
	mov	rsi, qword ptr [rax + 8*rcx]
	lea	rax, [rbp - 200]
	lea	rdi, [rip + .L.str]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	rax, qword ptr [rbp - 72]
	mov	ecx, dword ptr [rbp - 240]
                                        # kill: def $rcx killed $ecx
	mov	rdi, qword ptr [rax + 8*rcx]
	call	free@PLT
# %bb.8:                                #   in Loop: Header=BB1_6 Depth=1
	mov	eax, dword ptr [rbp - 240]
	add	eax, 1
	mov	dword ptr [rbp - 240], eax
	jmp	.LBB1_6
.LBB1_9:
	mov	rdi, qword ptr [rbp - 72]
	call	free@PLT
	mov	dword ptr [rbp - 204], 0
	jmp	.LBB1_11
.LBB1_10:
	mov	rax, qword ptr [rbp - 224]
	mov	byte ptr [rbp - 241], 0
	mov	cl, byte ptr [rbp - 241]
	mov	byte ptr [rax + 88], cl
	mov	dword ptr [rbp - 204], -1
.LBB1_11:
	mov	eax, dword ptr [rbp - 204]
	mov	dword ptr [rbp - 248], eax      # 4-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB1_13
# %bb.12:
	mov	eax, dword ptr [rbp - 248]      # 4-byte Reload
	add	rsp, 272
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_13:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	ViperVulkanInstanceCreate, .Lfunc_end1-ViperVulkanInstanceCreate
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Extensions : %s"
	.size	.L.str, 16

	.type	_VIPER_INSTANCE_EXTENSIONS,@object # @_VIPER_INSTANCE_EXTENSIONS
	.local	_VIPER_INSTANCE_EXTENSIONS
	.comm	_VIPER_INSTANCE_EXTENSIONS,1,8
	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%i"
	.size	.L.str.1, 3

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Failed to create instance VkCreateInstance %v"
	.size	.L.str.2, 46

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ViperVulkanGetExtensions
	.addrsig_sym glfwGetRequiredInstanceExtensions
	.addrsig_sym calloc
	.addrsig_sym strdup
	.addrsig_sym __ViperLogger
	.addrsig_sym vkCreateInstance
	.addrsig_sym free
	.addrsig_sym __stack_chk_fail
	.addrsig_sym _VIPER_INSTANCE_EXTENSIONS
