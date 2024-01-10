	.text
	.intel_syntax noprefix
	.file	"printer.c"
	.globl	__ViperAioWriteCompleted        # -- Begin function __ViperAioWriteCompleted
	.p2align	4, 0x90
	.type	__ViperAioWriteCompleted,@function
__ViperAioWriteCompleted:               # @__ViperAioWriteCompleted
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rbp - 16], rax
	mov	rdi, qword ptr [rbp - 16]
	call	aio_error@PLT
	test	eax, eax
	jne	.LBB0_5
	jmp	.LBB0_1
.LBB0_1:
	mov	rdi, qword ptr [rbp - 16]
	call	aio_return@PLT
	sub	rax, -1
	jne	.LBB0_3
	jmp	.LBB0_2
.LBB0_2:
	mov	edi, 2
	lea	rsi, [rip + .L.str]
	mov	edx, 23
	call	write@PLT
	jmp	.LBB0_4
.LBB0_3:
	jmp	.LBB0_4
.LBB0_4:
	jmp	.LBB0_6
.LBB0_5:
	mov	edi, 2
	lea	rsi, [rip + .L.str.1]
	mov	edx, 22
	call	write@PLT
.LBB0_6:
	mov	rax, qword ptr [rbp - 16]
	mov	rdi, qword ptr [rax + 16]
	call	free@PLT
	mov	rdi, qword ptr [rbp - 16]
	call	free@PLT
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	__ViperAioWriteCompleted, .Lfunc_end0-__ViperAioWriteCompleted
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrintFlush                 # -- Begin function ViperPrintFlush
	.p2align	4, 0x90
	.type	ViperPrintFlush,@function
ViperPrintFlush:                        # @ViperPrintFlush
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 24]
	mov	byte ptr [rax + rcx + 1], 0
	mov	edi, dword ptr [rbp - 4]
	mov	rax, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rax + 16]
	mov	rdx, qword ptr [rbp - 24]
	call	write@PLT
	add	rsp, 32
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	ViperPrintFlush, .Lfunc_end1-ViperPrintFlush
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrintNSBUFVA               # -- Begin function ViperPrintNSBUFVA
	.p2align	4, 0x90
	.type	ViperPrintNSBUFVA,@function
ViperPrintNSBUFVA:                      # @ViperPrintNSBUFVA
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 112
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	dword ptr [rbp - 68], edi
	mov	qword ptr [rbp - 80], rsi
	mov	qword ptr [rbp - 16], rdx
	mov	qword ptr [rbp - 88], rcx
	mov	qword ptr [rbp - 96], r8
	mov	eax, dword ptr [rbp - 68]
	mov	dword ptr [rbp - 56], eax
	mov	rax, qword ptr [rbp - 80]
	mov	qword ptr [rbp - 48], rax
	mov	rax, qword ptr [rbp - 88]
	mov	qword ptr [rbp - 40], rax
	mov	rax, qword ptr [rbp - 88]
	mov	qword ptr [rbp - 32], rax
	lea	rax, [rbp - 16]
	mov	qword ptr [rbp - 24], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 88]
	jne	.LBB2_2
# %bb.1:
	jmp	.LBB2_9
.LBB2_2:
	jmp	.LBB2_3
.LBB2_3:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 32]
	movsx	eax, byte ptr [rax]
	mov	dword ptr [rbp - 100], eax      # 4-byte Spill
	test	eax, eax
	je	.LBB2_6
	jmp	.LBB2_13
.LBB2_13:                               #   in Loop: Header=BB2_3 Depth=1
	mov	eax, dword ptr [rbp - 100]      # 4-byte Reload
	sub	eax, 36
	je	.LBB2_4
	jmp	.LBB2_14
.LBB2_14:                               #   in Loop: Header=BB2_3 Depth=1
	mov	eax, dword ptr [rbp - 100]      # 4-byte Reload
	sub	eax, 37
	je	.LBB2_5
	jmp	.LBB2_7
.LBB2_4:                                #   in Loop: Header=BB2_3 Depth=1
	mov	rsi, qword ptr [rbp - 96]
	lea	rdi, [rbp - 56]
	call	__ViperDollar
	jmp	.LBB2_3
.LBB2_5:                                #   in Loop: Header=BB2_3 Depth=1
	mov	rsi, qword ptr [rbp - 96]
	lea	rdi, [rbp - 56]
	call	__ViperPercentage
	jmp	.LBB2_3
.LBB2_6:
	jmp	.LBB2_8
.LBB2_7:                                #   in Loop: Header=BB2_3 Depth=1
	mov	rax, qword ptr [rbp - 32]
	mov	dl, byte ptr [rax]
	mov	rax, qword ptr [rbp - 80]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 16]
	mov	rsi, rcx
	add	rsi, 1
	mov	qword ptr [rbp - 16], rsi
	mov	byte ptr [rax + rcx], dl
	mov	rax, qword ptr [rbp - 32]
	add	rax, 1
	mov	qword ptr [rbp - 32], rax
	jmp	.LBB2_3
.LBB2_8:
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 64], rax
	jmp	.LBB2_10
.LBB2_9:
	mov	qword ptr [rbp - 64], -1
