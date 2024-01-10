	.text
	.intel_syntax noprefix
	.file	"create.c"
	.globl	ViperCreate                     # -- Begin function ViperCreate
	.p2align	4, 0x90
	.type	ViperCreate,@function
ViperCreate:                            # @ViperCreate
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 384
	test	al, al
	je	.LBB0_28
# %bb.27:
	movaps	xmmword ptr [rbp - 208], xmm0
	movaps	xmmword ptr [rbp - 192], xmm1
	movaps	xmmword ptr [rbp - 176], xmm2
	movaps	xmmword ptr [rbp - 160], xmm3
	movaps	xmmword ptr [rbp - 144], xmm4
	movaps	xmmword ptr [rbp - 128], xmm5
	movaps	xmmword ptr [rbp - 112], xmm6
	movaps	xmmword ptr [rbp - 96], xmm7
.LBB0_28:
	mov	qword ptr [rbp - 216], r9
	mov	qword ptr [rbp - 224], r8
	mov	qword ptr [rbp - 232], rcx
	mov	qword ptr [rbp - 240], rdx
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 48], rdi
	mov	qword ptr [rbp - 56], rsi
	mov	dword ptr [rbp - 60], -1
	mov	rax, qword ptr [rbp - 56]
	mov	qword ptr [rbp - 72], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 48]
	jne	.LBB0_2
# %bb.1:
	mov	rax, qword ptr [rbp - 72]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 264], rax      # 8-byte Spill
	jmp	.LBB0_3
.LBB0_2:
	mov	rax, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 264], rax      # 8-byte Spill
.LBB0_3:
	mov	rax, qword ptr [rbp - 264]      # 8-byte Reload
	mov	qword ptr [rbp - 48], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 48]
	jne	.LBB0_5
# %bb.4:
	jmp	.LBB0_21
.LBB0_5:
	lea	rax, [rbp - 32]
	lea	rcx, [rbp - 256]
	mov	qword ptr [rax + 16], rcx
	lea	rcx, [rbp + 16]
	mov	qword ptr [rax + 8], rcx
	mov	dword ptr [rax + 4], 48
	mov	dword ptr [rax], 16
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 56]
	jne	.LBB0_7
# %bb.6:
	mov	rdi, qword ptr [rbp - 48]
	call	ViperGetStructureSize@PLT
	mov	rsi, rax
	mov	edi, 1
	call	calloc@PLT
	mov	qword ptr [rbp - 72], rax
	mov	qword ptr [rbp - 56], rax
.LBB0_7:
	mov	rax, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 272], rax      # 8-byte Spill
	sub	rax, 14
	je	.LBB0_8
	jmp	.LBB0_25
.LBB0_25:
	mov	rax, qword ptr [rbp - 272]      # 8-byte Reload
	sub	rax, 15
	je	.LBB0_12
	jmp	.LBB0_26
.LBB0_26:
	mov	rax, qword ptr [rbp - 272]      # 8-byte Reload
	sub	rax, 21
	je	.LBB0_16
	jmp	.LBB0_20
.LBB0_8:
	mov	rax, qword ptr [rbp - 56]
	mov	qword ptr [rbp - 296], rax      # 8-byte Spill
	lea	rax, [rbp - 32]
	mov	qword ptr [rbp - 288], rax      # 8-byte Spill
	mov	eax, dword ptr [rbp - 32]
	mov	dword ptr [rbp - 276], eax      # 4-byte Spill
	cmp	eax, 40
	ja	.LBB0_10
# %bb.9:
	mov	rcx, qword ptr [rbp - 288]      # 8-byte Reload
	mov	edx, dword ptr [rbp - 276]      # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 304], rax      # 8-byte Spill
	jmp	.LBB0_11
.LBB0_10:
	mov	rcx, qword ptr [rbp - 288]      # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 304], rax      # 8-byte Spill
