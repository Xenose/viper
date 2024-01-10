	.text
	.intel_syntax noprefix
	.file	"lz77.c"
	.globl	ViperCompressLZ77               # -- Begin function ViperCompressLZ77
	.p2align	4, 0x90
	.type	ViperCompressLZ77,@function
ViperCompressLZ77:                      # @ViperCompressLZ77
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperCompressLZ77, .Lfunc_end0-ViperCompressLZ77
	.cfi_endproc
                                        # -- End function
	.globl	ViperDecompressLZ77             # -- Begin function ViperDecompressLZ77
	.p2align	4, 0x90
	.type	ViperDecompressLZ77,@function
ViperDecompressLZ77:                    # @ViperDecompressLZ77
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	ViperDecompressLZ77, .Lfunc_end1-ViperDecompressLZ77
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
