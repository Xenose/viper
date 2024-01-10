	.text
	.intel_syntax noprefix
	.file	"init.c"
	.globl	ViperOpenGLInit                 # -- Begin function ViperOpenGLInit
	.p2align	4, 0x90
	.type	ViperOpenGLInit,@function
ViperOpenGLInit:                        # @ViperOpenGLInit
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 192
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 144], rdi
	mov	qword ptr [rbp - 152], rsi
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 0
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
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 152]
	jne	.LBB0_14
# %bb.1:
	mov	rcx, qword ptr [rbp - 144]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 96]
	jne	.LBB0_5
# %bb.2:
	mov	edi, 1
	mov	esi, 56
	call	calloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 144]
	mov	qword ptr [rax + 96], rcx
	mov	rcx, qword ptr [rbp - 144]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 96]
	jne	.LBB0_4
# %bb.3:
	mov	qword ptr [rbp - 56], 0
	mov	qword ptr [rbp - 48], 4
	mov	qword ptr [rbp - 40], 0
	lea	rax, [rbp - 56]
	lea	rdi, [rip + .L.str.1]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_19
.LBB0_4:
	jmp	.LBB0_5
.LBB0_5:
	mov	rax, qword ptr [rbp - 144]
	mov	rax, qword ptr [rax + 96]
	mov	qword ptr [rbp - 152], rax
	mov	rcx, qword ptr [rbp - 152]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx]
	jne	.LBB0_7
# %bb.6:
	mov	rcx, qword ptr [rbp - 152]
	mov	eax, 20
	xchg	qword ptr [rcx], rax
.LBB0_7:
	mov	rcx, qword ptr [rbp - 144]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 40]
	je	.LBB0_9
# %bb.8:
	mov	rcx, qword ptr [rbp - 144]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 32]
	jne	.LBB0_10
.LBB0_9:
	mov	qword ptr [rbp - 80], 0
	mov	qword ptr [rbp - 72], 4
	mov	qword ptr [rbp - 64], 0
	lea	rax, [rbp - 80]
	lea	rdi, [rip + .L.str.2]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	qword ptr [rbp - 136], -1
	jmp	.LBB0_20
.LBB0_10:
	mov	rcx, qword ptr [rbp - 152]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 40]
	je	.LBB0_12
# %bb.11:
	mov	rcx, qword ptr [rbp - 152]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 48]
	jne	.LBB0_13
.LBB0_12:
	mov	rax, qword ptr [rbp - 152]
	mov	qword ptr [rax + 40], 1920
	mov	rax, qword ptr [rbp - 152]
	mov	qword ptr [rax + 48], 1080
.LBB0_13:
	jmp	.LBB0_14
.LBB0_14:
	call	glfwInit@PLT
	cmp	eax, 0
	jne	.LBB0_16
# %bb.15:
	mov	qword ptr [rbp - 104], 0
	mov	qword ptr [rbp - 96], 4
	mov	qword ptr [rbp - 88], 0
	lea	rax, [rbp - 104]
	lea	rdi, [rip + .L.str.3]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_19
.LBB0_16:
	mov	rax, qword ptr [rbp - 152]
	mov	rax, qword ptr [rax + 40]
	mov	edi, eax
	mov	rax, qword ptr [rbp - 152]
	mov	rax, qword ptr [rax + 48]
	mov	esi, eax
	mov	rax, qword ptr [rbp - 144]
	mov	rdx, qword ptr [rax + 40]
	xor	eax, eax
	mov	r8d, eax
	mov	rcx, r8
	call	glfwCreateWindow@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 152]
	mov	qword ptr [rax + 24], rcx
	mov	rcx, qword ptr [rbp - 152]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 24]
	jne	.LBB0_18
# %bb.17:
	mov	qword ptr [rbp - 128], 0
	mov	qword ptr [rbp - 120], 4
	mov	qword ptr [rbp - 112], 0
	lea	rax, [rbp - 128]
	lea	rdi, [rip + .L.str.4]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_19
.LBB0_18:
	mov	qword ptr [rbp - 136], 0
	jmp	.LBB0_20
.LBB0_19:
	mov	qword ptr [rbp - 136], -1
.LBB0_20:
	mov	rax, qword ptr [rbp - 136]
	mov	qword ptr [rbp - 160], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_22
# %bb.21:
	mov	rax, qword ptr [rbp - 160]      # 8-byte Reload
	add	rsp, 192
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_22:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperOpenGLInit, .Lfunc_end0-ViperOpenGLInit
	.cfi_endproc
                                        # -- End function
	.globl	ViperRenderLoopOpenGL           # -- Begin function ViperRenderLoopOpenGL
	.p2align	4, 0x90
	.type	ViperRenderLoopOpenGL,@function
ViperRenderLoopOpenGL:                  # @ViperRenderLoopOpenGL
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
	je	.LBB1_2
# %bb.1:
	mov	rcx, qword ptr [rbp - 8]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	xchg	qword ptr [rcx + 16], rax
.LBB1_2:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 96]
	mov	rdi, qword ptr [rax + 24]
	call	glfwSwapBuffers@PLT
	mov	edi, 16384
	call	glClear@PLT
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	ViperRenderLoopOpenGL, .Lfunc_end1-ViperRenderLoopOpenGL
	.cfi_endproc
                                        # -- End function
	.globl	ViperLoadModelOpenGL            # -- Begin function ViperLoadModelOpenGL
	.p2align	4, 0x90
	.type	ViperLoadModelOpenGL,@function
ViperLoadModelOpenGL:                   # @ViperLoadModelOpenGL
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	movsx	eax, al
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end2:
	.size	ViperLoadModelOpenGL, .Lfunc_end2-ViperLoadModelOpenGL
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Starting OpenGL"
	.size	.L.str, 16

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Failed to allocate Vulkan_t"
	.size	.L.str.1, 28

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Application_t name not set"
	.size	.L.str.2, 27

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"glfwInit failed"
	.size	.L.str.3, 16

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Failed to create OpenGL Window"
	.size	.L.str.4, 31

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __ViperLogger
	.addrsig_sym calloc
	.addrsig_sym glfwInit
	.addrsig_sym glfwCreateWindow
	.addrsig_sym glfwWindowShouldClose
	.addrsig_sym glfwSwapBuffers
	.addrsig_sym glClear
	.addrsig_sym __stack_chk_fail
