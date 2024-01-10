	.text
	.intel_syntax noprefix
	.file	"ppm.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function ViperImageDecodePPM6
.LCPI0_0:
	.quad	0x406fe00000000000              # double 255
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI0_1:
	.long	1127219200                      # 0x43300000
	.long	1160773632                      # 0x45300000
	.long	0                               # 0x0
	.long	0                               # 0x0
.LCPI0_2:
	.quad	0x4330000000000000              # double 4503599627370496
	.quad	0x4530000000000000              # double 1.9342813113834067E+25
	.text
	.globl	ViperImageDecodePPM6
	.p2align	4, 0x90
	.type	ViperImageDecodePPM6,@function
ViperImageDecodePPM6:                   # @ViperImageDecodePPM6
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	byte ptr [rbp - 17], 0
	mov	qword ptr [rbp - 32], 255
	mov	qword ptr [rbp - 40], 0
	xorps	xmm0, xmm0
	movsd	qword ptr [rbp - 48], xmm0
	mov	rax, qword ptr [rbp - 16]
	mov	rdi, qword ptr [rax + 16]
	add	rdi, 2
	call	ViperFindNextChar@PLT
	mov	qword ptr [rbp - 56], rax
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 8]
	mov	rcx, qword ptr [rbp - 56]
	mov	rdx, qword ptr [rbp - 16]
	mov	rdx, qword ptr [rdx + 16]
	sub	rcx, rdx
	cmp	rax, rcx
	jbe	.LBB0_25
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movsx	ecx, byte ptr [rbp - 17]
	mov	eax, 3
	cmp	eax, ecx
	jle	.LBB0_10
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rbp - 56]
	movsx	ecx, byte ptr [rax]
	mov	eax, 35
	cmp	eax, ecx
	jne	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_1 Depth=1
	mov	rdi, qword ptr [rbp - 56]
	call	ViperSkipLine@PLT
	mov	qword ptr [rbp - 56], rax
	jmp	.LBB0_1
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	movsx	eax, byte ptr [rbp - 17]
	mov	dword ptr [rbp - 60], eax       # 4-byte Spill
	test	eax, eax
	je	.LBB0_6
	jmp	.LBB0_26
.LBB0_26:                               #   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 60]       # 4-byte Reload
	sub	eax, 1
	je	.LBB0_7
	jmp	.LBB0_27
.LBB0_27:                               #   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 60]       # 4-byte Reload
	sub	eax, 2
	je	.LBB0_8
	jmp	.LBB0_9
.LBB0_6:                                #   in Loop: Header=BB0_1 Depth=1
	mov	rdi, qword ptr [rbp - 56]
	call	ViperAtoi@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 72], rcx
	mov	rax, qword ptr [rbp - 8]
	mov	rdi, qword ptr [rax + 72]
	mov	esi, 10
	call	ViperIntegerStringLength@PLT
	add	rax, 1
	add	rax, qword ptr [rbp - 56]
	mov	qword ptr [rbp - 56], rax
	jmp	.LBB0_9
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	mov	rdi, qword ptr [rbp - 56]
	call	ViperAtoi@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 80], rcx
	mov	rax, qword ptr [rbp - 8]
	mov	rdi, qword ptr [rax + 80]
	mov	esi, 10
	call	ViperIntegerStringLength@PLT
	add	rax, 1
	add	rax, qword ptr [rbp - 56]
	mov	qword ptr [rbp - 56], rax
	jmp	.LBB0_9
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	mov	rdi, qword ptr [rbp - 56]
	call	ViperAtoi@PLT
	mov	qword ptr [rbp - 32], rax
	mov	rdi, qword ptr [rbp - 32]
	mov	esi, 10
	call	ViperIntegerStringLength@PLT
	add	rax, 1
	add	rax, qword ptr [rbp - 56]
	mov	qword ptr [rbp - 56], rax
	mov	rax, qword ptr [rbp - 8]
	imul	rcx, qword ptr [rax + 72], 3
	mov	rax, qword ptr [rbp - 8]
	imul	rcx, qword ptr [rax + 80]
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 96], rcx
	mov	rax, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rax + 96]
	mov	edi, 1
	call	calloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 104], rcx
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 104]
	mov	qword ptr [rbp - 40], rax
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	mov	rdi, qword ptr [rbp - 56]
	call	ViperFindNextChar@PLT
	mov	qword ptr [rbp - 56], rax
	mov	al, byte ptr [rbp - 17]
	add	al, 1
	mov	byte ptr [rbp - 17], al
	jmp	.LBB0_1
.LBB0_10:                               #   in Loop: Header=BB0_1 Depth=1
	mov	eax, 255
	cmp	rax, qword ptr [rbp - 32]
	jne	.LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rbp - 56]
	mov	cl, byte ptr [rax]
	mov	rax, qword ptr [rbp - 40]
	mov	byte ptr [rax], cl
	mov	rax, qword ptr [rbp - 56]
	add	rax, 1
	mov	qword ptr [rbp - 56], rax
	jmp	.LBB0_24
