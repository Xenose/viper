	.text
	.intel_syntax noprefix
	.file	"shader.c"
	.globl	ViperDeleteShadersOpenGL        # -- Begin function ViperDeleteShadersOpenGL
	.p2align	4, 0x90
	.type	ViperDeleteShadersOpenGL,@function
ViperDeleteShadersOpenGL:               # @ViperDeleteShadersOpenGL
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
	mov	qword ptr [rbp - 24], rdx
	mov	qword ptr [rbp - 32], rcx
	mov	qword ptr [rbp - 40], r8
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 8]
	je	.LBB0_4
# %bb.1:
	mov	rcx, qword ptr [rbp - 8]
	xor	eax, eax
	cmp	eax, dword ptr [rcx]
	jg	.LBB0_3
# %bb.2:
	mov	rax, qword ptr [rip + __glewDeleteShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 8]
	mov	edi, dword ptr [rcx]
	call	rax
	mov	rax, qword ptr [rbp - 8]
	mov	dword ptr [rax], -1
.LBB0_3:
	jmp	.LBB0_4
.LBB0_4:
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 16]
	je	.LBB0_8
# %bb.5:
	mov	rcx, qword ptr [rbp - 16]
	xor	eax, eax
	cmp	eax, dword ptr [rcx]
	jg	.LBB0_7
# %bb.6:
	mov	rax, qword ptr [rip + __glewDeleteShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 16]
	mov	edi, dword ptr [rcx]
	call	rax
	mov	rax, qword ptr [rbp - 16]
	mov	dword ptr [rax], -1
.LBB0_7:
	jmp	.LBB0_8
.LBB0_8:
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 24]
	je	.LBB0_12
# %bb.9:
	mov	rcx, qword ptr [rbp - 24]
	xor	eax, eax
	cmp	eax, dword ptr [rcx]
	jg	.LBB0_11
# %bb.10:
	mov	rax, qword ptr [rip + __glewDeleteShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 24]
	mov	edi, dword ptr [rcx]
	call	rax
	mov	rax, qword ptr [rbp - 24]
	mov	dword ptr [rax], -1
.LBB0_11:
	jmp	.LBB0_12
.LBB0_12:
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 32]
	je	.LBB0_16
# %bb.13:
	mov	rcx, qword ptr [rbp - 32]
	xor	eax, eax
	cmp	eax, dword ptr [rcx]
	jg	.LBB0_15
# %bb.14:
	mov	rax, qword ptr [rip + __glewDeleteShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 32]
	mov	edi, dword ptr [rcx]
	call	rax
	mov	rax, qword ptr [rbp - 32]
	mov	dword ptr [rax], -1
.LBB0_15:
	jmp	.LBB0_16
.LBB0_16:
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 40]
	je	.LBB0_20
# %bb.17:
	mov	rcx, qword ptr [rbp - 40]
	xor	eax, eax
	cmp	eax, dword ptr [rcx]
	jg	.LBB0_19
# %bb.18:
	mov	rax, qword ptr [rip + __glewDeleteShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 40]
	mov	edi, dword ptr [rcx]
	call	rax
	mov	rax, qword ptr [rbp - 40]
	mov	dword ptr [rax], -1
.LBB0_19:
	jmp	.LBB0_20
.LBB0_20:
	add	rsp, 48
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperDeleteShadersOpenGL, .Lfunc_end0-ViperDeleteShadersOpenGL
	.cfi_endproc
                                        # -- End function
	.globl	ViperCreateShaderOpenGL         # -- Begin function ViperCreateShaderOpenGL
	.p2align	4, 0x90
	.type	ViperCreateShaderOpenGL,@function
ViperCreateShaderOpenGL:                # @ViperCreateShaderOpenGL
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 1184
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	dword ptr [rbp - 1136], edi
	mov	qword ptr [rbp - 1144], rsi
	mov	dword ptr [rbp - 1044], 0
	mov	rax, qword ptr [rip + __glewCreateShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1136]
	call	rax
	mov	dword ptr [rbp - 1156], eax
	mov	rdi, qword ptr [rbp - 1144]
	call	ViperLoadFile@PLT
	mov	qword ptr [rbp - 1152], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 1152]
	jne	.LBB1_2
