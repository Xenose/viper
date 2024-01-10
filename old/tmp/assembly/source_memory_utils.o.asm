	.text
	.intel_syntax noprefix
	.file	"utils.c"
	.globl	ViperGetStructureSize           # -- Begin function ViperGetStructureSize
	.p2align	4, 0x90
	.type	ViperGetStructureSize,@function
ViperGetStructureSize:                  # @ViperGetStructureSize
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 96
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 48], rdi
	mov	rax, qword ptr [rbp - 48]
	add	rax, -14
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	sub	rax, 7
	ja	.LBB0_6
# %bb.10:
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
	lea	rcx, [rip + .LJTI0_0]
	movsxd	rax, dword ptr [rcx + 4*rax]
	add	rax, rcx
	jmp	rax
.LBB0_1:
	mov	qword ptr [rbp - 40], 112
	jmp	.LBB0_7
.LBB0_2:
	mov	qword ptr [rbp - 40], 24
	jmp	.LBB0_7
.LBB0_3:
	mov	qword ptr [rbp - 40], 16
	jmp	.LBB0_7
.LBB0_4:
	mov	qword ptr [rbp - 40], 16
	jmp	.LBB0_7
.LBB0_5:
	mov	qword ptr [rbp - 40], 56
	jmp	.LBB0_7
.LBB0_6:
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 4
	mov	qword ptr [rbp - 16], 0
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
	mov	qword ptr [rbp - 40], -1
.LBB0_7:
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 64], rax       # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_9
# %bb.8:
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	add	rsp, 96
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_9:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperGetStructureSize, .Lfunc_end0-ViperGetStructureSize
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0_0:
	.long	.LBB0_2-.LJTI0_0
	.long	.LBB0_3-.LJTI0_0
	.long	.LBB0_6-.LJTI0_0
	.long	.LBB0_4-.LJTI0_0
	.long	.LBB0_6-.LJTI0_0
	.long	.LBB0_6-.LJTI0_0
	.long	.LBB0_5-.LJTI0_0
	.long	.LBB0_1-.LJTI0_0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Couldn't find type"
	.size	.L.str, 19

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __ViperLogger
	.addrsig_sym __stack_chk_fail
