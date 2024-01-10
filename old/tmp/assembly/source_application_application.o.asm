	.text
	.intel_syntax noprefix
	.file	"application.c"
	.globl	ViperApplicationCreate          # -- Begin function ViperApplicationCreate
	.p2align	4, 0x90
	.type	ViperApplicationCreate,@function
ViperApplicationCreate:                 # @ViperApplicationCreate
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 288
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 232], rdi
	mov	qword ptr [rbp - 240], rsi
	mov	rax, qword ptr [rbp - 232]
	mov	qword ptr [rbp - 248], rax      # 8-byte Spill
	lea	rdi, [rbp - 120]
	xor	esi, esi
	mov	edx, 112
	call	memset@PLT
	mov	rdi, qword ptr [rbp - 248]      # 8-byte Reload
	mov	qword ptr [rbp - 120], 21
	lea	rsi, [rbp - 120]
	mov	edx, 112
	call	memcpy@PLT
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 40]
	jne	.LBB0_2
# %bb.1:
	mov	rax, qword ptr [rbp - 232]
	lea	rcx, [rip + __ViperEmptyLoopNoCall]
	mov	qword ptr [rax + 104], rcx
	jmp	.LBB0_3
.LBB0_2:
	mov	rax, qword ptr [rbp - 240]
	mov	rcx, qword ptr [rax + 40]
	mov	rax, qword ptr [rbp - 232]
	mov	qword ptr [rax + 104], rcx
.LBB0_3:
	mov	rdi, qword ptr [rbp - 232]
	add	rdi, 24
	mov	rax, qword ptr [rbp - 240]
	mov	rsi, qword ptr [rax + 32]
	call	ViperStringCreate@PLT
	mov	rcx, rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	jl	.LBB0_5
# %bb.4:
	mov	qword ptr [rbp - 144], 0
	mov	qword ptr [rbp - 136], 4
	mov	qword ptr [rbp - 128], 0
	lea	rax, [rbp - 144]
	lea	rdi, [rip + .L.str]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_16
.LBB0_5:
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 8]
	and	rax, 1
	cmp	rax, 0
	je	.LBB0_9
# %bb.6:
	mov	rdi, qword ptr [rbp - 232]
	mov	rax, qword ptr [rbp - 232]
	mov	rsi, qword ptr [rax + 96]
	call	ViperVulkanInit@PLT
	mov	ecx, eax
	xor	eax, eax
	cmp	eax, ecx
	je	.LBB0_8
# %bb.7:
	mov	qword ptr [rbp - 168], 0
	mov	qword ptr [rbp - 160], 4
	mov	qword ptr [rbp - 152], 0
	lea	rax, [rbp - 168]
	lea	rdi, [rip + .L.str.1]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_16
.LBB0_8:
	lea	rax, [rip + __ViperRenderLoopNoCall]
	mov	qword ptr [rip + __ViperRenderLoop], rax
	jmp	.LBB0_15
.LBB0_9:
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 8]
	and	rax, 2
	cmp	rax, 0
	je	.LBB0_13
# %bb.10:
	mov	rdi, qword ptr [rbp - 232]
	mov	rax, qword ptr [rbp - 232]
	mov	rsi, qword ptr [rax + 96]
	call	ViperOpenGLInit@PLT
	mov	rcx, rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	je	.LBB0_12
# %bb.11:
	mov	qword ptr [rbp - 192], 0
	mov	qword ptr [rbp - 184], 4
	mov	qword ptr [rbp - 176], 0
	lea	rax, [rbp - 192]
	lea	rdi, [rip + .L.str.2]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_16
.LBB0_12:
	mov	rax, qword ptr [rip + ViperRenderLoopOpenGL@GOTPCREL]
	mov	qword ptr [rip + __ViperRenderLoop], rax
	jmp	.LBB0_14
.LBB0_13:
	mov	qword ptr [rbp - 216], 0
	mov	qword ptr [rbp - 208], 0
	mov	qword ptr [rbp - 200], 0
	lea	rax, [rbp - 216]
	lea	rdi, [rip + .L.str.3]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB0_14:
	jmp	.LBB0_15