.LBB2_10:
	mov	rax, qword ptr [rbp - 64]
	mov	qword ptr [rbp - 112], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB2_12
# %bb.11:
	mov	rax, qword ptr [rbp - 112]      # 8-byte Reload
	add	rsp, 112
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB2_12:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end2:
	.size	ViperPrintNSBUFVA, .Lfunc_end2-ViperPrintNSBUFVA
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperDollar
	.type	__ViperDollar,@function
__ViperDollar:                          # @__ViperDollar
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 24]
	movsx	eax, byte ptr [rax + 1]
	mov	dword ptr [rbp - 20], eax       # 4-byte Spill
	sub	eax, 36
	je	.LBB3_2
	jmp	.LBB3_10
.LBB3_10:                               #   in Loop: Header=BB3_1 Depth=1
	mov	eax, dword ptr [rbp - 20]       # 4-byte Reload
	sub	eax, 115
	je	.LBB3_3
	jmp	.LBB3_11
.LBB3_11:                               #   in Loop: Header=BB3_1 Depth=1
	mov	eax, dword ptr [rbp - 20]       # 4-byte Reload
	sub	eax, 116
	je	.LBB3_4
	jmp	.LBB3_5
.LBB3_2:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rdx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rdx + 32]
	mov	rsi, rcx
	add	rsi, 8
	mov	qword ptr [rdx + 32], rsi
	mov	rcx, qword ptr [rcx]
	mov	byte ptr [rax + rcx], 36
	jmp	.LBB3_9
.LBB3_3:
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	__ViperCopyString
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	add	rcx, qword ptr [rax]
	mov	qword ptr [rax], rcx
	jmp	.LBB3_9
.LBB3_4:
	jmp	.LBB3_9
.LBB3_5:                                #   in Loop: Header=BB3_1 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 24]
	movsx	eax, byte ptr [rax]
	mov	dword ptr [rbp - 24], eax       # 4-byte Spill
	sub	eax, 10
	jb	.LBB3_6
	jmp	.LBB3_12
.LBB3_12:                               #   in Loop: Header=BB3_1 Depth=1
	mov	eax, dword ptr [rbp - 24]       # 4-byte Reload
	sub	eax, 46
	jne	.LBB3_7
	jmp	.LBB3_6
.LBB3_6:                                #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_1
.LBB3_7:
	jmp	.LBB3_8
.LBB3_8:
	jmp	.LBB3_9
.LBB3_9:
	mov	rax, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rax + 24]
	add	rcx, 2
	mov	qword ptr [rax + 24], rcx
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	mov	rax, qword ptr [rax]
	add	rsp, 32
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end3:
	.size	__ViperDollar, .Lfunc_end3-__ViperDollar
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperPercentage
	.type	__ViperPercentage,@function
__ViperPercentage:                      # @__ViperPercentage
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 80
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 24]
	movsx	eax, byte ptr [rax + 1]
	add	eax, -37
	mov	ecx, eax
	mov	qword ptr [rbp - 24], rcx       # 8-byte Spill
	sub	eax, 81
	ja	.LBB4_18
# %bb.19:
	mov	rax, qword ptr [rbp - 24]       # 8-byte Reload
	lea	rcx, [rip + .LJTI4_0]
	movsxd	rax, dword ptr [rcx + 4*rax]
	add	rax, rcx
	jmp	rax
.LBB4_1:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	byte ptr [rax + rcx], 37
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	mov	rcx, qword ptr [rax]
	add	rcx, 1
	mov	qword ptr [rax], rcx
.LBB4_2:
	jmp	.LBB4_18
.LBB4_3:
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 40], rax       # 8-byte Spill
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 28], eax       # 4-byte Spill
	cmp	eax, 40
	ja	.LBB4_5
# %bb.4:
	mov	rcx, qword ptr [rbp - 40]       # 8-byte Reload
	mov	edx, dword ptr [rbp - 28]       # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	jmp	.LBB4_6
.LBB4_5:
	mov	rcx, qword ptr [rbp - 40]       # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
.LBB4_6:
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	mov	eax, dword ptr [rax]
	mov	dl, al
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rsi, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rsi + 32]
	mov	rdi, rcx
	add	rdi, 8
	mov	qword ptr [rsi + 32], rdi
	mov	rcx, qword ptr [rcx]
	mov	byte ptr [rax + rcx], dl
	jmp	.LBB4_18
.LBB4_7:
	jmp	.LBB4_18
.LBB4_8:
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 64], rax       # 8-byte Spill
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 52], eax       # 4-byte Spill
	cmp	eax, 40
	ja	.LBB4_10
# %bb.9:
	mov	rcx, qword ptr [rbp - 64]       # 8-byte Reload
	mov	edx, dword ptr [rbp - 52]       # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 72], rax       # 8-byte Spill
	jmp	.LBB4_11
.LBB4_10:
	mov	rcx, qword ptr [rbp - 64]       # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 72], rax       # 8-byte Spill
.LBB4_11:
	mov	rax, qword ptr [rbp - 72]       # 8-byte Reload
	movsxd	rdi, dword ptr [rax]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rsi, qword ptr [rax + 16]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	add	rsi, qword ptr [rax]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rdx, qword ptr [rax + 8]
	mov	ecx, 10
	call	ViperItoa@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	add	rcx, qword ptr [rax]
	mov	qword ptr [rax], rcx
	jmp	.LBB4_18
