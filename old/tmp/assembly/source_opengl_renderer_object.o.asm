	.text
	.intel_syntax noprefix
	.file	"renderer_object.c"
	.globl	ViperCreateRenderObjectOpenGL   # -- Begin function ViperCreateRenderObjectOpenGL
	.p2align	4, 0x90
	.type	ViperCreateRenderObjectOpenGL,@function
ViperCreateRenderObjectOpenGL:          # @ViperCreateRenderObjectOpenGL
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
	mov	qword ptr [rbp - 32], rdi
	mov	dword ptr [rbp - 12], 0
	mov	dword ptr [rbp - 16], 0
	mov	dword ptr [rbp - 20], 0
	mov	edi, 1
	lea	rsi, [rbp - 12]
	mov	rax, qword ptr [rip + __glewGenBuffers@GOTPCREL]
	call	qword ptr [rax]
	mov	rax, qword ptr [rip + __glewBindBuffer@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	esi, dword ptr [rbp - 12]
	mov	edi, 34962
	call	rax
	mov	rax, qword ptr [rip + __glewBufferData@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 32]
	mov	rsi, qword ptr [rcx + 40]
	mov	rcx, qword ptr [rbp - 32]
	mov	rdx, qword ptr [rcx + 48]
	mov	edi, 34962
	mov	ecx, 35044
	call	rax
	mov	edi, 34962
	mov	esi, 34660
	lea	rdx, [rbp - 20]
	mov	rax, qword ptr [rip + __glewGetBufferParameteriv@GOTPCREL]
	call	qword ptr [rax]
	mov	rax, qword ptr [rbp - 32]
	mov	rax, qword ptr [rax + 40]
	movsxd	rcx, dword ptr [rbp - 20]
	cmp	rax, rcx
	je	.LBB0_2
# %bb.1:
	jmp	.LBB0_3
.LBB0_2:
	mov	edi, 1
	lea	rsi, [rbp - 16]
	mov	rax, qword ptr [rip + __glewGenBuffers@GOTPCREL]
	call	qword ptr [rax]
	mov	rax, qword ptr [rip + __glewBindBuffer@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	esi, dword ptr [rbp - 16]
	mov	edi, 34963
	call	rax
	mov	byte ptr [rbp - 21], 0
	jmp	.LBB0_4
.LBB0_3:
	mov	byte ptr [rbp - 21], -1
.LBB0_4:
	mov	al, byte ptr [rbp - 21]
	mov	byte ptr [rbp - 33], al         # 1-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_6
# %bb.5:
	mov	al, byte ptr [rbp - 33]         # 1-byte Reload
	movsx	eax, al
	add	rsp, 48
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_6:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperCreateRenderObjectOpenGL, .Lfunc_end0-ViperCreateRenderObjectOpenGL
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __stack_chk_fail
	.addrsig_sym __glewGenBuffers
	.addrsig_sym __glewBindBuffer
	.addrsig_sym __glewBufferData
	.addrsig_sym __glewGetBufferParameteriv