.LBB0_12:                               #   in Loop: Header=BB0_1 Depth=1
	mov	eax, 255
	cmp	rax, qword ptr [rbp - 32]
	jl	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rbp - 56]
	movzx	eax, byte ptr [rax]
	cvtsi2sd	xmm0, eax
	cvtsi2sd	xmm1, qword ptr [rbp - 32]
	divsd	xmm0, xmm1
	movsd	qword ptr [rbp - 48], xmm0
	movsd	xmm0, qword ptr [rip + .LCPI0_0] # xmm0 = mem[0],zero
	mulsd	xmm0, qword ptr [rbp - 48]
	cvttsd2si	eax, xmm0
	mov	cl, al
	mov	rax, qword ptr [rbp - 40]
	mov	byte ptr [rax], cl
	mov	rax, qword ptr [rbp - 56]
	add	rax, 1
	mov	qword ptr [rbp - 56], rax
	jmp	.LBB0_23
.LBB0_14:                               #   in Loop: Header=BB0_1 Depth=1
	mov	eax, 65535
	cmp	rax, qword ptr [rbp - 32]
	jl	.LBB0_16
# %bb.15:                               #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rbp - 56]
	movzx	eax, word ptr [rax]
	cvtsi2sd	xmm0, eax
	cvtsi2sd	xmm1, qword ptr [rbp - 32]
	divsd	xmm0, xmm1
	movsd	qword ptr [rbp - 48], xmm0
	movsd	xmm0, qword ptr [rip + .LCPI0_0] # xmm0 = mem[0],zero
	mulsd	xmm0, qword ptr [rbp - 48]
	cvttsd2si	eax, xmm0
	mov	cl, al
	mov	rax, qword ptr [rbp - 40]
	mov	byte ptr [rax], cl
	mov	rax, qword ptr [rbp - 56]
	add	rax, 2
	mov	qword ptr [rbp - 56], rax
	jmp	.LBB0_22
.LBB0_16:                               #   in Loop: Header=BB0_1 Depth=1
	mov	eax, 4294967295
	cmp	rax, qword ptr [rbp - 32]
	jl	.LBB0_18
# %bb.17:                               #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rbp - 56]
	mov	eax, dword ptr [rax]
                                        # kill: def $rax killed $eax
	cvtsi2sd	xmm0, rax
	cvtsi2sd	xmm1, qword ptr [rbp - 32]
	divsd	xmm0, xmm1
	movsd	qword ptr [rbp - 48], xmm0
	movsd	xmm0, qword ptr [rip + .LCPI0_0] # xmm0 = mem[0],zero
	mulsd	xmm0, qword ptr [rbp - 48]
	cvttsd2si	eax, xmm0
	mov	cl, al
	mov	rax, qword ptr [rbp - 40]
	mov	byte ptr [rax], cl
	mov	rax, qword ptr [rbp - 56]
	add	rax, 4
	mov	qword ptr [rbp - 56], rax
	jmp	.LBB0_21
.LBB0_18:                               #   in Loop: Header=BB0_1 Depth=1
	mov	rax, -1
	cmp	rax, qword ptr [rbp - 32]
	jb	.LBB0_20
# %bb.19:                               #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rbp - 56]
	movq	xmm0, qword ptr [rax]           # xmm0 = mem[0],zero
	movaps	xmm1, xmmword ptr [rip + .LCPI0_1] # xmm1 = [1127219200,1160773632,0,0]
	punpckldq	xmm0, xmm1              # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movapd	xmm1, xmmword ptr [rip + .LCPI0_2] # xmm1 = [4.503599627370496E+15,1.9342813113834067E+25]
	subpd	xmm0, xmm1
	movaps	xmm1, xmm0
	unpckhpd	xmm0, xmm0                      # xmm0 = xmm0[1,1]
	addsd	xmm0, xmm1
	cvtsi2sd	xmm1, qword ptr [rbp - 32]
	divsd	xmm0, xmm1
	movsd	qword ptr [rbp - 48], xmm0
	movsd	xmm0, qword ptr [rip + .LCPI0_0] # xmm0 = mem[0],zero
	mulsd	xmm0, qword ptr [rbp - 48]
	cvttsd2si	eax, xmm0
	mov	cl, al
	mov	rax, qword ptr [rbp - 40]
	mov	byte ptr [rax], cl
	mov	rax, qword ptr [rbp - 56]
	add	rax, 8
	mov	qword ptr [rbp - 56], rax
.LBB0_20:                               #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_21
.LBB0_21:                               #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_22
.LBB0_22:                               #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_23
.LBB0_23:                               #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_24
.LBB0_24:                               #   in Loop: Header=BB0_1 Depth=1
	mov	rax, qword ptr [rbp - 40]
	add	rax, 1
	mov	qword ptr [rbp - 40], rax
	jmp	.LBB0_1