.LBB4_12:
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	__ViperGetErrorNumber
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	add	rcx, qword ptr [rax]
	mov	qword ptr [rax], rcx
	jmp	.LBB4_18
.LBB4_13:
	jmp	.LBB4_18
.LBB4_14:
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	__ViperCopyString
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	add	rcx, qword ptr [rax]
	mov	qword ptr [rax], rcx
	jmp	.LBB4_18
.LBB4_15:
	jmp	.LBB4_18
.LBB4_16:
	jmp	.LBB4_18
.LBB4_17:
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	__ViperVulkanResultToString
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	add	rcx, qword ptr [rax]
	mov	qword ptr [rax], rcx
.LBB4_18:
	mov	rax, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rax + 24]
	add	rcx, 2
	mov	qword ptr [rax + 24], rcx
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	mov	rax, qword ptr [rax]
	add	rsp, 80
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end4:
	.size	__ViperPercentage, .Lfunc_end4-__ViperPercentage
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI4_0:
	.long	.LBB4_1-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_15-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_2-.LJTI4_0
	.long	.LBB4_2-.LJTI4_0
	.long	.LBB4_3-.LJTI4_0
	.long	.LBB4_7-.LJTI4_0
	.long	.LBB4_7-.LJTI4_0
	.long	.LBB4_7-.LJTI4_0
	.long	.LBB4_7-.LJTI4_0
	.long	.LBB4_7-.LJTI4_0
	.long	.LBB4_8-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_12-.LJTI4_0
	.long	.LBB4_13-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_14-.LJTI4_0
	.long	.LBB4_16-.LJTI4_0
	.long	.LBB4_18-.LJTI4_0
	.long	.LBB4_17-.LJTI4_0
                                        # -- End function
	.text
	.globl	ViperPrintNSBUF                 # -- Begin function ViperPrintNSBUF
	.p2align	4, 0x90
	.type	ViperPrintNSBUF,@function
ViperPrintNSBUF:                        # @ViperPrintNSBUF
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 272
	test	al, al
	je	.LBB5_4
# %bb.3:
	movaps	xmmword ptr [rbp - 208], xmm0
	movaps	xmmword ptr [rbp - 192], xmm1
	movaps	xmmword ptr [rbp - 176], xmm2
	movaps	xmmword ptr [rbp - 160], xmm3
	movaps	xmmword ptr [rbp - 144], xmm4
	movaps	xmmword ptr [rbp - 128], xmm5
	movaps	xmmword ptr [rbp - 112], xmm6
	movaps	xmmword ptr [rbp - 96], xmm7
.LBB5_4:
	mov	qword ptr [rbp - 216], r9
	mov	qword ptr [rbp - 224], r8
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	dword ptr [rbp - 36], edi
	mov	qword ptr [rbp - 48], rsi
	mov	qword ptr [rbp - 56], rdx
	mov	qword ptr [rbp - 64], rcx
	mov	dword ptr [rbp - 68], 0
	lea	rax, [rbp - 256]
	mov	qword ptr [rbp - 16], rax
	lea	rax, [rbp + 16]
	mov	qword ptr [rbp - 24], rax
	mov	dword ptr [rbp - 28], 48
	mov	dword ptr [rbp - 32], 32
	mov	edi, dword ptr [rbp - 36]
	mov	rsi, qword ptr [rbp - 48]
	mov	rdx, qword ptr [rbp - 56]
	mov	rcx, qword ptr [rbp - 64]
	lea	r8, [rbp - 32]
	call	ViperPrintNSBUFVA
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 68], eax
	movsxd	rax, dword ptr [rbp - 68]
	mov	qword ptr [rbp - 264], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB5_2
# %bb.1:
	mov	rax, qword ptr [rbp - 264]      # 8-byte Reload
	add	rsp, 272
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB5_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end5:
	.size	ViperPrintNSBUF, .Lfunc_end5-ViperPrintNSBUF
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrintNSBFVA                # -- Begin function ViperPrintNSBFVA
	.p2align	4, 0x90
	.type	ViperPrintNSBFVA,@function
ViperPrintNSBFVA:                       # @ViperPrintNSBFVA
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	qword ptr [rbp - 32], rcx
	mov	edi, dword ptr [rbp - 4]
	mov	rsi, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 24]
	mov	r8, qword ptr [rbp - 32]
	xor	eax, eax
	mov	edx, eax
	call	ViperPrintNSBUFVA
	add	rsp, 32
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end6:
	.size	ViperPrintNSBFVA, .Lfunc_end6-ViperPrintNSBFVA
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrintNSBF                  # -- Begin function ViperPrintNSBF
	.p2align	4, 0x90
	.type	ViperPrintNSBF,@function
ViperPrintNSBF:                         # @ViperPrintNSBF
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 256
	test	al, al
	je	.LBB7_4
