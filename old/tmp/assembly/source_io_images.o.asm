	.text
	.intel_syntax noprefix
	.file	"images.c"
	.globl	ViperImageFindType              # -- Begin function ViperImageFindType
	.p2align	4, 0x90
	.type	ViperImageFindType,@function
ViperImageFindType:                     # @ViperImageFindType
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], -1
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 8]
	jne	.LBB0_2
# %bb.1:
	mov	qword ptr [rbp - 16], -2
	jmp	.LBB0_13
.LBB0_2:
	mov	rax, qword ptr [rbp - 8]
	movzx	eax, byte ptr [rax]
	mov	dword ptr [rbp - 20], eax       # 4-byte Spill
	sub	eax, 80
	je	.LBB0_3
	jmp	.LBB0_14
.LBB0_14:
	mov	eax, dword ptr [rbp - 20]       # 4-byte Reload
	sub	eax, 137
	je	.LBB0_9
	jmp	.LBB0_15
.LBB0_15:
	mov	eax, dword ptr [rbp - 20]       # 4-byte Reload
	sub	eax, 255
	je	.LBB0_6
	jmp	.LBB0_12
.LBB0_3:
	mov	rax, qword ptr [rbp - 8]
	movzx	eax, word ptr [rax]
	sub	eax, 13904
	setne	al
	movzx	eax, al
	cmp	eax, 0
	jne	.LBB0_5
# %bb.4:
	mov	qword ptr [rbp - 16], 2
.LBB0_5:
	jmp	.LBB0_12
.LBB0_6:
	mov	rdi, qword ptr [rbp - 8]
	lea	rsi, [rip + __jpg]
	mov	edx, 3
	call	memcmp@PLT
	cmp	eax, 0
	jne	.LBB0_8
# %bb.7:
	mov	qword ptr [rbp - 16], 1
.LBB0_8:
	jmp	.LBB0_12
.LBB0_9:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax]
	movabs	rcx, 727905341920923785
	sub	rax, rcx
	setne	al
	movzx	eax, al
	cmp	eax, 0
	jne	.LBB0_11
# %bb.10:
	mov	qword ptr [rbp - 16], 0
.LBB0_11:
	jmp	.LBB0_12
.LBB0_12:
	jmp	.LBB0_13
.LBB0_13:
	mov	rax, qword ptr [rbp - 16]
	add	rsp, 32
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ViperImageFindType, .Lfunc_end0-ViperImageFindType
	.cfi_endproc
                                        # -- End function
	.globl	ViperImageLoad                  # -- Begin function ViperImageLoad
	.p2align	4, 0x90
	.type	ViperImageLoad,@function
ViperImageLoad:                         # @ViperImageLoad
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 224
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 168], rdi
	mov	qword ptr [rbp - 176], 0
	mov	edi, 1
	mov	esi, 112
	call	calloc@PLT
	mov	qword ptr [rbp - 184], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 184]
	jne	.LBB1_2
# %bb.1:
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 7
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
	jmp	.LBB1_11
.LBB1_2:
	mov	rdi, qword ptr [rbp - 168]
	call	ViperLoadFile@PLT
	mov	rcx, rax
	mov	qword ptr [rbp - 176], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	jne	.LBB1_4
# %bb.3:
	mov	qword ptr [rbp - 56], 0
	mov	qword ptr [rbp - 48], 4
	mov	qword ptr [rbp - 40], 0
	mov	rsi, qword ptr [rbp - 168]
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
	jmp	.LBB1_11
.LBB1_4:
	mov	rax, qword ptr [rbp - 176]
	mov	rdi, qword ptr [rax + 24]
	call	ViperImageFindType
	mov	rcx, rax
	mov	qword ptr [rbp - 192], rcx      # 8-byte Spill
	test	rax, rax
	je	.LBB1_6
	jmp	.LBB1_15
.LBB1_15:
	mov	rax, qword ptr [rbp - 192]      # 8-byte Reload
	sub	rax, 1
	je	.LBB1_5
	jmp	.LBB1_16
.LBB1_16:
	mov	rax, qword ptr [rbp - 192]      # 8-byte Reload
	sub	rax, 2
	je	.LBB1_7
	jmp	.LBB1_8
.LBB1_5:
	mov	qword ptr [rbp - 80], 0
	mov	qword ptr [rbp - 72], 0
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
	jmp	.LBB1_8
.LBB1_6:
	mov	qword ptr [rbp - 104], 0
	mov	qword ptr [rbp - 96], 0
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
	jmp	.LBB1_8
.LBB1_7:
	mov	qword ptr [rbp - 128], 0
	mov	qword ptr [rbp - 120], 0
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
.LBB1_8:
	mov	rdi, qword ptr [rbp - 176]
	call	ViperUnloadFile@PLT
	mov	rcx, rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	je	.LBB1_10
# %bb.9:
	mov	qword ptr [rbp - 152], 0
	mov	qword ptr [rbp - 144], 3
	mov	qword ptr [rbp - 136], 0
	mov	rsi, qword ptr [rbp - 168]
	lea	rax, [rbp - 152]
	lea	rdi, [rip + .L.str.5]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB1_10:
	mov	rax, qword ptr [rbp - 184]
	mov	qword ptr [rbp - 160], rax
	jmp	.LBB1_12
.LBB1_11:
	mov	qword ptr [rbp - 160], 0
.LBB1_12:
	mov	rax, qword ptr [rbp - 160]
	mov	qword ptr [rbp - 200], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB1_14
# %bb.13:
	mov	rax, qword ptr [rbp - 200]      # 8-byte Reload
	add	rsp, 224
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_14:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	ViperImageLoad, .Lfunc_end1-ViperImageLoad
	.cfi_endproc
                                        # -- End function
	.type	__ppm,@object                   # @__ppm
	.section	.rodata,"a",@progbits
__ppm:
	.ascii	"P6"
	.size	__ppm, 2

	.type	__jpg,@object                   # @__jpg
__jpg:
	.ascii	"\377\330\377"
	.size	__jpg, 3

	.type	__png,@object                   # @__png
__png:
	.ascii	"\211PNG\r\n\032\n"
	.size	__png, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Failed allocate memory for ViperImage_t struct"
	.size	.L.str, 47

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Failed to find file [ %s ]"
	.size	.L.str.1, 27

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Found a jpg image"
	.size	.L.str.2, 18

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Found a png image"
	.size	.L.str.3, 18

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Found a ppm image"
	.size	.L.str.4, 18

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Failed to unload file [ %s ]"
	.size	.L.str.5, 29

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym ViperImageFindType
	.addrsig_sym memcmp
	.addrsig_sym calloc
	.addrsig_sym __ViperLogger
	.addrsig_sym ViperLoadFile
	.addrsig_sym ViperUnloadFile
	.addrsig_sym __stack_chk_fail
	.addrsig_sym __ppm
	.addrsig_sym __jpg
	.addrsig_sym __png
