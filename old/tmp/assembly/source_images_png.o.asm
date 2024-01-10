	.text
	.intel_syntax noprefix
	.file	"png.c"
	.globl	ViperImageDecompressPNG         # -- Begin function ViperImageDecompressPNG
	.p2align	4, 0x90
	.type	ViperImageDecompressPNG,@function
ViperImageDecompressPNG:                # @ViperImageDecompressPNG
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	edi, 1
	mov	esi, 112
	call	calloc@PLT
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 16]
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperImageDecompressPNG, .Lfunc_end0-ViperImageDecompressPNG
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym calloc