.LBB0_25:
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	movsx	eax, al
	add	rsp, 64
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperImageDecodePPM6, .Lfunc_end0-ViperImageDecodePPM6
	.cfi_endproc
                                        # -- End function
	.globl	ViperImageEncodePPM6            # -- Begin function ViperImageEncodePPM6
	.p2align	4, 0x90
	.type	ViperImageEncodePPM6,@function
ViperImageEncodePPM6:                   # @ViperImageEncodePPM6
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], 0
	mov	qword ptr [rbp - 24], 0
	lea	rax, [rip + .L.str]
	mov	qword ptr [rbp - 32], rax
	lea	rax, [rip + .L.str.1]
	mov	qword ptr [rbp - 40], rax
	mov	edi, 1
	mov	esi, 24
	call	calloc@PLT
	mov	qword ptr [rbp - 48], rax
	mov	rax, qword ptr [rbp - 8]
	mov	rdi, qword ptr [rax + 72]
	mov	esi, 10
	call	ViperIntegerStringLength@PLT
	add	rax, 2
	add	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 8]
	mov	rdi, qword ptr [rax + 80]
	mov	esi, 10
	call	ViperIntegerStringLength@PLT
	add	rax, 2
	add	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 16], rax
	mov	edi, 255
	mov	esi, 10
	call	ViperIntegerStringLength@PLT
	add	rax, 2
	add	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 16], rax
	mov	rdi, qword ptr [rbp - 32]
	call	strlen@PLT
	add	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 16], rax
	mov	rdi, qword ptr [rbp - 40]
	call	strlen@PLT
	add	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 96]
	add	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 16], rax
	mov	rsi, qword ptr [rbp - 16]
	add	rsi, 1
	mov	edi, 1
	call	calloc@PLT
	mov	rcx, qword ptr [rbp - 48]
	mov	qword ptr [rcx + 16], rax
	mov	qword ptr [rbp - 24], rax
	mov	rcx, qword ptr [rbp - 16]
	mov	rax, qword ptr [rbp - 48]
	mov	qword ptr [rax + 8], rcx
	mov	rdi, qword ptr [rbp - 24]
	mov	rsi, qword ptr [rbp - 32]
	call	stpcpy@PLT
	mov	qword ptr [rbp - 24], rax
	mov	rdi, qword ptr [rbp - 24]
	mov	rsi, qword ptr [rbp - 40]
	call	stpcpy@PLT
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 8]
	mov	rdi, qword ptr [rax + 72]
	mov	rsi, qword ptr [rbp - 24]
	mov	rdx, qword ptr [rbp - 16]
	mov	rax, qword ptr [rbp - 48]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 24]
	sub	rax, rcx
	add	rdx, rax
	mov	ecx, 10
	call	ViperItoa@PLT
	sub	rax, 1
	add	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 24], rax
	mov	rdi, qword ptr [rbp - 24]
	lea	rsi, [rip + .L.str.2]
	call	stpcpy@PLT
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 8]
	mov	rdi, qword ptr [rax + 80]
	mov	rsi, qword ptr [rbp - 24]
	mov	rdx, qword ptr [rbp - 16]
	mov	rax, qword ptr [rbp - 48]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 24]
	sub	rax, rcx
	add	rdx, rax
	mov	ecx, 10
	call	ViperItoa@PLT
	sub	rax, 1
	add	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 24], rax
	mov	rdi, qword ptr [rbp - 24]
	lea	rsi, [rip + .L.str.3]
	call	stpcpy@PLT
	mov	qword ptr [rbp - 24], rax
	mov	rsi, qword ptr [rbp - 24]
	mov	rdx, qword ptr [rbp - 16]
	mov	rax, qword ptr [rbp - 48]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 24]
	sub	rax, rcx
	add	rdx, rax
	mov	edi, 255
	mov	ecx, 10
	call	ViperItoa@PLT
	sub	rax, 1
	add	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 24], rax
	mov	rdi, qword ptr [rbp - 24]
	lea	rsi, [rip + .L.str.3]
	call	stpcpy@PLT
	mov	qword ptr [rbp - 24], rax
	mov	rdi, qword ptr [rbp - 24]
	mov	rax, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rax + 104]
	mov	rax, qword ptr [rbp - 8]
	mov	rdx, qword ptr [rax + 96]
	call	memcpy@PLT
	mov	rax, qword ptr [rbp - 48]
	add	rsp, 48
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	ViperImageEncodePPM6, .Lfunc_end1-ViperImageEncodePPM6
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"P6\n"
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"# Encoded with viper game engine\n"
	.size	.L.str.1, 34

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	" "
	.size	.L.str.2, 2

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"\n"
	.size	.L.str.3, 2

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ViperFindNextChar
	.addrsig_sym ViperSkipLine
	.addrsig_sym ViperAtoi
	.addrsig_sym ViperIntegerStringLength
	.addrsig_sym calloc
	.addrsig_sym strlen
	.addrsig_sym stpcpy
	.addrsig_sym ViperItoa
