	.text
	.intel_syntax noprefix
	.file	"search.c"
	.globl	ViperMemoryFindLongstMatchFromStart # -- Begin function ViperMemoryFindLongstMatchFromStart
	.p2align	4, 0x90
	.type	ViperMemoryFindLongstMatchFromStart,@function
ViperMemoryFindLongstMatchFromStart:    # @ViperMemoryFindLongstMatchFromStart
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	qword ptr [rbp - 32], rdx
	mov	qword ptr [rbp - 40], rcx
	mov	rax, qword ptr [rbp - 32]
	mov	rcx, qword ptr [rbp - 24]
	sub	rax, rcx
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 44], eax
	mov	rax, qword ptr [rbp - 32]
	cmp	rax, qword ptr [rbp - 24]
	jne	.LBB0_2
# %bb.1:
	mov	qword ptr [rbp - 8], 0
	jmp	.LBB0_12
.LBB0_2:
	mov	rax, qword ptr [rbp - 40]
	movsxd	rcx, dword ptr [rbp - 44]
	cmp	rax, rcx
	jle	.LBB0_4
# %bb.3:
	movsxd	rax, dword ptr [rbp - 44]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	jmp	.LBB0_5
.LBB0_4:
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
.LBB0_5:
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 48], eax
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rbp - 48], 0
	jle	.LBB0_11
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 24]
	movsxd	rdx, dword ptr [rbp - 48]
	call	memcmp@PLT
	mov	ecx, eax
	xor	eax, eax
	cmp	eax, ecx
	jne	.LBB0_9
# %bb.8:
	movsxd	rax, dword ptr [rbp - 48]
	mov	qword ptr [rbp - 8], rax
	jmp	.LBB0_12
.LBB0_9:                                #   in Loop: Header=BB0_6 Depth=1
	jmp	.LBB0_10
.LBB0_10:                               #   in Loop: Header=BB0_6 Depth=1
	mov	eax, dword ptr [rbp - 48]
	add	eax, -1
	mov	dword ptr [rbp - 48], eax
	jmp	.LBB0_6
.LBB0_11:
	mov	qword ptr [rbp - 8], 0
.LBB0_12:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 64
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperMemoryFindLongstMatchFromStart, .Lfunc_end0-ViperMemoryFindLongstMatchFromStart
	.cfi_endproc
                                        # -- End function
	.globl	ViperMemoryFindLongestMatchFromEnd # -- Begin function ViperMemoryFindLongestMatchFromEnd
	.p2align	4, 0x90
	.type	ViperMemoryFindLongestMatchFromEnd,@function
ViperMemoryFindLongestMatchFromEnd:     # @ViperMemoryFindLongestMatchFromEnd
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	qword ptr [rbp - 32], rdx
	mov	qword ptr [rbp - 40], rcx
	mov	rax, qword ptr [rbp - 24]
	mov	rcx, qword ptr [rbp - 32]
	sub	rax, rcx
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 44], eax
	mov	rax, qword ptr [rbp - 32]
	cmp	rax, qword ptr [rbp - 24]
	jne	.LBB1_2
# %bb.1:
	mov	qword ptr [rbp - 8], 0
	jmp	.LBB1_12
.LBB1_2:
	mov	rax, qword ptr [rbp - 40]
	movsxd	rcx, dword ptr [rbp - 44]
	cmp	rax, rcx
	jle	.LBB1_4
# %bb.3:
	movsxd	rax, dword ptr [rbp - 44]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	jmp	.LBB1_5
.LBB1_4:
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
.LBB1_5:
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 48], eax
.LBB1_6:                                # =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rbp - 48], 0
	jle	.LBB1_11
# %bb.7:                                #   in Loop: Header=BB1_6 Depth=1
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 24]
	movsxd	rcx, dword ptr [rbp - 48]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	sub	rax, rcx
	add	rsi, rax
	movsxd	rdx, dword ptr [rbp - 48]
	call	memcmp@PLT
	mov	ecx, eax
	xor	eax, eax
	cmp	eax, ecx
	jne	.LBB1_9
# %bb.8:
	movsxd	rax, dword ptr [rbp - 48]
	mov	qword ptr [rbp - 8], rax
	jmp	.LBB1_12
.LBB1_9:                                #   in Loop: Header=BB1_6 Depth=1
	jmp	.LBB1_10
.LBB1_10:                               #   in Loop: Header=BB1_6 Depth=1
	mov	eax, dword ptr [rbp - 48]
	add	eax, -1
	mov	dword ptr [rbp - 48], eax
	jmp	.LBB1_6
.LBB1_11:
	mov	qword ptr [rbp - 8], 0
.LBB1_12:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 64
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	ViperMemoryFindLongestMatchFromEnd, .Lfunc_end1-ViperMemoryFindLongestMatchFromEnd
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym memcmp
