	.text
	.intel_syntax noprefix
	.file	"syscalls.c"
	.globl	ViperSyscallClone               # -- Begin function ViperSyscallClone
	.p2align	4, 0x90
	.type	ViperSyscallClone,@function
ViperSyscallClone:                      # @ViperSyscallClone
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rsi, qword ptr [rbp - 8]
	mov	edi, 435
	mov	edx, 88
	mov	al, 0
	call	syscall@PLT
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperSyscallClone, .Lfunc_end0-ViperSyscallClone
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym syscall