# %bb.3:
	movaps	xmmword ptr [rbp - 192], xmm0
	movaps	xmmword ptr [rbp - 176], xmm1
	movaps	xmmword ptr [rbp - 160], xmm2
	movaps	xmmword ptr [rbp - 144], xmm3
	movaps	xmmword ptr [rbp - 128], xmm4
	movaps	xmmword ptr [rbp - 112], xmm5
	movaps	xmmword ptr [rbp - 96], xmm6
	movaps	xmmword ptr [rbp - 80], xmm7
.LBB7_4:
	mov	qword ptr [rbp - 200], r9
	mov	qword ptr [rbp - 208], r8
	mov	qword ptr [rbp - 216], rcx
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	dword ptr [rbp - 36], edi
	mov	qword ptr [rbp - 48], rsi
	mov	qword ptr [rbp - 56], rdx
	mov	qword ptr [rbp - 64], 0
	lea	rax, [rbp - 240]
	mov	qword ptr [rbp - 16], rax
	lea	rax, [rbp + 16]
	mov	qword ptr [rbp - 24], rax
	mov	dword ptr [rbp - 28], 48
	mov	dword ptr [rbp - 32], 24
	mov	edi, dword ptr [rbp - 36]
	mov	rsi, qword ptr [rbp - 48]
	mov	rdx, qword ptr [rbp - 56]
	lea	rcx, [rbp - 32]
	call	ViperPrintNSBFVA
	mov	qword ptr [rbp - 64], rax
	mov	rax, qword ptr [rbp - 64]
	mov	qword ptr [rbp - 248], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB7_2
# %bb.1:
	mov	rax, qword ptr [rbp - 248]      # 8-byte Reload
	add	rsp, 256
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB7_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end7:
	.size	ViperPrintNSBF, .Lfunc_end7-ViperPrintNSBF
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrintSBFVA                 # -- Begin function ViperPrintSBFVA
	.p2align	4, 0x90
	.type	ViperPrintSBFVA,@function
ViperPrintSBFVA:                        # @ViperPrintSBFVA
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	qword ptr [rbp - 32], rcx
	mov	edi, dword ptr [rbp - 4]
	mov	rsi, qword ptr [rbp - 16]
	mov	rdx, qword ptr [rbp - 24]
	mov	rcx, qword ptr [rbp - 32]
	call	ViperPrintNSBFVA
	mov	qword ptr [rbp - 40], rax
	mov	edi, dword ptr [rbp - 4]
	mov	rsi, qword ptr [rbp - 16]
	mov	rdx, qword ptr [rbp - 40]
	call	ViperPrintFlush
	mov	rax, qword ptr [rbp - 40]
	add	rsp, 48
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end8:
	.size	ViperPrintSBFVA, .Lfunc_end8-ViperPrintSBFVA
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrintSBF                   # -- Begin function ViperPrintSBF
	.p2align	4, 0x90
	.type	ViperPrintSBF,@function
ViperPrintSBF:                          # @ViperPrintSBF
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 256
	test	al, al
	je	.LBB9_4
# %bb.3:
	movaps	xmmword ptr [rbp - 192], xmm0
	movaps	xmmword ptr [rbp - 176], xmm1
	movaps	xmmword ptr [rbp - 160], xmm2
	movaps	xmmword ptr [rbp - 144], xmm3
	movaps	xmmword ptr [rbp - 128], xmm4
	movaps	xmmword ptr [rbp - 112], xmm5
	movaps	xmmword ptr [rbp - 96], xmm6
	movaps	xmmword ptr [rbp - 80], xmm7
.LBB9_4:
	mov	qword ptr [rbp - 200], r9
	mov	qword ptr [rbp - 208], r8
	mov	qword ptr [rbp - 216], rcx
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	dword ptr [rbp - 36], edi
	mov	qword ptr [rbp - 48], rsi
	mov	qword ptr [rbp - 56], rdx
	mov	dword ptr [rbp - 60], 0
	lea	rax, [rbp - 240]
	mov	qword ptr [rbp - 16], rax
	lea	rax, [rbp + 16]
	mov	qword ptr [rbp - 24], rax
	mov	dword ptr [rbp - 28], 48
	mov	dword ptr [rbp - 32], 24
	mov	edi, dword ptr [rbp - 36]
	mov	rsi, qword ptr [rbp - 48]
	mov	rdx, qword ptr [rbp - 56]
	lea	rcx, [rbp - 32]
	call	ViperPrintSBFVA
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 60], eax
	movsxd	rax, dword ptr [rbp - 60]
	mov	qword ptr [rbp - 248], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB9_2
# %bb.1:
	mov	rax, qword ptr [rbp - 248]      # 8-byte Reload
	add	rsp, 256
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB9_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end9:
	.size	ViperPrintSBF, .Lfunc_end9-ViperPrintSBF
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrintSFVA                  # -- Begin function ViperPrintSFVA
	.p2align	4, 0x90
	.type	ViperPrintSFVA,@function
ViperPrintSFVA:                         # @ViperPrintSFVA
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	mov	rax, qword ptr fs:[0]
	mov	rcx, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rcx
	mov	dword ptr [rbp - 36], edi
	mov	qword ptr [rbp - 48], rsi
	mov	qword ptr [rbp - 56], rdx
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 256
	lea	rax, [rax + __memory@TPOFF]
	mov	qword ptr [rbp - 16], rax
	mov	edi, dword ptr [rbp - 36]
	mov	rdx, qword ptr [rbp - 48]
	mov	rcx, qword ptr [rbp - 56]
	lea	rsi, [rbp - 32]
	call	ViperPrintSBFVA
	mov	qword ptr [rbp - 64], rax       # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB10_2
