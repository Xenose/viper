	.text
	.intel_syntax noprefix
	.file	"parser.c"
	.globl	ViperAddParserOption            # -- Begin function ViperAddParserOption
	.p2align	4, 0x90
	.type	ViperAddParserOption,@function
ViperAddParserOption:                   # @ViperAddParserOption
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 144
	mov	al, dl
	mov	rdx, qword ptr [rbp + 16]
	mov	rdx, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rdx
	mov	qword ptr [rbp - 72], rdi
	mov	qword ptr [rbp - 80], rsi
	mov	byte ptr [rbp - 81], al
	mov	dword ptr [rbp - 88], ecx
	mov	qword ptr [rbp - 96], r8
	mov	qword ptr [rbp - 104], r9
	mov	dword ptr [rbp - 108], 0
	lea	rax, [rip + __viperInternalParserData]
	mov	qword ptr [rbp - 120], rax
	mov	rax, qword ptr [rbp - 120]
	mov	rdi, qword ptr [rax + 4104]
	movsxd	rax, dword ptr [rax]
	shl	rax, 3
	lea	rsi, [rax + 2*rax]
	call	realloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 120]
	mov	qword ptr [rax + 4104], rcx
	mov	rax, qword ptr [rbp - 120]
	mov	rdi, qword ptr [rax + 4112]
	movsxd	rsi, dword ptr [rax]
	shl	rsi, 5
	call	realloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 120]
	mov	qword ptr [rax + 4112], rcx
	mov	rcx, qword ptr [rbp - 120]
	mov	rax, qword ptr [rcx + 4112]
	mov	ecx, dword ptr [rcx]
	dec	ecx
	movsxd	rcx, ecx
	shl	rcx, 5
	mov	rdx, qword ptr [rbp - 72]
	mov	qword ptr [rbp - 40], rdx
	mov	edx, dword ptr [rbp - 88]
	mov	dword ptr [rbp - 32], edx
	mov	rdx, qword ptr [rbp - 96]
	mov	qword ptr [rbp - 24], rdx
	movsx	edx, byte ptr [rbp - 81]
	mov	dword ptr [rbp - 16], edx
	movups	xmm0, xmmword ptr [rbp - 40]
	movups	xmm1, xmmword ptr [rbp - 24]
	movups	xmmword ptr [rax + rcx + 16], xmm1
	movups	xmmword ptr [rax + rcx], xmm0
	mov	rcx, qword ptr [rbp - 120]
	mov	rax, qword ptr [rcx + 4104]
	mov	ecx, dword ptr [rcx]
	dec	ecx
	movsxd	rcx, ecx
	lea	rcx, [rcx + 2*rcx]
	mov	qword ptr [rbp - 64], 0
	mov	rdx, qword ptr [rbp - 104]
	mov	qword ptr [rbp - 56], rdx
	mov	rdx, qword ptr [rbp + 16]
	mov	qword ptr [rbp - 48], rdx
	mov	rdx, qword ptr [rbp - 48]
	mov	qword ptr [rax + 8*rcx + 16], rdx
	movups	xmm0, xmmword ptr [rbp - 64]
	movups	xmmword ptr [rax + 8*rcx], xmm0
	mov	rdi, qword ptr [rbp - 120]
	add	rdi, 4
	call	strlen@PLT
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 108], eax
	mov	rax, qword ptr [rbp - 120]
	movsxd	rcx, dword ptr [rbp - 108]
	lea	rax, [rax + rcx + 4]
	mov	qword ptr [rbp - 136], rax      # 8-byte Spill
	mov	rdi, qword ptr [rbp - 80]
	mov	qword ptr [rbp - 128], rdi      # 8-byte Spill
	call	strlen@PLT
	mov	rdi, qword ptr [rbp - 136]      # 8-byte Reload
	mov	rsi, qword ptr [rbp - 128]      # 8-byte Reload
	mov	rdx, rax
	call	memmove@PLT
	mov	rax, qword ptr [rbp - 120]
	mov	ecx, dword ptr [rax]
	inc	ecx
	mov	dword ptr [rax], ecx
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_2
# %bb.1:
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	movsx	eax, al
	add	rsp, 144
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperAddParserOption, .Lfunc_end0-ViperAddParserOption
	.cfi_endproc
                                        # -- End function
	.globl	ViperParseCommands              # -- Begin function ViperParseCommands
	.p2align	4, 0x90
	.type	ViperParseCommands,@function
