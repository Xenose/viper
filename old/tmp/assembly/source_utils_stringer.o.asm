	.text
	.intel_syntax noprefix
	.file	"stringer.c"
	.globl	ViperStringCreate               # -- Begin function ViperStringCreate
	.p2align	4, 0x90
	.type	ViperStringCreate,@function
ViperStringCreate:                      # @ViperStringCreate
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 96
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 48], rdi
	mov	qword ptr [rbp - 56], rsi
	mov	qword ptr [rbp - 64], 0
	mov	rcx, qword ptr [rbp - 48]
	mov	eax, 14
	xchg	qword ptr [rcx], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 56]
	jne	.LBB0_2
# %bb.1:
	jmp	.LBB0_5
.LBB0_2:
	mov	rdi, qword ptr [rbp - 56]
	call	strlen@PLT
	mov	qword ptr [rbp - 64], rax
	mov	rdi, qword ptr [rbp - 64]
	mov	esi, 1
	call	calloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 48]
	mov	qword ptr [rax + 16], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	jne	.LBB0_4
# %bb.3:
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 4
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
	jmp	.LBB0_6
.LBB0_4:
	mov	rax, qword ptr [rbp - 48]
	mov	rdi, qword ptr [rax + 16]
	mov	rsi, qword ptr [rbp - 56]
	mov	rdx, qword ptr [rbp - 64]
	call	memcpy@PLT
	mov	rcx, qword ptr [rbp - 64]
	mov	rax, qword ptr [rbp - 48]
	mov	qword ptr [rax + 8], rcx
.LBB0_5:
	mov	rax, qword ptr [rbp - 64]
	mov	qword ptr [rbp - 40], rax
	jmp	.LBB0_7
.LBB0_6:
	mov	qword ptr [rbp - 40], -1
.LBB0_7:
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 72], rax       # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_9
# %bb.8:
	mov	rax, qword ptr [rbp - 72]       # 8-byte Reload
	add	rsp, 96
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_9:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperStringCreate, .Lfunc_end0-ViperStringCreate
	.cfi_endproc
                                        # -- End function
	.globl	ViperStringDelete               # -- Begin function ViperStringDelete
	.p2align	4, 0x90
	.type	ViperStringDelete,@function
ViperStringDelete:                      # @ViperStringDelete
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
	mov	rdi, qword ptr [rax + 16]
	call	free@PLT
	mov	rdi, qword ptr [rbp - 8]
	call	free@PLT
	xor	eax, eax
                                        # kill: def $rax killed $eax
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	ViperStringDelete, .Lfunc_end1-ViperStringDelete
	.cfi_endproc
                                        # -- End function
	.globl	ViperStringAppend               # -- Begin function ViperStringAppend
	.p2align	4, 0x90
	.type	ViperStringAppend,@function
ViperStringAppend:                      # @ViperStringAppend
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
                                        # kill: def $rax killed $eax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end2:
	.size	ViperStringAppend, .Lfunc_end2-ViperStringAppend
	.cfi_endproc
                                        # -- End function
	.globl	ViperFindNextChar               # -- Begin function ViperFindNextChar
	.p2align	4, 0x90
	.type	ViperFindNextChar,@function
ViperFindNextChar:                      # @ViperFindNextChar
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 8]
	jne	.LBB3_2
# %bb.1:
	jmp	.LBB3_6
.LBB3_2:
	jmp	.LBB3_3
.LBB3_3:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 8]
	movsx	eax, byte ptr [rax]
	mov	dword ptr [rbp - 12], eax       # 4-byte Spill
	add	eax, -9
	sub	eax, 2
	jb	.LBB3_4
	jmp	.LBB3_7
.LBB3_7:                                #   in Loop: Header=BB3_3 Depth=1
	mov	eax, dword ptr [rbp - 12]       # 4-byte Reload
	sub	eax, 13
	je	.LBB3_4
	jmp	.LBB3_8
.LBB3_8:                                #   in Loop: Header=BB3_3 Depth=1
	mov	eax, dword ptr [rbp - 12]       # 4-byte Reload
	sub	eax, 32
	jne	.LBB3_5
	jmp	.LBB3_4
.LBB3_4:                                #   in Loop: Header=BB3_3 Depth=1
	mov	rax, qword ptr [rbp - 8]
	add	rax, 1
	mov	qword ptr [rbp - 8], rax
	jmp	.LBB3_3
.LBB3_5:
	jmp	.LBB3_6
.LBB3_6:
	mov	rax, qword ptr [rbp - 8]
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end3:
	.size	ViperFindNextChar, .Lfunc_end3-ViperFindNextChar
	.cfi_endproc
                                        # -- End function
	.globl	ViperFindNonNumeric             # -- Begin function ViperFindNonNumeric
	.p2align	4, 0x90
	.type	ViperFindNonNumeric,@function
ViperFindNonNumeric:                    # @ViperFindNonNumeric
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
	call	__ctype_b_loc@PLT
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 8]
	movsx	ecx, byte ptr [rcx]
	movsxd	rcx, ecx
	movzx	eax, word ptr [rax + 2*rcx]
	and	eax, 2048
	cmp	eax, 0
	je	.LBB4_3
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	mov	rax, qword ptr [rbp - 8]
	add	rax, 1
	mov	qword ptr [rbp - 8], rax
	jmp	.LBB4_1
.LBB4_3:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end4:
	.size	ViperFindNonNumeric, .Lfunc_end4-ViperFindNonNumeric
	.cfi_endproc
                                        # -- End function
	.globl	ViperSkipLine                   # -- Begin function ViperSkipLine
	.p2align	4, 0x90
	.type	ViperSkipLine,@function
ViperSkipLine:                          # @ViperSkipLine
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
.LBB5_1:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 8]
	movsx	edx, byte ptr [rax]
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	mov	ecx, 10
	cmp	ecx, edx
	mov	byte ptr [rbp - 9], al          # 1-byte Spill
	je	.LBB5_3
# %bb.2:                                #   in Loop: Header=BB5_1 Depth=1
	mov	rax, qword ptr [rbp - 8]
	movsx	ecx, byte ptr [rax]
	xor	eax, eax
	cmp	eax, ecx
	setne	al
	mov	byte ptr [rbp - 9], al          # 1-byte Spill
.LBB5_3:                                #   in Loop: Header=BB5_1 Depth=1
	mov	al, byte ptr [rbp - 9]          # 1-byte Reload
	test	al, 1
	jne	.LBB5_4
	jmp	.LBB5_5
.LBB5_4:                                #   in Loop: Header=BB5_1 Depth=1
	mov	rax, qword ptr [rbp - 8]
	add	rax, 1
	mov	qword ptr [rbp - 8], rax
	jmp	.LBB5_1
.LBB5_5:
	mov	rax, qword ptr [rbp - 8]
	add	rax, 1
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end5:
	.size	ViperSkipLine, .Lfunc_end5-ViperSkipLine
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Failed to allocate string in StringCreate"
	.size	.L.str, 42

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym strlen
	.addrsig_sym calloc
	.addrsig_sym __ViperLogger
	.addrsig_sym free
	.addrsig_sym __ctype_b_loc
	.addrsig_sym __stack_chk_fail
