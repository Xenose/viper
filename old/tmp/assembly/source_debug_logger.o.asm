	.text
	.intel_syntax noprefix
	.file	"logger.c"
	.globl	__ViperLogger                   # -- Begin function __ViperLogger
	.p2align	4, 0x90
	.type	__ViperLogger,@function
__ViperLogger:                          # @__ViperLogger
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 272
	test	al, al
	je	.LBB0_19
# %bb.18:
	movaps	xmmword ptr [rbp - 208], xmm0
	movaps	xmmword ptr [rbp - 192], xmm1
	movaps	xmmword ptr [rbp - 176], xmm2
	movaps	xmmword ptr [rbp - 160], xmm3
	movaps	xmmword ptr [rbp - 144], xmm4
	movaps	xmmword ptr [rbp - 128], xmm5
	movaps	xmmword ptr [rbp - 112], xmm6
	movaps	xmmword ptr [rbp - 96], xmm7
.LBB0_19:
	mov	qword ptr [rbp - 216], r9
	mov	qword ptr [rbp - 224], r8
	mov	qword ptr [rbp - 232], rcx
	mov	qword ptr [rbp - 240], rdx
	mov	qword ptr [rbp - 248], rsi
	lea	rax, [rbp + 16]
	mov	qword ptr [rbp - 264], rax      # 8-byte Spill
	mov	rcx, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rcx
	mov	qword ptr [rbp - 64], rdi
	mov	qword ptr [rbp - 72], 0
	mov	qword ptr [rbp - 80], 0
	mov	rax, qword ptr [rax + 8]
	cmp	rax, qword ptr [rip + __logLevelMax]
	jl	.LBB0_3
# %bb.1:
	mov	rax, qword ptr [rbp - 264]      # 8-byte Reload
	mov	rax, qword ptr [rax + 8]
	cmp	rax, qword ptr [rip + __logLevelMin]
	jg	.LBB0_3
# %bb.2:
	jmp	.LBB0_14
.LBB0_3:
	mov	rax, qword ptr [rbp - 264]      # 8-byte Reload
	mov	rax, qword ptr [rax + 8]
	mov	qword ptr [rbp - 272], rax      # 8-byte Spill
	sub	rax, 7
	ja	.LBB0_12
# %bb.17:
	mov	rax, qword ptr [rbp - 272]      # 8-byte Reload
	lea	rcx, [rip + .LJTI0_0]
	movsxd	rax, dword ptr [rcx + 4*rax]
	add	rax, rcx
	jmp	rax
.LBB0_4:
	lea	rax, [rip + .L.str]
	mov	qword ptr [rbp - 72], rax
	jmp	.LBB0_13
.LBB0_5:
	lea	rax, [rip + .L.str.1]
	mov	qword ptr [rbp - 72], rax
	jmp	.LBB0_13
.LBB0_6:
	lea	rax, [rip + .L.str.2]
	mov	qword ptr [rbp - 72], rax
	jmp	.LBB0_13
.LBB0_7:
	lea	rax, [rip + .L.str.3]
	mov	qword ptr [rbp - 72], rax
	jmp	.LBB0_13
.LBB0_8:
	lea	rax, [rip + .L.str.4]
	mov	qword ptr [rbp - 72], rax
	jmp	.LBB0_13
.LBB0_9:
	lea	rax, [rip + .L.str.5]
	mov	qword ptr [rbp - 72], rax
	jmp	.LBB0_13
.LBB0_10:
	lea	rax, [rip + .L.str.6]
	mov	qword ptr [rbp - 72], rax
	jmp	.LBB0_13
.LBB0_11:
	lea	rax, [rip + .L.str.7]
	mov	qword ptr [rbp - 72], rax
	jmp	.LBB0_13
.LBB0_12:
	jmp	.LBB0_14
.LBB0_13:
	mov	qword ptr [rbp - 56], 0
	mov	qword ptr [rbp - 48], 512
	mov	edi, 1
	mov	esi, 512
	call	calloc@PLT
	mov	qword ptr [rbp - 40], rax
	lea	rax, [rbp - 32]
	lea	rcx, [rbp - 256]
	mov	qword ptr [rax + 16], rcx
	lea	rcx, [rbp + 40]
	mov	qword ptr [rax + 8], rcx
	mov	dword ptr [rax + 4], 48
	mov	dword ptr [rax], 8
	mov	rdx, qword ptr [rbp - 80]
	mov	r8, qword ptr [rbp - 72]
	mov	edi, 2
	lea	rsi, [rbp - 56]
	lea	rcx, [rip + .L.str.8]
	lea	r9, [rip + .L.str.9]
	mov	al, 0
	call	ViperPrintNSBUF@PLT
	add	rax, qword ptr [rbp - 80]
	mov	qword ptr [rbp - 80], rax
	mov	rdx, qword ptr [rbp - 80]
	mov	rcx, qword ptr [rbp - 64]
	lea	r8, [rbp - 32]
	mov	edi, 2
	lea	rsi, [rbp - 56]
	call	ViperPrintNSBUFVA@PLT
	add	rax, qword ptr [rbp - 80]
	mov	qword ptr [rbp - 80], rax
	mov	rax, qword ptr [rbp - 40]
	mov	rcx, qword ptr [rbp - 80]
	sub	rcx, 1
	mov	byte ptr [rax + rcx], 10
	mov	rdx, qword ptr [rbp - 80]
	mov	edi, 2
	lea	rsi, [rbp - 56]
	call	ViperPrintFlush@PLT
	lea	rax, [rbp - 32]
	mov	rdi, qword ptr [rbp - 40]
	call	free@PLT
.LBB0_14:
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_16
# %bb.15:
	add	rsp, 272
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_16:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	__ViperLogger, .Lfunc_end0-__ViperLogger
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0_0:
	.long	.LBB0_4-.LJTI0_0
	.long	.LBB0_5-.LJTI0_0
	.long	.LBB0_6-.LJTI0_0
	.long	.LBB0_7-.LJTI0_0
	.long	.LBB0_8-.LJTI0_0
	.long	.LBB0_9-.LJTI0_0
	.long	.LBB0_10-.LJTI0_0
	.long	.LBB0_11-.LJTI0_0
                                        # -- End function
	.type	__logLevelMax,@object           # @__logLevelMax
	.data
	.p2align	3, 0x0
__logLevelMax:
	.quad	7                               # 0x7
	.size	__logLevelMax, 8

	.type	__logLevelMin,@object           # @__logLevelMin
	.local	__logLevelMin
	.comm	__logLevelMin,8,8
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"DEBUG"
	.size	.L.str, 6

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"INFO"
	.size	.L.str.1, 5

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"NOTICE"
	.size	.L.str.2, 7

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"WARNING"
	.size	.L.str.3, 8

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"ERROR"
	.size	.L.str.4, 6

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"CRITICAL"
	.size	.L.str.5, 9

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"ALERT"
	.size	.L.str.6, 6

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"EMERGANCY"
	.size	.L.str.7, 10

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"[ %s ]%s"
	.size	.L.str.8, 9

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"\n\n\tMessage: "
	.size	.L.str.9, 13

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym calloc
	.addrsig_sym ViperPrintNSBUF
	.addrsig_sym ViperPrintNSBUFVA
	.addrsig_sym ViperPrintFlush
	.addrsig_sym free
	.addrsig_sym __stack_chk_fail
	.addrsig_sym __logLevelMax
	.addrsig_sym __logLevelMin