.LBB0_15:
	mov	rcx, qword ptr [rbp - 232]
	mov	eax, 2
	xchg	qword ptr [rcx + 16], rax
	mov	dword ptr [rbp - 220], 0
	jmp	.LBB0_17
.LBB0_16:
	mov	dword ptr [rbp - 220], -1
.LBB0_17:
	mov	eax, dword ptr [rbp - 220]
	mov	dword ptr [rbp - 252], eax      # 4-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_19
# %bb.18:
	mov	eax, dword ptr [rbp - 252]      # 4-byte Reload
	add	rsp, 288
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_19:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperApplicationCreate, .Lfunc_end0-ViperApplicationCreate
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperEmptyLoopNoCall
	.type	__ViperEmptyLoopNoCall,@function
__ViperEmptyLoopNoCall:                 # @__ViperEmptyLoopNoCall
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	__ViperEmptyLoopNoCall, .Lfunc_end1-__ViperEmptyLoopNoCall
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperRenderLoopNoCall
	.type	__ViperRenderLoopNoCall,@function
__ViperRenderLoopNoCall:                # @__ViperRenderLoopNoCall
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
	mov	rax, qword ptr [rax + 96]
	mov	rdi, qword ptr [rax + 24]
	call	glfwWindowShouldClose@PLT
	cmp	eax, 0
	je	.LBB2_2
# %bb.1:
	mov	rcx, qword ptr [rbp - 8]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	xchg	qword ptr [rcx + 16], rax
.LBB2_2:
	call	glfwPollEvents@PLT
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end2:
	.size	__ViperRenderLoopNoCall, .Lfunc_end2-__ViperRenderLoopNoCall
	.cfi_endproc
                                        # -- End function
	.globl	ViperApplicationStart           # -- Begin function ViperApplicationStart
	.p2align	4, 0x90
	.type	ViperApplicationStart,@function
ViperApplicationStart:                  # @ViperApplicationStart
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	call	__ViperApplicationLoop
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end3:
	.size	ViperApplicationStart, .Lfunc_end3-ViperApplicationStart
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __ViperApplicationLoop
	.type	__ViperApplicationLoop,@function
__ViperApplicationLoop:                 # @__ViperApplicationLoop
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 8]
	cmp	qword ptr [rax + 16], 0
	je	.LBB4_3
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	call	glfwPollEvents@PLT
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 104]
	mov	rdi, qword ptr [rbp - 8]
	call	rax
	mov	rax, qword ptr [rip + __ViperRenderLoop]
	mov	rdi, qword ptr [rbp - 8]
	call	rax
	jmp	.LBB4_1
.LBB4_3:
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end4:
	.size	__ViperApplicationLoop, .Lfunc_end4-__ViperApplicationLoop
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Failed to create string"
	.size	.L.str, 24

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Failed to VulkanInit"
	.size	.L.str.1, 21

	.type	__ViperRenderLoop,@object       # @__ViperRenderLoop
	.data
	.p2align	3, 0x0
__ViperRenderLoop:
	.quad	__ViperEmptyLoopNoCall
	.size	__ViperRenderLoop, 8

	.type	.L.str.2,@object                # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"Failed to OpenGLInit"
	.size	.L.str.2, 21

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Graphics flag not set"
	.size	.L.str.3, 22

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __ViperEmptyLoopNoCall
	.addrsig_sym ViperStringCreate
	.addrsig_sym __ViperLogger
	.addrsig_sym ViperVulkanInit
	.addrsig_sym __ViperRenderLoopNoCall
	.addrsig_sym ViperOpenGLInit
	.addrsig_sym ViperRenderLoopOpenGL
	.addrsig_sym __ViperApplicationLoop
	.addrsig_sym glfwWindowShouldClose
	.addrsig_sym glfwPollEvents
	.addrsig_sym __stack_chk_fail
	.addrsig_sym __ViperRenderLoop