ViperParseCommands:                     # @ViperParseCommands
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 160
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	dword ptr [rbp - 96], edi
	mov	qword ptr [rbp - 104], rsi
	mov	qword ptr [rbp - 112], rdx
	lea	rax, [rip + __viperInternalParserData]
	mov	qword ptr [rbp - 120], rax
	mov	dword ptr [rbp - 12], 0
	mov	dword ptr [rbp - 124], 0
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rip + __viperInternalParserData+4112]
	jne	.LBB1_2
# %bb.1:
	mov	qword ptr [rbp - 40], 0
	mov	qword ptr [rbp - 32], 4
	mov	qword ptr [rbp - 24], 0
	lea	rax, [rbp - 40]
	lea	rdi, [rip + .L.str]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	byte ptr [rbp - 89], -1
	jmp	.LBB1_21
.LBB1_2:
	mov	rax, qword ptr [rbp - 120]
	mov	rdi, qword ptr [rax + 4112]
	mov	rcx, qword ptr [rbp - 120]
	mov	eax, dword ptr [rcx]
	add	eax, 1
	mov	dword ptr [rcx], eax
	movsxd	rsi, eax
	shl	rsi, 5
	call	realloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 120]
	mov	qword ptr [rax + 4112], rcx
	mov	rax, qword ptr [rbp - 120]
	mov	rdi, qword ptr [rax + 4112]
	mov	rax, qword ptr [rbp - 120]
	mov	eax, dword ptr [rax]
	sub	eax, 1
	cdqe
	shl	rax, 5
	add	rdi, rax
	xor	esi, esi
	mov	edx, 32
	call	memset@PLT
.LBB1_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_11 Depth 2
	mov	edi, dword ptr [rbp - 96]
	mov	rsi, qword ptr [rbp - 104]
	mov	rdx, qword ptr [rbp - 120]
	add	rdx, 4
	mov	rax, qword ptr [rbp - 120]
	mov	rcx, qword ptr [rax + 4112]
	lea	r8, [rbp - 12]
	call	getopt_long@PLT
	mov	dword ptr [rbp - 124], eax
	mov	eax, 4294967295
	cmp	eax, dword ptr [rbp - 124]
	jne	.LBB1_5
# %bb.4:
	jmp	.LBB1_20
.LBB1_5:                                #   in Loop: Header=BB1_3 Depth=1
	xor	eax, eax
	cmp	eax, dword ptr [rbp - 124]
	jne	.LBB1_9
# %bb.6:                                #   in Loop: Header=BB1_3 Depth=1
	mov	rax, qword ptr [rbp - 120]
	mov	rcx, qword ptr [rax + 4104]
	movsxd	rax, dword ptr [rbp - 12]
	imul	rax, rax, 24
	add	rcx, rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 8]
	jne	.LBB1_8
# %bb.7:                                #   in Loop: Header=BB1_3 Depth=1
	mov	qword ptr [rbp - 64], 0
	mov	qword ptr [rbp - 56], 4
	mov	qword ptr [rbp - 48], 0
	mov	esi, dword ptr [rbp - 12]
	lea	rax, [rbp - 64]
	lea	rdi, [rip + .L.str.1]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB1_19
.LBB1_8:                                #   in Loop: Header=BB1_3 Depth=1
	mov	rax, qword ptr [rbp - 120]
	mov	rax, qword ptr [rax + 4104]
	movsxd	rcx, dword ptr [rbp - 12]
	imul	rcx, rcx, 24
	add	rax, rcx
	mov	rax, qword ptr [rax + 8]
	mov	rdi, qword ptr [rbp - 112]
	xor	ecx, ecx
	mov	esi, ecx
	call	rax
	jmp	.LBB1_19