# %bb.1:
	mov	qword ptr [rbp - 1072], 0
	mov	qword ptr [rbp - 1064], 4
	mov	qword ptr [rbp - 1056], 0
	mov	rsi, qword ptr [rbp - 1144]
	lea	rax, [rbp - 1072]
	lea	rdi, [rip + .L.str]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB1_6
.LBB1_2:
	mov	rax, qword ptr [rip + __glewShaderSource@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1156]
	mov	rdx, qword ptr [rbp - 1152]
	add	rdx, 8
	add	rdx, 16
	mov	esi, 1
	xor	ecx, ecx
                                        # kill: def $rcx killed $ecx
	call	rax
	mov	rax, qword ptr [rip + __glewCompileShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1156]
	call	rax
	mov	rax, qword ptr [rip + __glewGetShaderiv@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1156]
	mov	esi, 35713
	lea	rdx, [rbp - 1044]
	call	rax
	mov	eax, 1
	cmp	eax, dword ptr [rbp - 1044]
	je	.LBB1_4
# %bb.3:
	mov	dword ptr [rbp - 1076], 0
	lea	rdi, [rbp - 1040]
	xor	esi, esi
	mov	edx, 1024
	call	memset@PLT
	mov	rax, qword ptr [rip + __glewGetShaderInfoLog@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1156]
	lea	rcx, [rbp - 1040]
	mov	esi, 1023
	lea	rdx, [rbp - 1076]
	call	rax
	mov	qword ptr [rbp - 1104], 0
	mov	qword ptr [rbp - 1096], 4
	mov	qword ptr [rbp - 1088], 0
	mov	rsi, qword ptr [rbp - 1144]
	lea	rdx, [rbp - 1040]
	mov	rax, qword ptr [rbp - 1152]
	mov	rcx, qword ptr [rax + 24]
	lea	rax, [rbp - 1104]
	lea	rdi, [rip + .L.str.1]
	mov	r8, qword ptr [rax]
	mov	qword ptr [rsp], r8
	mov	r8, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], r8
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	qword ptr [rbp - 1128], 0
	mov	qword ptr [rbp - 1120], 0
	mov	qword ptr [rbp - 1112], 0
	mov	rsi, qword ptr [rbp - 1144]
	mov	rax, qword ptr [rbp - 1152]
	mov	rdx, qword ptr [rax + 24]
	lea	rax, [rbp - 1128]
	lea	rdi, [rip + .L.str.2]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB1_5
.LBB1_4:
	mov	rdi, qword ptr [rbp - 1152]
	call	ViperUnloadFile@PLT
	mov	eax, dword ptr [rbp - 1156]
                                        # kill: def $al killed $al killed $eax
	mov	byte ptr [rbp - 1129], al
	jmp	.LBB1_7
.LBB1_5:
	mov	rdi, qword ptr [rbp - 1152]
	call	ViperUnloadFile@PLT
.LBB1_6:
	mov	byte ptr [rbp - 1129], -1
.LBB1_7:
	mov	al, byte ptr [rbp - 1129]
	mov	byte ptr [rbp - 1157], al       # 1-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB1_9
# %bb.8:
	mov	al, byte ptr [rbp - 1157]       # 1-byte Reload
	movsx	eax, al
	add	rsp, 1184
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_9:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	ViperCreateShaderOpenGL, .Lfunc_end1-ViperCreateShaderOpenGL
	.cfi_endproc
                                        # -- End function
	.globl	ViperLoadShadersOpenGL          # -- Begin function ViperLoadShadersOpenGL
	.p2align	4, 0x90
	.type	ViperLoadShadersOpenGL,@function
