	.text
	.intel_syntax noprefix
	.file	"signal_handler.c"
	.globl	ViperInitSignalHandler          # -- Begin function ViperInitSignalHandler
	.p2align	4, 0x90
	.type	ViperInitSignalHandler,@function
ViperInitSignalHandler:                 # @ViperInitSignalHandler
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	edi, 11
	lea	rsi, [rip + __ViperSingalHandler]
	call	signal@PLT
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperInitSignalHandler, .Lfunc_end0-ViperInitSignalHandler
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperSingalHandler
	.type	__ViperSingalHandler,@function
__ViperSingalHandler:                   # @__ViperSingalHandler
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	dword ptr [rbp - 4], edi
	mov	eax, dword ptr [rbp - 4]
	sub	eax, 11
	jne	.LBB1_2
	jmp	.LBB1_1
.LBB1_1:
	call	__ViperSingalHandlerSEGSEGV
.LBB1_2:
	mov	edi, dword ptr [rbp - 4]
	xor	eax, eax
	mov	esi, eax
	call	signal@PLT
	mov	edi, dword ptr [rbp - 4]
	call	raise@PLT
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	__ViperSingalHandler, .Lfunc_end1-__ViperSingalHandler
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperSingalHandlerSEGSEGV
	.type	__ViperSingalHandlerSEGSEGV,@function
__ViperSingalHandlerSEGSEGV:            # @__ViperSingalHandlerSEGSEGV
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	dword ptr [rbp - 36], 100
	mov	eax, dword ptr [rbp - 36]
                                        # kill: def $rax killed $eax
	mov	rcx, rsp
	mov	qword ptr [rbp - 48], rcx
	lea	rdx, [8*rax + 15]
	and	rdx, -16
	mov	rcx, rsp
	sub	rcx, rdx
	mov	qword ptr [rbp - 64], rcx       # 8-byte Spill
	mov	rsp, rcx
	mov	qword ptr [rbp - 56], rax
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 7
	mov	qword ptr [rbp - 16], 0
	sub	rsp, 32
	mov	rcx, qword ptr [rbp - 16]
	mov	rax, rsp
	mov	qword ptr [rax + 16], rcx
	movups	xmm0, xmmword ptr [rbp - 32]
	movups	xmmword ptr [rax], xmm0
	lea	rdi, [rip + .L.str]
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	call	__ViperLogger@PLT
	mov	rdi, qword ptr [rbp - 64]       # 8-byte Reload
	add	rsp, 32
	mov	esi, dword ptr [rbp - 36]
	call	backtrace@PLT
	mov	rdi, qword ptr [rbp - 64]       # 8-byte Reload
	mov	dword ptr [rbp - 36], eax
	mov	esi, dword ptr [rbp - 36]
	mov	edx, 1
	call	backtrace_symbols_fd@PLT
	mov	rax, qword ptr [rbp - 48]
	mov	rsp, rax
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB2_2
# %bb.1:
	mov	rsp, rbp
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB2_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end2:
	.size	__ViperSingalHandlerSEGSEGV, .Lfunc_end2-__ViperSingalHandlerSEGSEGV
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Segmentation Fault dumping stack...\n"
	.size	.L.str, 37

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym signal
	.addrsig_sym __ViperSingalHandler
	.addrsig_sym raise
	.addrsig_sym __ViperSingalHandlerSEGSEGV
	.addrsig_sym __ViperLogger
	.addrsig_sym backtrace
	.addrsig_sym backtrace_symbols_fd
	.addrsig_sym __stack_chk_fail