# %bb.1:
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	add	rsp, 64
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB10_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end10:
	.size	ViperPrintSFVA, .Lfunc_end10-ViperPrintSFVA
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrintFVA                   # -- Begin function ViperPrintFVA
	.p2align	4, 0x90
	.type	ViperPrintFVA,@function
ViperPrintFVA:                          # @ViperPrintFVA
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rsi, qword ptr [rbp - 8]
	mov	rdx, qword ptr [rbp - 16]
	mov	edi, 1
	call	ViperPrintSFVA
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end11:
	.size	ViperPrintFVA, .Lfunc_end11-ViperPrintFVA
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrintSF                    # -- Begin function ViperPrintSF
	.p2align	4, 0x90
	.type	ViperPrintSF,@function
ViperPrintSF:                           # @ViperPrintSF
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 256
	test	al, al
	je	.LBB12_4
# %bb.3:
	movaps	xmmword ptr [rbp - 192], xmm0
	movaps	xmmword ptr [rbp - 176], xmm1
	movaps	xmmword ptr [rbp - 160], xmm2
	movaps	xmmword ptr [rbp - 144], xmm3
	movaps	xmmword ptr [rbp - 128], xmm4
	movaps	xmmword ptr [rbp - 112], xmm5
	movaps	xmmword ptr [rbp - 96], xmm6
	movaps	xmmword ptr [rbp - 80], xmm7
.LBB12_4:
	mov	qword ptr [rbp - 200], r9
	mov	qword ptr [rbp - 208], r8
	mov	qword ptr [rbp - 216], rcx
	mov	qword ptr [rbp - 224], rdx
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	dword ptr [rbp - 36], edi
	mov	qword ptr [rbp - 48], rsi
	mov	dword ptr [rbp - 52], 0
	lea	rax, [rbp - 240]
	mov	qword ptr [rbp - 16], rax
	lea	rax, [rbp + 16]
	mov	qword ptr [rbp - 24], rax
	mov	dword ptr [rbp - 28], 48
	mov	dword ptr [rbp - 32], 16
	mov	edi, dword ptr [rbp - 36]
	mov	rsi, qword ptr [rbp - 48]
	lea	rdx, [rbp - 32]
	call	ViperPrintSFVA
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 52], eax
	movsxd	rax, dword ptr [rbp - 52]
	mov	qword ptr [rbp - 248], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB12_2
# %bb.1:
	mov	rax, qword ptr [rbp - 248]      # 8-byte Reload
	add	rsp, 256
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB12_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end12:
	.size	ViperPrintSF, .Lfunc_end12-ViperPrintSF
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrintF                     # -- Begin function ViperPrintF
	.p2align	4, 0x90
	.type	ViperPrintF,@function
ViperPrintF:                            # @ViperPrintF
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 240
	test	al, al
	je	.LBB13_4
# %bb.3:
	movaps	xmmword ptr [rbp - 176], xmm0
	movaps	xmmword ptr [rbp - 160], xmm1
	movaps	xmmword ptr [rbp - 144], xmm2
	movaps	xmmword ptr [rbp - 128], xmm3
	movaps	xmmword ptr [rbp - 112], xmm4
	movaps	xmmword ptr [rbp - 96], xmm5
	movaps	xmmword ptr [rbp - 80], xmm6
	movaps	xmmword ptr [rbp - 64], xmm7
.LBB13_4:
	mov	qword ptr [rbp - 184], r9
	mov	qword ptr [rbp - 192], r8
	mov	qword ptr [rbp - 200], rcx
	mov	qword ptr [rbp - 208], rdx
	mov	qword ptr [rbp - 216], rsi
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 40], rdi
	mov	dword ptr [rbp - 44], 0
	lea	rax, [rbp - 224]
	mov	qword ptr [rbp - 16], rax
	lea	rax, [rbp + 16]
	mov	qword ptr [rbp - 24], rax
	mov	dword ptr [rbp - 28], 48
	mov	dword ptr [rbp - 32], 8
	mov	rsi, qword ptr [rbp - 40]
	mov	edi, 1
	lea	rdx, [rbp - 32]
	call	ViperPrintSFVA
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 44], eax
	movsxd	rax, dword ptr [rbp - 44]
	mov	qword ptr [rbp - 232], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB13_2
# %bb.1:
	mov	rax, qword ptr [rbp - 232]      # 8-byte Reload
	add	rsp, 240
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB13_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end13:
	.size	ViperPrintF, .Lfunc_end13-ViperPrintF
	.cfi_endproc
                                        # -- End function
	.globl	ViperPrint                      # -- Begin function ViperPrint
	.p2align	4, 0x90
	.type	ViperPrint,@function
ViperPrint:                             # @ViperPrint
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
	lea	rdi, [rip + .L.str.2]
	mov	al, 0
	call	ViperPrintF
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end14:
	.size	ViperPrint, .Lfunc_end14-ViperPrint
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperCopyString
	.type	__ViperCopyString,@function