ViperLoadShadersOpenGL:                 # @ViperLoadShadersOpenGL
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 1264
	lea	rax, [rbp + 16]
	mov	qword ptr [rbp - 1232], rax     # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 1216], rdi
	mov	dword ptr [rbp - 1220], -1
	mov	dword ptr [rbp - 1044], -1
	mov	dword ptr [rbp - 1048], -1
	mov	dword ptr [rbp - 1052], -1
	mov	dword ptr [rbp - 1056], -1
	mov	dword ptr [rbp - 1060], -1
	mov	dword ptr [rbp - 1064], -1
	lea	rdi, [rbp - 1096]
	xor	esi, esi
	mov	edx, 32
	call	memset@PLT
	mov	rax, qword ptr [rip + __glewCreateProgram@GOTPCREL]
	call	qword ptr [rax]
	mov	rcx, qword ptr [rbp - 1232]     # 8-byte Reload
	mov	dword ptr [rbp - 1220], eax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 40]
	je	.LBB2_2
# %bb.1:
	mov	rax, qword ptr [rbp - 1232]     # 8-byte Reload
	mov	rsi, qword ptr [rax + 40]
	mov	edi, 37305
	call	ViperCreateShaderOpenGL
	movsx	eax, al
	mov	dword ptr [rbp - 1048], eax
	mov	rax, qword ptr [rip + __glewAttachShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1220]
	mov	esi, dword ptr [rbp - 1048]
	call	rax
	jmp	.LBB2_14
.LBB2_2:
	mov	rcx, qword ptr [rbp - 1232]     # 8-byte Reload
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 8]
	je	.LBB2_4
# %bb.3:
	mov	rcx, qword ptr [rbp - 1232]     # 8-byte Reload
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 32]
	jne	.LBB2_5
.LBB2_4:
	mov	qword ptr [rbp - 1120], 0
	mov	qword ptr [rbp - 1112], 4
	mov	qword ptr [rbp - 1104], 0
	lea	rax, [rbp - 1120]
	lea	rdi, [rip + .L.str.3]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB2_18
.LBB2_5:
	mov	rax, qword ptr [rbp - 1232]     # 8-byte Reload
	mov	rsi, qword ptr [rax + 32]
	mov	edi, 35632
	call	ViperCreateShaderOpenGL
	mov	cl, al
	mov	rax, qword ptr [rbp - 1232]     # 8-byte Reload
	movsx	ecx, cl
	mov	dword ptr [rbp - 1052], ecx
	mov	rsi, qword ptr [rax + 8]
	mov	edi, 35633
	call	ViperCreateShaderOpenGL
	movsx	eax, al
	mov	dword ptr [rbp - 1064], eax
	mov	eax, 4294967295
	cmp	eax, dword ptr [rbp - 1052]
	je	.LBB2_7
# %bb.6:
	mov	eax, 4294967295
	cmp	eax, dword ptr [rbp - 1064]
	jne	.LBB2_8
.LBB2_7:
	jmp	.LBB2_18
.LBB2_8:
	mov	rax, qword ptr [rip + __glewAttachShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1220]
	mov	esi, dword ptr [rbp - 1064]
	call	rax
	mov	rax, qword ptr [rip + __glewAttachShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1220]
	mov	esi, dword ptr [rbp - 1052]
	call	rax
	mov	rcx, qword ptr [rbp - 1232]     # 8-byte Reload
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 16]
	je	.LBB2_13
# %bb.9:
	mov	rax, qword ptr [rbp - 1232]     # 8-byte Reload
	mov	rsi, qword ptr [rax + 16]
	mov	edi, 36313
	call	ViperCreateShaderOpenGL
	movsx	eax, al
	mov	dword ptr [rbp - 1056], eax
	mov	eax, 4294967295
	cmp	eax, dword ptr [rbp - 1056]
	jne	.LBB2_11
# %bb.10:
	mov	qword ptr [rbp - 1144], 0
	mov	qword ptr [rbp - 1136], 3
	mov	qword ptr [rbp - 1128], 0
	lea	rax, [rbp - 1144]
	lea	rdi, [rip + .L.str.4]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB2_12
.LBB2_11:
	mov	rax, qword ptr [rip + __glewAttachShader@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1220]
	mov	esi, dword ptr [rbp - 1056]
	call	rax
.LBB2_12:
	jmp	.LBB2_13
.LBB2_13:
	jmp	.LBB2_14
