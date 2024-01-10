	.text
	.intel_syntax noprefix
	.file	"benchmark.c"
	.globl	ViperBenchmarkStart             # -- Begin function ViperBenchmarkStart
	.p2align	4, 0x90
	.type	ViperBenchmarkStart,@function
ViperBenchmarkStart:                    # @ViperBenchmarkStart
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 40], rdi
	lea	rdi, [rbp - 24]
	xor	esi, esi
	mov	edx, 16
	call	memset@PLT
	mov	edi, 4
	lea	rsi, [rbp - 24]
	call	clock_gettime@PLT
	mov	ecx, eax
	mov	eax, 4294967295
	cmp	eax, ecx
	jne	.LBB0_2
# %bb.1:
	call	__errno_location@PLT
	movsxd	rax, dword ptr [rax]
	mov	qword ptr [rbp - 32], rax
	jmp	.LBB0_3
.LBB0_2:
	mov	rcx, qword ptr [rbp - 24]
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rax + 32], rcx
	mov	rcx, qword ptr [rbp - 16]
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rax + 16], rcx
	mov	qword ptr [rbp - 32], 0
.LBB0_3:
	mov	rax, qword ptr [rbp - 32]
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_5
# %bb.4:
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	add	rsp, 48
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_5:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperBenchmarkStart, .Lfunc_end0-ViperBenchmarkStart
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function ViperBenchmarkStop
.LCPI1_0:
	.quad	0x41cdcd6500000000              # double 1.0E+9
	.text
	.globl	ViperBenchmarkStop
	.p2align	4, 0x90
	.type	ViperBenchmarkStop,@function
ViperBenchmarkStop:                     # @ViperBenchmarkStop
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 40], rdi
	lea	rdi, [rbp - 24]
	xor	esi, esi
	mov	edx, 16
	call	memset@PLT
	mov	edi, 4
	lea	rsi, [rbp - 24]
	call	clock_gettime@PLT
	mov	ecx, eax
	mov	eax, 4294967295
	cmp	eax, ecx
	jne	.LBB1_2
# %bb.1:
	call	__errno_location@PLT
	movsxd	rax, dword ptr [rax]
	mov	qword ptr [rbp - 32], rax
	jmp	.LBB1_5
.LBB1_2:
	mov	rcx, qword ptr [rbp - 24]
	mov	rax, qword ptr [rbp - 40]
	sub	rcx, qword ptr [rax + 32]
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rax + 32], rcx
	mov	rcx, qword ptr [rbp - 16]
	mov	rax, qword ptr [rbp - 40]
	sub	rcx, qword ptr [rax + 16]
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rax + 16], rcx
	mov	rcx, qword ptr [rbp - 40]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 16]
	jle	.LBB1_4
# %bb.3:
	mov	rax, qword ptr [rbp - 40]
	mov	rcx, qword ptr [rax + 32]
	add	rcx, -1
	mov	qword ptr [rax + 32], rcx
	mov	rax, qword ptr [rbp - 40]
	cvtsi2sd	xmm0, qword ptr [rax + 16]
	movsd	xmm1, qword ptr [rip + .LCPI1_0] # xmm1 = mem[0],zero
	addsd	xmm0, xmm1
	cvttsd2si	rcx, xmm0
	mov	qword ptr [rax + 16], rcx
.LBB1_4:
	mov	rax, qword ptr [rbp - 40]
	mov	rax, qword ptr [rax + 16]
	mov	ecx, 1000
	cqo
	idiv	rcx
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rax + 24], rcx
	mov	rax, qword ptr [rbp - 40]
	imul	rdx, qword ptr [rax + 24], 1000
	mov	rax, qword ptr [rbp - 40]
	mov	rcx, qword ptr [rax + 16]
	sub	rcx, rdx
	mov	qword ptr [rax + 16], rcx
	mov	qword ptr [rbp - 32], 0
.LBB1_5:
	mov	rax, qword ptr [rbp - 32]
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB1_7
# %bb.6:
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	add	rsp, 48
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_7:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	ViperBenchmarkStop, .Lfunc_end1-ViperBenchmarkStop
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym clock_gettime
	.addrsig_sym __errno_location
	.addrsig_sym __stack_chk_fail