__ViperCopyString:                      # @__ViperCopyString
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
	mov	qword ptr [rbp - 24], 0
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 36], eax       # 4-byte Spill
	cmp	eax, 40
	ja	.LBB15_2
# %bb.1:
	mov	rcx, qword ptr [rbp - 48]       # 8-byte Reload
	mov	edx, dword ptr [rbp - 36]       # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	jmp	.LBB15_3
.LBB15_2:
	mov	rcx, qword ptr [rbp - 48]       # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
.LBB15_3:
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 32], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 32]
	jne	.LBB15_5
# %bb.4:
	jmp	.LBB15_8
.LBB15_5:
	mov	rdi, qword ptr [rbp - 32]
	call	strlen@PLT
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 8]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	sub	rax, qword ptr [rcx]
	cmp	rax, qword ptr [rbp - 24]
	jae	.LBB15_7
# %bb.6:
	mov	rdi, qword ptr [rbp - 8]
	call	__ViperFlushBuffer
.LBB15_7:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rdi, qword ptr [rax + 16]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	add	rdi, qword ptr [rax]
	mov	rsi, qword ptr [rbp - 32]
	mov	rdx, qword ptr [rbp - 24]
	call	memmove@PLT
.LBB15_8:
	mov	rax, qword ptr [rbp - 24]
	add	rsp, 64
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end15:
	.size	__ViperCopyString, .Lfunc_end15-__ViperCopyString
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperFlushBuffer
	.type	__ViperFlushBuffer,@function
__ViperFlushBuffer:                     # @__ViperFlushBuffer
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 8]
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 8]
	mov	edi, dword ptr [rax]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rsi, qword ptr [rax + 16]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rdx, qword ptr [rax + 8]
	call	write@PLT
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	mov	qword ptr [rax], 0
	mov	rax, qword ptr [rbp - 16]
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end16:
	.size	__ViperFlushBuffer, .Lfunc_end16-__ViperFlushBuffer
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperGetErrorNumber
	.type	__ViperGetErrorNumber,@function
__ViperGetErrorNumber:                  # @__ViperGetErrorNumber
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 32], rax       # 8-byte Spill
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 20], eax       # 4-byte Spill
	cmp	eax, 40
	ja	.LBB17_2
# %bb.1:
	mov	rcx, qword ptr [rbp - 32]       # 8-byte Reload
	mov	edx, dword ptr [rbp - 20]       # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 40], rax       # 8-byte Spill
	jmp	.LBB17_3
.LBB17_2:
	mov	rcx, qword ptr [rbp - 32]       # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 40], rax       # 8-byte Spill
.LBB17_3:
	mov	rax, qword ptr [rbp - 40]       # 8-byte Reload
	mov	edi, dword ptr [rax]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rsi, qword ptr [rax + 16]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	add	rsi, qword ptr [rax]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rdx, qword ptr [rax + 8]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	sub	rdx, qword ptr [rax]
	call	__xpg_strerror_r@PLT
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rdi, qword ptr [rax + 16]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	add	rdi, qword ptr [rax]
	call	strlen@PLT
	add	rsp, 48
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end17:
	.size	__ViperGetErrorNumber, .Lfunc_end17-__ViperGetErrorNumber
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperVulkanResultToString
	.type	__ViperVulkanResultToString,@function
__ViperVulkanResultToString:            # @__ViperVulkanResultToString
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], 0
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 40], rax       # 8-byte Spill
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 28], eax       # 4-byte Spill
	cmp	eax, 40
	ja	.LBB18_2
# %bb.1:
	mov	rcx, qword ptr [rbp - 40]       # 8-byte Reload
	mov	edx, dword ptr [rbp - 28]       # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	jmp	.LBB18_3
.LBB18_2:
	mov	rcx, qword ptr [rbp - 40]       # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
.LBB18_3:
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	mov	eax, dword ptr [rax]
	add	eax, 13
	mov	ecx, eax
	mov	qword ptr [rbp - 56], rcx       # 8-byte Spill
	sub	eax, 18
	ja	.LBB18_22
# %bb.24:
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
	lea	rcx, [rip + .LJTI18_0]
	movsxd	rax, dword ptr [rcx + 4*rax]
	add	rax, rcx
	jmp	rax
.LBB18_4:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 10
	mov	rdx, qword ptr [rip + .L.str.3]
	mov	qword ptr [rax + rcx], rdx
	mov	dx, word ptr [rip + .L.str.3+8]
	mov	word ptr [rax + rcx + 8], dx
	jmp	.LBB18_23
.LBB18_5:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 12
	mov	rdx, qword ptr [rip + .L.str.4]
	mov	qword ptr [rax + rcx], rdx
	mov	edx, dword ptr [rip + .L.str.4+8]
	mov	dword ptr [rax + rcx + 8], edx
	jmp	.LBB18_23
.LBB18_6:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 10
	mov	rdx, qword ptr [rip + .L.str.5]
	mov	qword ptr [rax + rcx], rdx
	mov	dx, word ptr [rip + .L.str.5+8]
	mov	word ptr [rax + rcx + 8], dx
	jmp	.LBB18_23
