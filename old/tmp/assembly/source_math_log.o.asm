	.text
	.intel_syntax noprefix
	.file	"log.c"
	.globl	ViperLog                        # -- Begin function ViperLog
	.p2align	4, 0x90
	.type	ViperLog,@function
ViperLog:                               # @ViperLog
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 80
	mov	qword ptr [rbp - 16], rdi
	mov	dword ptr [rbp - 20], esi
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 16]
	jne	.LBB0_2
# %bb.1:
	xorps	xmm0, xmm0
	movsd	qword ptr [rbp - 8], xmm0
	jmp	.LBB0_3
.LBB0_2:
	mov	rdi, qword ptr [rbp - 16]
	call	labs@PLT
	mov	qword ptr [rbp - 32], rax
	fild	qword ptr [rbp - 32]
	mov	rax, rsp
	fstp	tbyte ptr [rax]
	call	logl@PLT
	fstp	tbyte ptr [rbp - 52]            # 10-byte Folded Spill
	mov	eax, dword ptr [rbp - 20]
	mov	dword ptr [rbp - 24], eax
	fild	dword ptr [rbp - 24]
	mov	rax, rsp
	fstp	tbyte ptr [rax]
	call	logl@PLT
	fld	tbyte ptr [rbp - 52]            # 10-byte Folded Reload
	fdivrp	st(1), st
	fstp	qword ptr [rbp - 40]
	movsd	xmm0, qword ptr [rbp - 40]      # xmm0 = mem[0],zero
	movsd	qword ptr [rbp - 8], xmm0
.LBB0_3:
	movsd	xmm0, qword ptr [rbp - 8]       # xmm0 = mem[0],zero
	add	rsp, 80
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperLog, .Lfunc_end0-ViperLog
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym logl
	.addrsig_sym labs