.LBB0_11:
	mov	rdi, qword ptr [rbp - 296]      # 8-byte Reload
	mov	rax, qword ptr [rbp - 304]      # 8-byte Reload
	mov	rsi, qword ptr [rax]
	call	ViperStringCreate@PLT
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 60], eax
	jmp	.LBB0_20
.LBB0_12:
	mov	rax, qword ptr [rbp - 56]
	mov	qword ptr [rbp - 328], rax      # 8-byte Spill
	lea	rax, [rbp - 32]
	mov	qword ptr [rbp - 320], rax      # 8-byte Spill
	mov	eax, dword ptr [rbp - 32]
	mov	dword ptr [rbp - 308], eax      # 4-byte Spill
	cmp	eax, 40
	ja	.LBB0_14
# %bb.13:
	mov	rcx, qword ptr [rbp - 320]      # 8-byte Reload
	mov	edx, dword ptr [rbp - 308]      # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 336], rax      # 8-byte Spill
	jmp	.LBB0_15
.LBB0_14:
	mov	rcx, qword ptr [rbp - 320]      # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 336], rax      # 8-byte Spill
.LBB0_15:
	mov	rdi, qword ptr [rbp - 328]      # 8-byte Reload
	mov	rax, qword ptr [rbp - 336]      # 8-byte Reload
	mov	rsi, qword ptr [rax]
	call	ViperSocketCreate@PLT
	movsx	eax, al
	mov	dword ptr [rbp - 60], eax
	jmp	.LBB0_20
.LBB0_16:
	mov	rax, qword ptr [rbp - 56]
	mov	qword ptr [rbp - 360], rax      # 8-byte Spill
	lea	rax, [rbp - 32]
	mov	qword ptr [rbp - 352], rax      # 8-byte Spill
	mov	eax, dword ptr [rbp - 32]
	mov	dword ptr [rbp - 340], eax      # 4-byte Spill
	cmp	eax, 40
	ja	.LBB0_18
# %bb.17:
	mov	rcx, qword ptr [rbp - 352]      # 8-byte Reload
	mov	edx, dword ptr [rbp - 340]      # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 368], rax      # 8-byte Spill
	jmp	.LBB0_19
.LBB0_18:
	mov	rcx, qword ptr [rbp - 352]      # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 368], rax      # 8-byte Spill
.LBB0_19:
	mov	rdi, qword ptr [rbp - 360]      # 8-byte Reload
	mov	rax, qword ptr [rbp - 368]      # 8-byte Reload
	mov	rsi, qword ptr [rax]
	call	ViperApplicationCreate@PLT
	mov	dword ptr [rbp - 60], eax
.LBB0_20:
	lea	rax, [rbp - 32]
	mov	rax, qword ptr [rbp - 56]
	mov	qword ptr [rbp - 40], rax
	jmp	.LBB0_22
.LBB0_21:
	mov	qword ptr [rbp - 40], 0
.LBB0_22:
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 376], rax      # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_24
# %bb.23:
	mov	rax, qword ptr [rbp - 376]      # 8-byte Reload
	add	rsp, 384
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_24:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperCreate, .Lfunc_end0-ViperCreate
	.cfi_endproc
                                        # -- End function
	.globl	ViperDelete                     # -- Begin function ViperDelete
	.p2align	4, 0x90
	.type	ViperDelete,@function
ViperDelete:                            # @ViperDelete
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 24]
	sub	rax, 14
	jne	.LBB1_2
	jmp	.LBB1_1
.LBB1_1:
	mov	rdi, qword ptr [rbp - 8]
	call	ViperStringDelete@PLT
	jmp	.LBB1_3
.LBB1_2:
	jmp	.LBB1_4
.LBB1_3:
	jmp	.LBB1_4
.LBB1_4:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 32
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	ViperDelete, .Lfunc_end1-ViperDelete
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym calloc
	.addrsig_sym ViperGetStructureSize
	.addrsig_sym ViperStringCreate
	.addrsig_sym ViperSocketCreate
	.addrsig_sym ViperApplicationCreate
	.addrsig_sym ViperStringDelete
	.addrsig_sym __stack_chk_fail