.LBB18_7:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 12
	mov	rdx, qword ptr [rip + .L.str.6]
	mov	qword ptr [rax + rcx], rdx
	mov	edx, dword ptr [rip + .L.str.6+8]
	mov	dword ptr [rax + rcx + 8], edx
	jmp	.LBB18_23
.LBB18_8:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 13
	mov	rdx, qword ptr [rip + .L.str.7]
	mov	qword ptr [rax + rcx], rdx
	mov	edx, dword ptr [rip + .L.str.7+8]
	mov	dword ptr [rax + rcx + 8], edx
	mov	dl, byte ptr [rip + .L.str.7+12]
	mov	byte ptr [rax + rcx + 12], dl
	jmp	.LBB18_23
.LBB18_9:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 27
	mov	rdx, qword ptr [rip + .L.str.8]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.8+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.8+16]
	mov	qword ptr [rax + rcx + 16], rdx
	mov	dx, word ptr [rip + .L.str.8+24]
	mov	word ptr [rax + rcx + 24], dx
	mov	dl, byte ptr [rip + .L.str.8+26]
	mov	byte ptr [rax + rcx + 26], dl
	jmp	.LBB18_23
.LBB18_10:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 29
	mov	rdx, qword ptr [rip + .L.str.9]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.9+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.9+16]
	mov	qword ptr [rax + rcx + 16], rdx
	mov	edx, dword ptr [rip + .L.str.9+24]
	mov	dword ptr [rax + rcx + 24], edx
	mov	dl, byte ptr [rip + .L.str.9+28]
	mov	byte ptr [rax + rcx + 28], dl
	jmp	.LBB18_23
.LBB18_11:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 30
	mov	rdx, qword ptr [rip + .L.str.10]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.10+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.10+16]
	mov	qword ptr [rax + rcx + 16], rdx
	mov	edx, dword ptr [rip + .L.str.10+24]
	mov	dword ptr [rax + rcx + 24], edx
	mov	dx, word ptr [rip + .L.str.10+28]
	mov	word ptr [rax + rcx + 28], dx
	jmp	.LBB18_23
.LBB18_12:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 20
	mov	rdx, qword ptr [rip + .L.str.11]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.11+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	edx, dword ptr [rip + .L.str.11+16]
	mov	dword ptr [rax + rcx + 16], edx
	jmp	.LBB18_23
.LBB18_13:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 26
	mov	rdx, qword ptr [rip + .L.str.12]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.12+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.12+16]
	mov	qword ptr [rax + rcx + 16], rdx
	mov	dx, word ptr [rip + .L.str.12+24]
	mov	word ptr [rax + rcx + 24], dx
	jmp	.LBB18_23
.LBB18_14:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 26
	mov	rdx, qword ptr [rip + .L.str.13]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.13+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.13+16]
	mov	qword ptr [rax + rcx + 16], rdx
	mov	dx, word ptr [rip + .L.str.13+24]
	mov	word ptr [rax + rcx + 24], dx
	jmp	.LBB18_23
.LBB18_15:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 30
	mov	rdx, qword ptr [rip + .L.str.14]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.14+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.14+16]
	mov	qword ptr [rax + rcx + 16], rdx
	mov	edx, dword ptr [rip + .L.str.14+24]
	mov	dword ptr [rax + rcx + 24], edx
	mov	dx, word ptr [rip + .L.str.14+28]
	mov	word ptr [rax + rcx + 28], dx
	jmp	.LBB18_23
.LBB18_16:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 28
	mov	rdx, qword ptr [rip + .L.str.15]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.15+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.15+16]
	mov	qword ptr [rax + rcx + 16], rdx
	mov	edx, dword ptr [rip + .L.str.15+24]
	mov	dword ptr [rax + rcx + 24], edx
	jmp	.LBB18_23
.LBB18_17:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 28
	mov	rdx, qword ptr [rip + .L.str.16]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.16+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.16+16]
	mov	qword ptr [rax + rcx + 16], rdx
	mov	edx, dword ptr [rip + .L.str.16+24]
	mov	dword ptr [rax + rcx + 24], edx
	jmp	.LBB18_23
.LBB18_18:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 25
	mov	rdx, qword ptr [rip + .L.str.17]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.17+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.17+16]
	mov	qword ptr [rax + rcx + 16], rdx
	mov	dl, byte ptr [rip + .L.str.17+24]
	mov	byte ptr [rax + rcx + 24], dl
	jmp	.LBB18_23
.LBB18_19:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 29
	mov	rdx, qword ptr [rip + .L.str.18]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.18+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.18+16]
	mov	qword ptr [rax + rcx + 16], rdx
	mov	edx, dword ptr [rip + .L.str.18+24]
	mov	dword ptr [rax + rcx + 24], edx
	mov	dl, byte ptr [rip + .L.str.18+28]
	mov	byte ptr [rax + rcx + 28], dl
	jmp	.LBB18_23
.LBB18_20:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 24
	mov	rdx, qword ptr [rip + .L.str.19]
	mov	qword ptr [rax + rcx], rdx
	mov	rdx, qword ptr [rip + .L.str.19+8]
	mov	qword ptr [rax + rcx + 8], rdx
	mov	rdx, qword ptr [rip + .L.str.19+16]
	mov	qword ptr [rax + rcx + 16], rdx
