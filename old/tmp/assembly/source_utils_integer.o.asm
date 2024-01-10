	.text
	.intel_syntax noprefix
	.file	"integer.c"
	.globl	ViperIntegerStringLength        # -- Begin function ViperIntegerStringLength
	.p2align	4, 0x90
	.type	ViperIntegerStringLength,@function
ViperIntegerStringLength:               # @ViperIntegerStringLength
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	dword ptr [rbp - 12], esi
	mov	rdi, qword ptr [rbp - 8]
	call	labs@PLT
	mov	rdi, rax
	mov	esi, dword ptr [rbp - 12]
	call	ViperLog@PLT
	cvttsd2si	rax, xmm0
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperIntegerStringLength, .Lfunc_end0-ViperIntegerStringLength
	.cfi_endproc
                                        # -- End function
	.globl	ViperItoa                       # -- Begin function ViperItoa
	.p2align	4, 0x90
	.type	ViperItoa,@function
ViperItoa:                              # @ViperItoa
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 176
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 48], rdi
	mov	qword ptr [rbp - 56], rsi
	mov	qword ptr [rbp - 64], rdx
	mov	dword ptr [rbp - 68], ecx
	mov	dword ptr [rbp - 72], 1
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 48]
	jle	.LBB1_2
# %bb.1:
	mov	rax, qword ptr [rbp - 56]
	mov	byte ptr [rax], 45
	mov	eax, dword ptr [rbp - 72]
	add	eax, 1
	mov	dword ptr [rbp - 72], eax
	mov	rax, qword ptr [rbp - 56]
	add	rax, 1
	mov	qword ptr [rbp - 56], rax
	mov	rdi, qword ptr [rbp - 48]
	call	labs@PLT
	mov	qword ptr [rbp - 48], rax
.LBB1_2:
	mov	rdi, qword ptr [rbp - 48]
	mov	esi, dword ptr [rbp - 68]
	call	ViperIntegerStringLength
	mov	qword ptr [rbp - 80], rax
	mov	rax, qword ptr [rbp - 64]
	sub	rax, 1
	cmp	rax, qword ptr [rbp - 80]
	jge	.LBB1_4
# %bb.3:
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
	jmp	.LBB1_9
.LBB1_4:
	mov	eax, dword ptr [rbp - 68]
	mov	dword ptr [rbp - 124], eax
	fild	dword ptr [rbp - 124]
	mov	rax, qword ptr [rbp - 80]
	mov	qword ptr [rbp - 120], rax
	fild	qword ptr [rbp - 120]
	mov	rax, rsp
	fstp	tbyte ptr [rax + 16]
	fstp	tbyte ptr [rax]
	call	powl@PLT
	fld	st(0)
	fstp	st(0)
	fnstcw	word ptr [rbp - 126]
	movzx	eax, word ptr [rbp - 126]
	or	eax, 3072
                                        # kill: def $ax killed $ax killed $eax
	mov	word ptr [rbp - 128], ax
	fldcw	word ptr [rbp - 128]
	fistp	qword ptr [rbp - 112]
	fldcw	word ptr [rbp - 126]
	mov	rax, qword ptr [rbp - 112]
	mov	qword ptr [rbp - 88], rax
	mov	rax, qword ptr [rbp - 80]
	mov	qword ptr [rbp - 96], rax
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 96]
	jge	.LBB1_8
# %bb.6:                                #   in Loop: Header=BB1_5 Depth=1
	mov	rax, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 136], rax      # 8-byte Spill
	mov	rax, qword ptr [rbp - 48]
	cqo
	idiv	qword ptr [rbp - 88]
	mov	rax, qword ptr [rbp - 136]      # 8-byte Reload
	sub	rax, rdx
	mov	qword ptr [rbp - 104], rax
	mov	rax, qword ptr [rbp - 104]
	cqo
	idiv	qword ptr [rbp - 88]
	mov	rcx, rax
	lea	rax, [rip + _viperNumberTable]
	mov	cl, byte ptr [rax + rcx]
	mov	rax, qword ptr [rbp - 56]
	mov	byte ptr [rax], cl
	mov	rax, qword ptr [rbp - 56]
	add	rax, 1
	mov	qword ptr [rbp - 56], rax
	mov	rcx, qword ptr [rbp - 104]
	mov	rax, qword ptr [rbp - 48]
	sub	rax, rcx
	mov	qword ptr [rbp - 48], rax
	movsxd	rcx, dword ptr [rbp - 68]
	mov	rax, qword ptr [rbp - 88]
	cqo
	idiv	rcx
	mov	qword ptr [rbp - 88], rax
# %bb.7:                                #   in Loop: Header=BB1_5 Depth=1
	mov	rax, qword ptr [rbp - 96]
	add	rax, -1
	mov	qword ptr [rbp - 96], rax
	jmp	.LBB1_5
