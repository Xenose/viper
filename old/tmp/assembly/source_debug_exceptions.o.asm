	.text
	.intel_syntax noprefix
	.file	"exceptions.c"
	.globl	__ViperInternalSignalHandler    # -- Begin function __ViperInternalSignalHandler
	.p2align	4, 0x90
	.type	__ViperInternalSignalHandler,@function
__ViperInternalSignalHandler:           # @__ViperInternalSignalHandler
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	dword ptr [rbp - 4], edi
	mov	rax, qword ptr fs:[0]
	lea	rcx, [rax + __viperJumpIndex@TPOFF]
	xor	eax, eax
	cmp	eax, dword ptr [rcx]
	jne	.LBB0_2
# %bb.1:
	mov	al, 0
	call	ViperInitSignalHandler@PLT
.LBB0_2:
	mov	eax, dword ptr [rbp - 4]
	sub	eax, 11
	jne	.LBB0_4
	jmp	.LBB0_3
.LBB0_3:
	mov	rax, qword ptr fs:[0]
	lea	rdi, [rax + __viperJumpBuffers@TPOFF]
	mov	rax, qword ptr fs:[0]
	lea	rax, [rax + __viperJumpIndex@TPOFF]
	movsxd	rax, dword ptr [rax]
	imul	rax, rax, 200
	add	rdi, rax
	mov	esi, 4294967295
	call	siglongjmp@PLT
.LBB0_4:
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	__ViperInternalSignalHandler, .Lfunc_end0-__ViperInternalSignalHandler
	.cfi_endproc
                                        # -- End function
	.type	__viperJumpIndex,@object        # @__viperJumpIndex
	.section	.tdata,"awT",@progbits
	.globl	__viperJumpIndex
	.p2align	2, 0x0
__viperJumpIndex:
	.long	4294967295                      # 0xffffffff
	.size	__viperJumpIndex, 4

	.type	__viperJumpBuffers,@object      # @__viperJumpBuffers
	.section	.tbss,"awT",@nobits
	.globl	__viperJumpBuffers
	.p2align	4, 0x0
__viperJumpBuffers:
	.zero	51200
	.size	__viperJumpBuffers, 51200

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ViperInitSignalHandler
	.addrsig_sym siglongjmp