.LBB18_21:
	jmp	.LBB18_22
.LBB18_22:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 8]
	mov	rax, qword ptr [rax + 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 24], 15
	mov	rdx, qword ptr [rip + .L.str.20]
	mov	qword ptr [rax + rcx], rdx
	mov	edx, dword ptr [rip + .L.str.20+8]
	mov	dword ptr [rax + rcx + 8], edx
	mov	dx, word ptr [rip + .L.str.20+12]
	mov	word ptr [rax + rcx + 12], dx
	mov	dl, byte ptr [rip + .L.str.20+14]
	mov	byte ptr [rax + rcx + 14], dl
.LBB18_23:
	mov	rax, qword ptr [rbp - 24]
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end18:
	.size	__ViperVulkanResultToString, .Lfunc_end18-__ViperVulkanResultToString
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI18_0:
	.long	.LBB18_21-.LJTI18_0
	.long	.LBB18_20-.LJTI18_0
	.long	.LBB18_19-.LJTI18_0
	.long	.LBB18_18-.LJTI18_0
	.long	.LBB18_17-.LJTI18_0
	.long	.LBB18_16-.LJTI18_0
	.long	.LBB18_15-.LJTI18_0
	.long	.LBB18_14-.LJTI18_0
	.long	.LBB18_13-.LJTI18_0
	.long	.LBB18_12-.LJTI18_0
	.long	.LBB18_11-.LJTI18_0
	.long	.LBB18_10-.LJTI18_0
	.long	.LBB18_9-.LJTI18_0
	.long	.LBB18_4-.LJTI18_0
	.long	.LBB18_5-.LJTI18_0
	.long	.LBB18_6-.LJTI18_0
	.long	.LBB18_7-.LJTI18_0
	.long	.LBB18_22-.LJTI18_0
	.long	.LBB18_8-.LJTI18_0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Failed [ aio_return ]\n"
	.size	.L.str, 23

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Failed [ aio_error ]\n"
	.size	.L.str.1, 22

	.type	__memory,@object                # @__memory
	.section	.tbss,"awT",@nobits
	.p2align	4, 0x0
__memory:
	.zero	4096
	.size	__memory, 4096

	.type	.L.str.2,@object                # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"%s"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"VK_SUCCESS"
	.size	.L.str.3, 11

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"VK_NOT_READY"
	.size	.L.str.4, 13

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"VK_TIMEOUT"
	.size	.L.str.5, 11

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"VK_EVENT_SET"
	.size	.L.str.6, 13

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"VK_INCOMPLETE"
	.size	.L.str.7, 14

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"VK_ERROR_OUT_OF_HOST_MEMORY"
	.size	.L.str.8, 28

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"VK_ERROR_OUT_OF_DEVICE_MEMORY"
	.size	.L.str.9, 30

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"VK_ERROR_INITIALIZATION_FAILED"
	.size	.L.str.10, 31

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"VK_ERROR_DEVICE_LOST"
	.size	.L.str.11, 21

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"VK_ERROR_MEMORY_MAP_FAILED"
	.size	.L.str.12, 27

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"VK_ERROR_LAYER_NOT_PRESENT"
	.size	.L.str.13, 27

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"VK_ERROR_EXTENSION_NOT_PRESENT"
	.size	.L.str.14, 31

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"VK_ERROR_FEATURE_NOT_PRESENT"
	.size	.L.str.15, 29

	.type	.L.str.16,@object               # @.str.16
.L.str.16:
	.asciz	"VK_ERROR_INCOMPATIBLE_DRIVER"
	.size	.L.str.16, 29

	.type	.L.str.17,@object               # @.str.17
.L.str.17:
	.asciz	"VK_ERROR_TOO_MANY_OBJECTS"
	.size	.L.str.17, 26

	.type	.L.str.18,@object               # @.str.18
.L.str.18:
	.asciz	"VK_ERROR_FORMAT_NOT_SUPPORTED"
	.size	.L.str.18, 30

	.type	.L.str.19,@object               # @.str.19
.L.str.19:
	.asciz	"VK_ERROR_FRAGMENTED_POOL"
	.size	.L.str.19, 25

	.type	.L.str.20,@object               # @.str.20
.L.str.20:
	.asciz	"VK_ERROR_UNKNOWN"
	.size	.L.str.20, 17

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym aio_error
	.addrsig_sym aio_return
	.addrsig_sym write
	.addrsig_sym free
	.addrsig_sym ViperPrintFlush
	.addrsig_sym ViperPrintNSBUFVA
	.addrsig_sym __ViperDollar
	.addrsig_sym __ViperPercentage
	.addrsig_sym ViperPrintNSBFVA
	.addrsig_sym ViperPrintSBFVA
	.addrsig_sym ViperPrintSFVA
	.addrsig_sym ViperPrintF
	.addrsig_sym __ViperCopyString
	.addrsig_sym strlen
	.addrsig_sym __ViperFlushBuffer
	.addrsig_sym ViperItoa
	.addrsig_sym __ViperGetErrorNumber
	.addrsig_sym __ViperVulkanResultToString
	.addrsig_sym __xpg_strerror_r
	.addrsig_sym __stack_chk_fail