.LBB1_8:
	mov	rcx, qword ptr [rbp - 48]
	lea	rax, [rip + _viperNumberTable]
	mov	cl, byte ptr [rax + rcx]
	mov	rax, qword ptr [rbp - 56]
	mov	byte ptr [rax], cl
	mov	rax, qword ptr [rbp - 56]
	mov	byte ptr [rax + 1], 0
	mov	rax, qword ptr [rbp - 80]
	movsxd	rcx, dword ptr [rbp - 72]
	add	rax, rcx
	mov	qword ptr [rbp - 40], rax
	jmp	.LBB1_10
.LBB1_9:
	mov	qword ptr [rbp - 40], -1
.LBB1_10:
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 144], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB1_12
# %bb.11:
	mov	rax, qword ptr [rbp - 144]      # 8-byte Reload
	add	rsp, 176
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_12:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	ViperItoa, .Lfunc_end1-ViperItoa
	.cfi_endproc
                                        # -- End function
	.globl	ViperAtoi                       # -- Begin function ViperAtoi
	.p2align	4, 0x90
	.type	ViperAtoi,@function
ViperAtoi:                              # @ViperAtoi
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
	mov	qword ptr [rbp - 24], 1
	mov	qword ptr [rbp - 32], 0
	mov	rax, qword ptr [rbp - 8]
	movsx	ecx, byte ptr [rax]
	mov	eax, 45
	cmp	eax, ecx
	jne	.LBB2_2
# %bb.1:
	mov	rdi, qword ptr [rbp - 8]
	add	rdi, 1
	call	ViperFindNonNumeric@PLT
	add	rax, -1
	mov	qword ptr [rbp - 32], rax
	jmp	.LBB2_3
.LBB2_2:
	mov	rdi, qword ptr [rbp - 8]
	call	ViperFindNonNumeric@PLT
	add	rax, -1
	mov	qword ptr [rbp - 32], rax
.LBB2_3:
	mov	rax, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rbp - 32]
	jne	.LBB2_5
# %bb.4:
	jmp	.LBB2_11
.LBB2_5:
	jmp	.LBB2_6
.LBB2_6:                                # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rbp - 8]
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	cmp	rcx, qword ptr [rbp - 32]
	mov	byte ptr [rbp - 33], al         # 1-byte Spill
	jae	.LBB2_8
# %bb.7:                                #   in Loop: Header=BB2_6 Depth=1
	mov	rax, qword ptr [rbp - 32]
	movsx	eax, byte ptr [rax]
	cmp	eax, 45
	setne	al
	mov	byte ptr [rbp - 33], al         # 1-byte Spill
.LBB2_8:                                #   in Loop: Header=BB2_6 Depth=1
	mov	al, byte ptr [rbp - 33]         # 1-byte Reload
	test	al, 1
	jne	.LBB2_9
	jmp	.LBB2_10
.LBB2_9:                                #   in Loop: Header=BB2_6 Depth=1
	mov	rax, qword ptr [rbp - 32]
	movsx	eax, byte ptr [rax]
	sub	eax, 48
	cdqe
	imul	rax, qword ptr [rbp - 24]
	add	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 16], rax
	imul	rax, qword ptr [rbp - 24], 10
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 32]
	add	rax, -1
	mov	qword ptr [rbp - 32], rax
	jmp	.LBB2_6
.LBB2_10:
	jmp	.LBB2_11
.LBB2_11:
	mov	rax, qword ptr [rbp - 32]
	movsx	ecx, byte ptr [rax]
	mov	eax, 45
	cmp	eax, ecx
	jne	.LBB2_13
# %bb.12:
	xor	eax, eax
                                        # kill: def $rax killed $eax
	sub	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 16], rax
	jmp	.LBB2_14
.LBB2_13:
	mov	rax, qword ptr [rbp - 32]
	movsx	eax, byte ptr [rax]
	sub	eax, 48
	cdqe
	imul	rax, qword ptr [rbp - 24]
	add	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 16], rax
.LBB2_14:
	mov	rax, qword ptr [rbp - 16]
	add	rsp, 48
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end2:
	.size	ViperAtoi, .Lfunc_end2-ViperAtoi
	.cfi_endproc
                                        # -- End function
	.type	_viperNumberTable,@object       # @_viperNumberTable
	.section	.rodata,"a",@progbits
	.globl	_viperNumberTable
	.p2align	4, 0x0
_viperNumberTable:
	.asciz	"0123456789ABCDEF"
	.size	_viperNumberTable, 17

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Buffer is to small"
	.size	.L.str, 19

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ViperIntegerStringLength
	.addrsig_sym ViperLog
	.addrsig_sym labs
	.addrsig_sym __ViperLogger
	.addrsig_sym powl
	.addrsig_sym ViperFindNonNumeric
	.addrsig_sym __stack_chk_fail
	.addrsig_sym _viperNumberTable