.LBB1_9:                                #   in Loop: Header=BB1_3 Depth=1
	jmp	.LBB1_10
.LBB1_10:                               #   in Loop: Header=BB1_3 Depth=1
	mov	dword ptr [rbp - 128], 0
.LBB1_11:                               #   Parent Loop BB1_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	eax, dword ptr [rbp - 128]
	mov	rcx, qword ptr [rbp - 120]
	cmp	eax, dword ptr [rcx]
	jge	.LBB1_18
# %bb.12:                               #   in Loop: Header=BB1_11 Depth=2
	mov	eax, dword ptr [rbp - 124]
	mov	rcx, qword ptr [rbp - 120]
	mov	rcx, qword ptr [rcx + 4112]
	movsxd	rdx, dword ptr [rbp - 128]
	shl	rdx, 5
	add	rcx, rdx
	cmp	eax, dword ptr [rcx + 24]
	jne	.LBB1_16
# %bb.13:                               #   in Loop: Header=BB1_11 Depth=2
	mov	rax, qword ptr [rbp - 120]
	mov	rcx, qword ptr [rax + 4104]
	movsxd	rax, dword ptr [rbp - 128]
	imul	rax, rax, 24
	add	rcx, rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 8]
	jne	.LBB1_15
# %bb.14:                               #   in Loop: Header=BB1_11 Depth=2
	mov	qword ptr [rbp - 88], 0
	mov	qword ptr [rbp - 80], 4
	mov	qword ptr [rbp - 72], 0
	mov	esi, dword ptr [rbp - 12]
	lea	rax, [rbp - 88]
	lea	rdi, [rip + .L.str.1]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB1_17
.LBB1_15:                               #   in Loop: Header=BB1_11 Depth=2
	mov	rax, qword ptr [rbp - 120]
	mov	rax, qword ptr [rax + 4104]
	movsxd	rcx, dword ptr [rbp - 128]
	imul	rcx, rcx, 24
	add	rax, rcx
	mov	rax, qword ptr [rax + 8]
	mov	rdi, qword ptr [rbp - 112]
	xor	ecx, ecx
	mov	esi, ecx
	call	rax
.LBB1_16:                               #   in Loop: Header=BB1_11 Depth=2
	jmp	.LBB1_17
.LBB1_17:                               #   in Loop: Header=BB1_11 Depth=2
	mov	eax, dword ptr [rbp - 128]
	add	eax, 1
	mov	dword ptr [rbp - 128], eax
	jmp	.LBB1_11
.LBB1_18:                               #   in Loop: Header=BB1_3 Depth=1
	jmp	.LBB1_19
.LBB1_19:                               #   in Loop: Header=BB1_3 Depth=1
	mov	al, 1
	test	al, 1
	jne	.LBB1_3
	jmp	.LBB1_20
.LBB1_20:
	mov	rdi, qword ptr [rip + __viperInternalParserData+4112]
	call	free@PLT
	mov	qword ptr [rip + __viperInternalParserData+4112], 0
	mov	byte ptr [rbp - 89], 0
.LBB1_21:
	mov	al, byte ptr [rbp - 89]
	mov	byte ptr [rbp - 129], al        # 1-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB1_23
# %bb.22:
	mov	al, byte ptr [rbp - 129]        # 1-byte Reload
	movsx	eax, al
	add	rsp, 160
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_23:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	ViperParseCommands, .Lfunc_end1-ViperParseCommands
	.cfi_endproc
                                        # -- End function
	.type	__viperInternalParserData,@object # @__viperInternalParserData
	.data
	.p2align	3, 0x0
__viperInternalParserData:
	.long	1                               # 0x1
	.zero	4096
	.zero	4
	.quad	0
	.quad	0
	.size	__viperInternalParserData, 4120

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"This function is allowed one call only!"
	.size	.L.str, 40

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Function at index %i is NULL"
	.size	.L.str.1, 29

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym realloc
	.addrsig_sym strlen
	.addrsig_sym __ViperLogger
	.addrsig_sym getopt_long
	.addrsig_sym free
	.addrsig_sym __stack_chk_fail
	.addrsig_sym __viperInternalParserData
