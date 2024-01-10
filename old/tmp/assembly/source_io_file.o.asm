	.text
	.intel_syntax noprefix
	.file	"file.c"
	.globl	ViperLoadFile                   # -- Begin function ViperLoadFile
	.p2align	4, 0x90
	.type	ViperLoadFile,@function
ViperLoadFile:                          # @ViperLoadFile
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 176
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 120], rdi
	mov	dword ptr [rbp - 124], -1
	mov	qword ptr [rbp - 136], 0
	mov	rdi, qword ptr [rbp - 120]
	xor	esi, esi
	mov	al, 0
	call	open@PLT
	mov	ecx, eax
	mov	dword ptr [rbp - 124], ecx
	mov	eax, 4294967295
	cmp	eax, ecx
	jne	.LBB0_2
# %bb.1:
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 4
	mov	qword ptr [rbp - 16], 0
	mov	rax, qword ptr [rbp - 120]
	mov	qword ptr [rbp - 144], rax      # 8-byte Spill
	call	__errno_location@PLT
	mov	rsi, qword ptr [rbp - 144]      # 8-byte Reload
	mov	edx, dword ptr [rax]
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
	jmp	.LBB0_12
.LBB0_2:
	mov	edi, 1
	mov	esi, 32
	call	calloc@PLT
	mov	rcx, rax
	mov	qword ptr [rbp - 136], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	jne	.LBB0_4
# %bb.3:
	mov	qword ptr [rbp - 56], 0
	mov	qword ptr [rbp - 48], 4
	mov	qword ptr [rbp - 40], 0
	call	__errno_location@PLT
	mov	esi, dword ptr [rax]
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
	jmp	.LBB0_12
.LBB0_4:
	mov	edi, dword ptr [rbp - 124]
	xor	eax, eax
	mov	esi, eax
	mov	edx, 2
	call	lseek@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 136]
	mov	qword ptr [rax + 16], rcx
	mov	rcx, qword ptr [rbp - 136]
	mov	rax, -1
	cmp	rax, qword ptr [rcx + 16]
	jne	.LBB0_6
# %bb.5:
	mov	qword ptr [rbp - 80], 0
	mov	qword ptr [rbp - 72], 4
	mov	qword ptr [rbp - 64], 0
	call	__errno_location@PLT
	mov	esi, dword ptr [rax]
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
	jmp	.LBB0_12
.LBB0_6:
	mov	rax, qword ptr [rbp - 136]
	mov	rsi, qword ptr [rax + 16]
	mov	r8d, dword ptr [rbp - 124]
	xor	eax, eax
	mov	r9d, eax
	mov	ecx, 1
	mov	rdi, r9
	mov	edx, ecx
	call	mmap@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 136]
	mov	qword ptr [rax + 24], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	jne	.LBB0_8
# %bb.7:
	jmp	.LBB0_12
.LBB0_8:
	mov	edi, dword ptr [rbp - 124]
	call	close@PLT
	mov	ecx, eax
	mov	eax, 4294967295
	cmp	eax, ecx
	jne	.LBB0_10
# %bb.9:
	mov	qword ptr [rbp - 104], 0
	mov	qword ptr [rbp - 96], 7
	mov	qword ptr [rbp - 88], 0
	mov	rsi, qword ptr [rbp - 120]
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
	jmp	.LBB0_11
.LBB0_10:
	jmp	.LBB0_11
.LBB0_11:
	mov	rax, qword ptr [rbp - 136]
	mov	qword ptr [rbp - 112], rax
	jmp	.LBB0_13
.LBB0_12:
	mov	qword ptr [rbp - 112], 0
.LBB0_13:
	mov	rax, qword ptr [rbp - 112]
	mov	qword ptr [rbp - 152], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_15
# %bb.14:
	mov	rax, qword ptr [rbp - 152]      # 8-byte Reload
	add	rsp, 176
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_15:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperLoadFile, .Lfunc_end0-ViperLoadFile
	.cfi_endproc
                                        # -- End function
	.globl	ViperUnloadFile                 # -- Begin function ViperUnloadFile
	.p2align	4, 0x90
	.type	ViperUnloadFile,@function
