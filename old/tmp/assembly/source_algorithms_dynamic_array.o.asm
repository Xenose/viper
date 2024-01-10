	.text
	.intel_syntax noprefix
	.file	"dynamic_array.c"
	.globl	ViperDynamicArrayAdd            # -- Begin function ViperDynamicArrayAdd
	.p2align	4, 0x90
	.type	ViperDynamicArrayAdd,@function
ViperDynamicArrayAdd:                   # @ViperDynamicArrayAdd
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 40], 0
	mov	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 48], rax
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 48]
	cmp	rax, qword ptr [rcx]
	je	.LBB0_2
# %bb.1:
	mov	byte ptr [rbp - 1], -1
	jmp	.LBB0_3
.LBB0_2:
	mov	rax, qword ptr [rbp - 48]
	mov	rdi, qword ptr [rax]
	call	ViperGetStructureSize@PLT
	mov	qword ptr [rbp - 32], rax
	mov	rax, qword ptr [rbp - 16]
	mov	rdi, qword ptr [rax + 32]
	mov	rsi, qword ptr [rbp - 32]
	mov	rax, qword ptr [rbp - 16]
	imul	rsi, qword ptr [rax + 24]
	call	realloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rax + 32], rcx
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 32]
	mov	rcx, qword ptr [rbp - 32]
	mov	rdx, qword ptr [rbp - 16]
	imul	rcx, qword ptr [rdx + 24]
	add	rax, rcx
	mov	qword ptr [rbp - 40], rax
	mov	rdi, qword ptr [rbp - 40]
	mov	rsi, qword ptr [rbp - 24]
	mov	rdx, qword ptr [rbp - 32]
	call	memcpy@PLT
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rax + 24]
	add	rcx, 1
	mov	qword ptr [rax + 24], rcx
	mov	byte ptr [rbp - 1], 0
.LBB0_3:
	movsx	eax, byte ptr [rbp - 1]
	add	rsp, 48
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperDynamicArrayAdd, .Lfunc_end0-ViperDynamicArrayAdd
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ViperGetStructureSize
	.addrsig_sym realloc