.LBB2_14:
	mov	rax, qword ptr [rip + __glewLinkProgram@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1220]
	call	rax
	mov	rax, qword ptr [rip + __glewGetProgramiv@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1220]
	mov	esi, 35714
	lea	rdx, [rbp - 1044]
	call	rax
	mov	eax, 1
	cmp	eax, dword ptr [rbp - 1044]
	je	.LBB2_16
# %bb.15:
	mov	dword ptr [rbp - 1148], 0
	lea	rdi, [rbp - 1040]
	xor	esi, esi
	mov	edx, 1024
	call	memset@PLT
	mov	rax, qword ptr [rip + __glewGetProgramInfoLog@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	edi, dword ptr [rbp - 1220]
	lea	rcx, [rbp - 1040]
	mov	esi, 1023
	lea	rdx, [rbp - 1148]
	call	rax
	mov	qword ptr [rbp - 1176], 0
	mov	qword ptr [rbp - 1168], 4
	mov	qword ptr [rbp - 1160], 0
	lea	rsi, [rbp - 1040]
	lea	rax, [rbp - 1176]
	lea	rdi, [rip + .L.str.5]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB2_18
.LBB2_16:
	mov	qword ptr [rbp - 1200], 0
	mov	qword ptr [rbp - 1192], 0
	mov	qword ptr [rbp - 1184], 0
	lea	rax, [rbp - 1200]
	lea	rdi, [rip + .L.str.6]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
# %bb.17:
	lea	rdi, [rbp - 1048]
	lea	rsi, [rbp - 1052]
	lea	rdx, [rbp - 1056]
	lea	rcx, [rbp - 1060]
	lea	r8, [rbp - 1064]
	call	ViperDeleteShadersOpenGL
	mov	ecx, dword ptr [rbp - 1220]
	mov	rax, qword ptr [rbp - 1216]
	mov	dword ptr [rax + 12], ecx
	mov	byte ptr [rbp - 1201], 0
	jmp	.LBB2_19
.LBB2_18:
	lea	rdi, [rbp - 1048]
	lea	rsi, [rbp - 1052]
	lea	rdx, [rbp - 1056]
	lea	rcx, [rbp - 1060]
	lea	r8, [rbp - 1064]
	call	ViperDeleteShadersOpenGL
	mov	byte ptr [rbp - 1201], -1
.LBB2_19:
	mov	al, byte ptr [rbp - 1201]
	mov	byte ptr [rbp - 1233], al       # 1-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB2_21
# %bb.20:
	mov	al, byte ptr [rbp - 1233]       # 1-byte Reload
	movsx	eax, al
	add	rsp, 1264
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB2_21:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end2:
	.size	ViperLoadShadersOpenGL, .Lfunc_end2-ViperLoadShadersOpenGL
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Failed to load soruce file [ %s ]"
	.size	.L.str, 34

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"File [ %s ] %s"
	.size	.L.str.1, 15

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"[ %s SOURCE ]\n\n%s"
	.size	.L.str.2, 18

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Vertex or Fragment shader is NULL, unable to load shader"
	.size	.L.str.3, 57

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Failed to compile geometric shader, continuing..."
	.size	.L.str.4, 50

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"%s"
	.size	.L.str.5, 3

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Compiled program"
	.size	.L.str.6, 17

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ViperDeleteShadersOpenGL
	.addrsig_sym ViperCreateShaderOpenGL
	.addrsig_sym ViperLoadFile
	.addrsig_sym __ViperLogger
	.addrsig_sym ViperUnloadFile
	.addrsig_sym __stack_chk_fail
	.addrsig_sym __glewDeleteShader
	.addrsig_sym __glewCreateShader
	.addrsig_sym __glewShaderSource
	.addrsig_sym __glewCompileShader
	.addrsig_sym __glewGetShaderiv
	.addrsig_sym __glewGetShaderInfoLog
	.addrsig_sym __glewCreateProgram
	.addrsig_sym __glewAttachShader
	.addrsig_sym __glewLinkProgram
	.addrsig_sym __glewGetProgramiv
	.addrsig_sym __glewGetProgramInfoLog