ViperUnloadFile:                        # @ViperUnloadFile
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 80
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 40], rdi
	mov	rax, qword ptr [rbp - 40]
	mov	rdi, qword ptr [rax + 24]
	mov	rax, qword ptr [rbp - 40]
	mov	rsi, qword ptr [rax + 16]
	call	munmap@PLT
	cmp	eax, 0
	je	.LBB1_2
# %bb.1:
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 5
	mov	qword ptr [rbp - 16], 0
	call	__errno_location@PLT
	mov	esi, dword ptr [rax]
	lea	rax, [rbp - 32]
	lea	rdi, [rip + .L.str.4]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB1_3
.LBB1_2:
	mov	rdi, qword ptr [rbp - 40]
	call	free@PLT
	mov	qword ptr [rbp - 40], 0
.LBB1_3:
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB1_5
# %bb.4:
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	add	rsp, 80
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_5:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	ViperUnloadFile, .Lfunc_end1-ViperUnloadFile
	.cfi_endproc
                                        # -- End function
	.globl	ViperBufferFlushToFile          # -- Begin function ViperBufferFlushToFile
	.p2align	4, 0x90
	.type	ViperBufferFlushToFile,@function
ViperBufferFlushToFile:                 # @ViperBufferFlushToFile
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 128
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 72], rdi
	mov	qword ptr [rbp - 80], rsi
	mov	rdi, qword ptr [rbp - 72]
	mov	esi, 193
	mov	edx, 384
	mov	al, 0
	call	open@PLT
	mov	dword ptr [rbp - 84], eax
	mov	qword ptr [rbp - 96], 0
	mov	eax, 4294967295
	cmp	eax, dword ptr [rbp - 84]
	jne	.LBB2_2
# %bb.1:
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 4
	mov	qword ptr [rbp - 16], 0
	lea	rax, [rbp - 32]
	lea	rdi, [rip + .L.str.5]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB2_5
.LBB2_2:
	mov	edi, dword ptr [rbp - 84]
	mov	rax, qword ptr [rbp - 80]
	mov	rsi, qword ptr [rax + 16]
	mov	rax, qword ptr [rbp - 80]
	mov	rdx, qword ptr [rax + 8]
	call	write@PLT
	mov	qword ptr [rbp - 96], rax
	mov	rax, qword ptr [rbp - 96]
	mov	rcx, qword ptr [rbp - 80]
	cmp	rax, qword ptr [rcx + 8]
	je	.LBB2_4
# %bb.3:
	mov	qword ptr [rbp - 56], 0
	mov	qword ptr [rbp - 48], 4
	mov	qword ptr [rbp - 40], 0
	call	__errno_location@PLT
	mov	esi, dword ptr [rax]
	lea	rax, [rbp - 56]
	lea	rdi, [rip + .L.str.6]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB2_5
.LBB2_4:
	mov	byte ptr [rbp - 57], 0
	jmp	.LBB2_6
.LBB2_5:
	mov	byte ptr [rbp - 57], -1
.LBB2_6:
	mov	al, byte ptr [rbp - 57]
	mov	byte ptr [rbp - 97], al         # 1-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB2_8
# %bb.7:
	mov	al, byte ptr [rbp - 97]         # 1-byte Reload
	movsx	eax, al
	add	rsp, 128
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB2_8:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end2:
	.size	ViperBufferFlushToFile, .Lfunc_end2-ViperBufferFlushToFile
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Failed to open file [ %s ] error [ %n ]"
	.size	.L.str, 40

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Failed to allocate memory for File_t with error [ %n ]"
	.size	.L.str.1, 55

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Failed to seek end for memory with error [ %n ]"
	.size	.L.str.2, 48

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Failed to close fd for [ %s ]"
	.size	.L.str.3, 30

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Failed to munmap file [ %n ]"
	.size	.L.str.4, 29

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Failed to create file"
	.size	.L.str.5, 22

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Failed to write all the data to file [ %n ]"
	.size	.L.str.6, 44

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym open
	.addrsig_sym __ViperLogger
	.addrsig_sym __errno_location
	.addrsig_sym calloc
	.addrsig_sym lseek
	.addrsig_sym mmap
	.addrsig_sym close
	.addrsig_sym munmap
	.addrsig_sym free
	.addrsig_sym write
	.addrsig_sym __stack_chk_fail
