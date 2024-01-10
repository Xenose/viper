	.text
	.intel_syntax noprefix
	.file	"binary_tree.c"
	.globl	BinaryTreeInsertNode            # -- Begin function BinaryTreeInsertNode
	.p2align	4, 0x90
	.type	BinaryTreeInsertNode,@function
BinaryTreeInsertNode:                   # @BinaryTreeInsertNode
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 112
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 48], rdi
	mov	qword ptr [rbp - 56], rsi
	mov	qword ptr [rbp - 64], rdx
	mov	qword ptr [rbp - 72], 0
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rbp - 48]
	mov	byte ptr [rbp - 73], 1
	mov	al, byte ptr [rbp - 73]
	xchg	byte ptr [rcx + 8], al
	mov	byte ptr [rbp - 74], al
	test	byte ptr [rbp - 74], 1
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_1
.LBB0_3:
	mov	rcx, qword ptr [rbp - 48]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 16]
	jne	.LBB0_7
# %bb.4:
	mov	edi, 1
	mov	esi, 56
	call	calloc@PLT
	mov	rcx, qword ptr [rbp - 48]
	mov	qword ptr [rcx + 32], rax
	mov	qword ptr [rbp - 72], rax
	mov	rcx, qword ptr [rbp - 48]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 32]
	jne	.LBB0_6
# %bb.5:
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 4
	mov	qword ptr [rbp - 16], 0
	mov	rsi, qword ptr [rbp - 56]
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
	jmp	.LBB0_15
.LBB0_6:
	mov	rax, qword ptr [rbp - 56]
	mov	rcx, qword ptr [rbp - 48]
	xchg	qword ptr [rcx + 24], rax
	mov	rcx, qword ptr [rbp - 64]
	mov	rax, qword ptr [rbp - 72]
	mov	qword ptr [rax + 16], rcx
	jmp	.LBB0_14
.LBB0_7:
	mov	rax, qword ptr [rbp - 48]
	mov	rax, qword ptr [rax + 32]
	mov	qword ptr [rbp - 72], rax
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	cmp	qword ptr [rbp - 72], 0
	je	.LBB0_13
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
	mov	rax, qword ptr [rbp - 72]
	mov	rax, qword ptr [rax + 24]
	cmp	rax, qword ptr [rbp - 56]
	jae	.LBB0_11
# %bb.10:                               #   in Loop: Header=BB0_8 Depth=1
	jmp	.LBB0_12
.LBB0_11:                               #   in Loop: Header=BB0_8 Depth=1
	jmp	.LBB0_12
.LBB0_12:                               #   in Loop: Header=BB0_8 Depth=1
	jmp	.LBB0_8
.LBB0_13:
	jmp	.LBB0_14
.LBB0_14:
	mov	rax, qword ptr [rbp - 48]
	mov	byte ptr [rbp - 75], 0
	mov	cl, byte ptr [rbp - 75]
	mov	byte ptr [rax + 8], cl
	mov	byte ptr [rbp - 33], 0
	jmp	.LBB0_16
.LBB0_15:
	mov	rax, qword ptr [rbp - 48]
	mov	byte ptr [rbp - 76], 0
	mov	cl, byte ptr [rbp - 76]
	mov	byte ptr [rax + 8], cl
	mov	byte ptr [rbp - 33], -1
.LBB0_16:
	mov	al, byte ptr [rbp - 33]
	mov	byte ptr [rbp - 77], al         # 1-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_18
# %bb.17:
	mov	al, byte ptr [rbp - 77]         # 1-byte Reload
	movsx	eax, al
	add	rsp, 112
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_18:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	BinaryTreeInsertNode, .Lfunc_end0-BinaryTreeInsertNode
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Unable to allocate binary tree with the value [ %i ]"
	.size	.L.str, 53

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym calloc
	.addrsig_sym __ViperLogger
	.addrsig_sym __stack_chk_fail
