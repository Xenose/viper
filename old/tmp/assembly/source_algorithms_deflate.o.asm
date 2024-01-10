	.text
	.intel_syntax noprefix
	.file	"deflate.c"
	.globl	ViperDeflateDecompress          # -- Begin function ViperDeflateDecompress
	.p2align	4, 0x90
	.type	ViperDeflateDecompress,@function
ViperDeflateDecompress:                 # @ViperDeflateDecompress
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], 0
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rcx + 8]
	jae	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 16]
	movzx	esi, byte ptr [rax + rcx]
	lea	rdi, [rip + .L.str]
	mov	al, 0
	call	ViperPrintF@PLT
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	add	rax, 1
	mov	qword ptr [rbp - 16], rax
	jmp	.LBB0_1
.LBB0_4:
	xor	eax, eax
                                        # kill: def $rax killed $eax
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperDeflateDecompress, .Lfunc_end0-ViperDeflateDecompress
	.cfi_endproc
                                        # -- End function
	.globl	ViperDeflateCompress            # -- Begin function ViperDeflateCompress
	.p2align	4, 0x90
	.type	ViperDeflateCompress,@function
ViperDeflateCompress:                   # @ViperDeflateCompress
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	xor	eax, eax
                                        # kill: def $rax killed $eax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	ViperDeflateCompress, .Lfunc_end1-ViperDeflateCompress
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%b\n"
	.size	.L.str, 4

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ViperPrintF
