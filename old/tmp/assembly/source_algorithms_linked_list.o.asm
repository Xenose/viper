	.text
	.intel_syntax noprefix
	.file	"linked_list.c"
	.globl	__ViperLinkedListAddItemVA      # -- Begin function __ViperLinkedListAddItemVA
	.p2align	4, 0x90
	.type	__ViperLinkedListAddItemVA,@function
__ViperLinkedListAddItemVA:             # @__ViperLinkedListAddItemVA
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 496
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 240], rdi
	mov	qword ptr [rbp - 248], rsi
	mov	qword ptr [rbp - 256], rdx
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 32]
	mov	qword ptr [rbp - 264], rax
	mov	qword ptr [rbp - 272], 0
	mov	rdi, qword ptr [rbp - 248]
	mov	esi, 32
	call	calloc@PLT
	mov	rcx, rax
	mov	qword ptr [rbp - 272], rcx
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, rcx
	jne	.LBB0_2
# %bb.1:
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
	jmp	.LBB0_62
.LBB0_2:
	mov	rcx, qword ptr [rbp - 264]
	mov	rax, qword ptr [rbp - 272]
	mov	qword ptr [rax + 16], rcx
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 24]
	je	.LBB0_5
# %bb.3:
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 32]
	je	.LBB0_5
# %bb.4:
	mov	rcx, qword ptr [rbp - 272]
	mov	rax, qword ptr [rbp - 264]
	mov	qword ptr [rax + 8], rcx
.LBB0_5:
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 280], rax
	mov	rax, qword ptr [rbp - 280]
	add	rax, -2
	mov	qword ptr [rbp - 352], rax      # 8-byte Spill
	sub	rax, 19
	ja	.LBB0_58
# %bb.66:
	mov	rax, qword ptr [rbp - 352]      # 8-byte Reload
	lea	rcx, [rip + .LJTI0_0]
	movsxd	rax, dword ptr [rcx + 4*rax]
	add	rax, rcx
	jmp	rax
.LBB0_6:
	mov	rdi, qword ptr [rbp - 248]
	mov	esi, 24
	call	calloc@PLT
	mov	qword ptr [rbp - 288], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 288]
	jne	.LBB0_8
# %bb.7:
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
	jmp	.LBB0_62
.LBB0_8:
	mov	qword ptr [rbp - 296], 0
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 296]
	cmp	rax, qword ptr [rbp - 248]
	jge	.LBB0_19
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=1
	mov	rcx, qword ptr [rbp - 288]
	mov	eax, 2
	xchg	qword ptr [rcx], rax
	mov	rax, qword ptr [rbp - 256]
	mov	qword ptr [rbp - 368], rax      # 8-byte Spill
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 356], eax      # 4-byte Spill
	cmp	eax, 40
	ja	.LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_9 Depth=1
	mov	rcx, qword ptr [rbp - 368]      # 8-byte Reload
	mov	edx, dword ptr [rbp - 356]      # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 376], rax      # 8-byte Spill
	jmp	.LBB0_13
.LBB0_12:                               #   in Loop: Header=BB0_9 Depth=1
	mov	rcx, qword ptr [rbp - 368]      # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 376], rax      # 8-byte Spill
.LBB0_13:                               #   in Loop: Header=BB0_9 Depth=1
	mov	rax, qword ptr [rbp - 376]      # 8-byte Reload
	mov	rcx, qword ptr [rax]
	mov	rax, qword ptr [rbp - 288]
	mov	qword ptr [rax + 16], rcx
	mov	rcx, qword ptr [rbp - 288]
	mov	rax, qword ptr [rbp - 272]
	mov	rdx, qword ptr [rbp - 296]
	shl	rdx, 5
	add	rax, rdx
	mov	qword ptr [rax + 24], rcx
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 24]
	je	.LBB0_16
# %bb.14:                               #   in Loop: Header=BB0_9 Depth=1
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 32]
	je	.LBB0_16
# %bb.15:                               #   in Loop: Header=BB0_9 Depth=1
	mov	rcx, qword ptr [rbp - 272]
	mov	rax, qword ptr [rbp - 296]
	shl	rax, 5
	add	rcx, rax
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 32]
	mov	qword ptr [rax + 8], rcx
	jmp	.LBB0_17
.LBB0_16:                               #   in Loop: Header=BB0_9 Depth=1
	mov	qword ptr [rbp - 80], 0
	mov	qword ptr [rbp - 72], 0
	mov	qword ptr [rbp - 64], 0
	lea	rax, [rbp - 80]
	lea	rdi, [rip + .L.str.2]
	lea	rsi, [rip + .L.str.3]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB0_17:                               #   in Loop: Header=BB0_9 Depth=1
	mov	rax, qword ptr [rbp - 240]
	mov	rcx, qword ptr [rax + 32]
	mov	rax, qword ptr [rbp - 272]
	mov	rdx, qword ptr [rbp - 296]
	shl	rdx, 5
	add	rax, rdx
	mov	qword ptr [rax + 16], rcx
	mov	rcx, qword ptr [rbp - 272]
	mov	rax, qword ptr [rbp - 296]
	shl	rax, 5
	add	rcx, rax
	mov	rax, qword ptr [rbp - 240]
	mov	qword ptr [rax + 32], rcx
# %bb.18:                               #   in Loop: Header=BB0_9 Depth=1
	mov	rax, qword ptr [rbp - 296]
	add	rax, 1
	mov	qword ptr [rbp - 296], rax
	jmp	.LBB0_9
.LBB0_19:
	jmp	.LBB0_59
.LBB0_20:
	mov	rdi, qword ptr [rbp - 248]
	mov	esi, 16
	call	calloc@PLT
	mov	qword ptr [rbp - 304], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 304]
	jne	.LBB0_22
# %bb.21:
	mov	qword ptr [rbp - 104], 0
	mov	qword ptr [rbp - 96], 4
	mov	qword ptr [rbp - 88], 0
	lea	rax, [rbp - 104]
	lea	rdi, [rip + .L.str.1]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_62
.LBB0_22:
	mov	qword ptr [rbp - 312], 0
.LBB0_23:                               # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 312]
	cmp	rax, qword ptr [rbp - 248]
	jge	.LBB0_33
# %bb.24:                               #   in Loop: Header=BB0_23 Depth=1
	mov	rcx, qword ptr [rbp - 304]
	mov	eax, 3
	xchg	qword ptr [rcx], rax
	mov	rax, qword ptr [rbp - 256]
	mov	qword ptr [rbp - 400], rax      # 8-byte Spill
	mov	rcx, rax
	add	rcx, 4
	mov	qword ptr [rbp - 392], rcx      # 8-byte Spill
	mov	eax, dword ptr [rax + 4]
	mov	dword ptr [rbp - 380], eax      # 4-byte Spill
	cmp	eax, 160
	ja	.LBB0_26
# %bb.25:                               #   in Loop: Header=BB0_23 Depth=1
	mov	rcx, qword ptr [rbp - 392]      # 8-byte Reload
	mov	edx, dword ptr [rbp - 380]      # 4-byte Reload
	mov	rsi, qword ptr [rbp - 400]      # 8-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rsi + 16]
	add	edx, 16
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 408], rax      # 8-byte Spill
	jmp	.LBB0_27
.LBB0_26:                               #   in Loop: Header=BB0_23 Depth=1
	mov	rcx, qword ptr [rbp - 400]      # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 408], rax      # 8-byte Spill
.LBB0_27:                               #   in Loop: Header=BB0_23 Depth=1
	mov	rax, qword ptr [rbp - 408]      # 8-byte Reload
	movsd	xmm0, qword ptr [rax]           # xmm0 = mem[0],zero
	cvtsd2ss	xmm0, xmm0
	mov	rax, qword ptr [rbp - 304]
	movss	dword ptr [rax + 12], xmm0
	mov	rcx, qword ptr [rbp - 304]
	mov	rax, qword ptr [rbp - 272]
	mov	rdx, qword ptr [rbp - 312]
	shl	rdx, 5
	add	rax, rdx
	mov	qword ptr [rax + 24], rcx
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 24]
	je	.LBB0_30
# %bb.28:                               #   in Loop: Header=BB0_23 Depth=1
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 32]
	je	.LBB0_30
# %bb.29:                               #   in Loop: Header=BB0_23 Depth=1
	mov	rcx, qword ptr [rbp - 272]
	mov	rax, qword ptr [rbp - 312]
	shl	rax, 5
	add	rcx, rax
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 32]
	mov	qword ptr [rax + 8], rcx
	jmp	.LBB0_31
.LBB0_30:                               #   in Loop: Header=BB0_23 Depth=1
	mov	qword ptr [rbp - 128], 0
	mov	qword ptr [rbp - 120], 0
	mov	qword ptr [rbp - 112], 0
	lea	rax, [rbp - 128]
	lea	rdi, [rip + .L.str.2]
	lea	rsi, [rip + .L.str.4]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB0_31:                               #   in Loop: Header=BB0_23 Depth=1
	mov	rax, qword ptr [rbp - 240]
	mov	rcx, qword ptr [rax + 32]
	mov	rax, qword ptr [rbp - 272]
	mov	rdx, qword ptr [rbp - 312]
	shl	rdx, 5
	add	rax, rdx
	mov	qword ptr [rax + 16], rcx
	mov	rcx, qword ptr [rbp - 272]
	mov	rax, qword ptr [rbp - 312]
	shl	rax, 5
	add	rcx, rax
	mov	rax, qword ptr [rbp - 240]
	mov	qword ptr [rax + 32], rcx
# %bb.32:                               #   in Loop: Header=BB0_23 Depth=1
	mov	rax, qword ptr [rbp - 312]
	add	rax, 1
	mov	qword ptr [rbp - 312], rax
	jmp	.LBB0_23
.LBB0_33:
	jmp	.LBB0_59
.LBB0_34:
	mov	qword ptr [rbp - 320], 0
.LBB0_35:                               # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 320]
	cmp	rax, qword ptr [rbp - 248]
	jge	.LBB0_45
# %bb.36:                               #   in Loop: Header=BB0_35 Depth=1
	mov	rax, qword ptr [rbp - 256]
	mov	qword ptr [rbp - 424], rax      # 8-byte Spill
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 412], eax      # 4-byte Spill
	cmp	eax, 40
	ja	.LBB0_38
# %bb.37:                               #   in Loop: Header=BB0_35 Depth=1
	mov	rcx, qword ptr [rbp - 424]      # 8-byte Reload
	mov	edx, dword ptr [rbp - 412]      # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 432], rax      # 8-byte Spill
	jmp	.LBB0_39
.LBB0_38:                               #   in Loop: Header=BB0_35 Depth=1
	mov	rcx, qword ptr [rbp - 424]      # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 432], rax      # 8-byte Spill
.LBB0_39:                               #   in Loop: Header=BB0_35 Depth=1
	mov	rax, qword ptr [rbp - 432]      # 8-byte Reload
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 328], rax
	mov	edi, 112
	call	malloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 272]
	mov	rdx, qword ptr [rbp - 320]
	shl	rdx, 5
	add	rax, rdx
	mov	qword ptr [rax + 24], rcx
	mov	rax, qword ptr [rbp - 272]
	mov	rcx, qword ptr [rbp - 320]
	shl	rcx, 5
	add	rax, rcx
	mov	rdi, qword ptr [rax + 24]
	mov	rsi, qword ptr [rbp - 328]
	mov	edx, 112
	call	memcpy@PLT
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 24]
	je	.LBB0_42
# %bb.40:                               #   in Loop: Header=BB0_35 Depth=1
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 32]
	je	.LBB0_42
# %bb.41:                               #   in Loop: Header=BB0_35 Depth=1
	mov	rcx, qword ptr [rbp - 272]
	mov	rax, qword ptr [rbp - 320]
	shl	rax, 5
	add	rcx, rax
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 32]
	mov	qword ptr [rax + 8], rcx
	jmp	.LBB0_43
.LBB0_42:                               #   in Loop: Header=BB0_35 Depth=1
	mov	qword ptr [rbp - 152], 0
	mov	qword ptr [rbp - 144], 0
	mov	qword ptr [rbp - 136], 0
	lea	rax, [rbp - 152]
	lea	rdi, [rip + .L.str.2]
	lea	rsi, [rip + .L.str.5]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB0_43:                               #   in Loop: Header=BB0_35 Depth=1
	mov	rax, qword ptr [rbp - 240]
	mov	rcx, qword ptr [rax + 32]
	mov	rax, qword ptr [rbp - 272]
	mov	rdx, qword ptr [rbp - 320]
	shl	rdx, 5
	add	rax, rdx
	mov	qword ptr [rax + 16], rcx
	mov	rcx, qword ptr [rbp - 272]
	mov	rax, qword ptr [rbp - 320]
	shl	rax, 5
	add	rcx, rax
	mov	rax, qword ptr [rbp - 240]
	mov	qword ptr [rax + 32], rcx
# %bb.44:                               #   in Loop: Header=BB0_35 Depth=1
	mov	rax, qword ptr [rbp - 320]
	add	rax, 1
	mov	qword ptr [rbp - 320], rax
	jmp	.LBB0_35
.LBB0_45:
	jmp	.LBB0_59
.LBB0_46:
	mov	qword ptr [rbp - 336], 0
.LBB0_47:                               # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 336]
	cmp	rax, qword ptr [rbp - 248]
	jge	.LBB0_57
# %bb.48:                               #   in Loop: Header=BB0_47 Depth=1
	mov	rax, qword ptr [rbp - 256]
	mov	qword ptr [rbp - 448], rax      # 8-byte Spill
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 436], eax      # 4-byte Spill
	cmp	eax, 40
	ja	.LBB0_50
# %bb.49:                               #   in Loop: Header=BB0_47 Depth=1
	mov	rcx, qword ptr [rbp - 448]      # 8-byte Reload
	mov	edx, dword ptr [rbp - 436]      # 4-byte Reload
	movsxd	rax, edx
	add	rax, qword ptr [rcx + 16]
	add	edx, 8
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 456], rax      # 8-byte Spill
	jmp	.LBB0_51
.LBB0_50:                               #   in Loop: Header=BB0_47 Depth=1
	mov	rcx, qword ptr [rbp - 448]      # 8-byte Reload
	mov	rax, qword ptr [rcx + 8]
	mov	rdx, rax
	add	rdx, 8
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rbp - 456], rax      # 8-byte Spill
.LBB0_51:                               #   in Loop: Header=BB0_47 Depth=1
	mov	rax, qword ptr [rbp - 456]      # 8-byte Reload
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 344], rax
	mov	edi, 272
	call	malloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 272]
	mov	rdx, qword ptr [rbp - 336]
	shl	rdx, 5
	add	rax, rdx
	mov	qword ptr [rax + 24], rcx
	mov	rax, qword ptr [rbp - 272]
	mov	rcx, qword ptr [rbp - 336]
	shl	rcx, 5
	add	rax, rcx
	mov	rdi, qword ptr [rax + 24]
	mov	rsi, qword ptr [rbp - 344]
	mov	edx, 272
	call	memcpy@PLT
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 24]
	je	.LBB0_54
# %bb.52:                               #   in Loop: Header=BB0_47 Depth=1
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 32]
	je	.LBB0_54
# %bb.53:                               #   in Loop: Header=BB0_47 Depth=1
	mov	rcx, qword ptr [rbp - 272]
	mov	rax, qword ptr [rbp - 336]
	shl	rax, 5
	add	rcx, rax
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 32]
	mov	qword ptr [rax + 8], rcx
	jmp	.LBB0_55
.LBB0_54:                               #   in Loop: Header=BB0_47 Depth=1
	mov	qword ptr [rbp - 176], 0
	mov	qword ptr [rbp - 168], 0
	mov	qword ptr [rbp - 160], 0
	lea	rax, [rbp - 176]
	lea	rdi, [rip + .L.str.2]
	lea	rsi, [rip + .L.str.6]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB0_55:                               #   in Loop: Header=BB0_47 Depth=1
	mov	rax, qword ptr [rbp - 240]
	mov	rcx, qword ptr [rax + 32]
	mov	rax, qword ptr [rbp - 272]
	mov	rdx, qword ptr [rbp - 336]
	shl	rdx, 5
	add	rax, rdx
	mov	qword ptr [rax + 16], rcx
	mov	rcx, qword ptr [rbp - 272]
	mov	rax, qword ptr [rbp - 336]
	shl	rax, 5
	add	rcx, rax
	mov	rax, qword ptr [rbp - 240]
	mov	qword ptr [rax + 32], rcx
# %bb.56:                               #   in Loop: Header=BB0_47 Depth=1
	mov	rax, qword ptr [rbp - 336]
	add	rax, 1
	mov	qword ptr [rbp - 336], rax
	jmp	.LBB0_47
.LBB0_57:
	jmp	.LBB0_59
.LBB0_58:
	mov	qword ptr [rbp - 200], 0
	mov	qword ptr [rbp - 192], 4
	mov	qword ptr [rbp - 184], 0
	lea	rax, [rbp - 200]
	lea	rdi, [rip + .L.str.7]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB0_59:
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 24]
	jne	.LBB0_61
# %bb.60:
	mov	rcx, qword ptr [rbp - 272]
	mov	rax, qword ptr [rbp - 240]
	mov	qword ptr [rax + 24], rcx
.LBB0_61:
	mov	qword ptr [rbp - 224], 0
	mov	qword ptr [rbp - 216], 0
	mov	qword ptr [rbp - 208], 0
	lea	rax, [rbp - 224]
	lea	rdi, [rip + .L.str.8]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	dword ptr [rbp - 228], 0
	jmp	.LBB0_63
.LBB0_62:
	mov	dword ptr [rbp - 228], -1
.LBB0_63:
	mov	eax, dword ptr [rbp - 228]
	mov	dword ptr [rbp - 460], eax      # 4-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_65
# %bb.64:
	mov	eax, dword ptr [rbp - 460]      # 4-byte Reload
	add	rsp, 496
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_65:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	__ViperLinkedListAddItemVA, .Lfunc_end0-__ViperLinkedListAddItemVA
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0_0:
	.long	.LBB0_6-.LJTI0_0
	.long	.LBB0_20-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_46-.LJTI0_0
	.long	.LBB0_58-.LJTI0_0
	.long	.LBB0_34-.LJTI0_0
                                        # -- End function
	.text
	.globl	ViperLinkedListInit             # -- Begin function ViperLinkedListInit
	.p2align	4, 0x90
	.type	ViperLinkedListInit,@function
ViperLinkedListInit:                    # @ViperLinkedListInit
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 256
	mov	qword ptr [rbp - 248], rdi      # 8-byte Spill
	mov	qword ptr [rbp - 256], rdi      # 8-byte Spill
	test	al, al
	je	.LBB1_4
# %bb.3:
	movaps	xmmword ptr [rbp - 192], xmm0
	movaps	xmmword ptr [rbp - 176], xmm1
	movaps	xmmword ptr [rbp - 160], xmm2
	movaps	xmmword ptr [rbp - 144], xmm3
	movaps	xmmword ptr [rbp - 128], xmm4
	movaps	xmmword ptr [rbp - 112], xmm5
	movaps	xmmword ptr [rbp - 96], xmm6
	movaps	xmmword ptr [rbp - 80], xmm7
.LBB1_4:
	mov	qword ptr [rbp - 200], r9
	mov	qword ptr [rbp - 208], r8
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 40], rsi
	mov	qword ptr [rbp - 48], rdx
	mov	qword ptr [rbp - 56], rcx
	mov	dword ptr [rbp - 60], 0
	mov	rax, qword ptr [rbp - 40]
	xorps	xmm0, xmm0
	movups	xmmword ptr [rax + 16], xmm0
	movups	xmmword ptr [rax], xmm0
	mov	rax, qword ptr [rbp - 48]
	mov	rcx, qword ptr [rbp - 40]
	xchg	qword ptr [rcx], rax
	lea	rax, [rbp - 240]
	mov	qword ptr [rbp - 16], rax
	lea	rax, [rbp + 16]
	mov	qword ptr [rbp - 24], rax
	mov	dword ptr [rbp - 28], 48
	mov	dword ptr [rbp - 32], 32
	mov	rdi, qword ptr [rbp - 40]
	mov	rsi, qword ptr [rbp - 56]
	lea	rdx, [rbp - 32]
	call	__ViperLinkedListAddItemVA
	mov	rdi, qword ptr [rbp - 248]      # 8-byte Reload
	mov	dword ptr [rbp - 60], eax
	mov	rax, qword ptr [rbp - 40]
	mov	rcx, qword ptr [rax + 32]
	mov	qword ptr [rdi + 32], rcx
	movups	xmm0, xmmword ptr [rax]
	movups	xmm1, xmmword ptr [rax + 16]
	movups	xmmword ptr [rdi + 16], xmm1
	movups	xmmword ptr [rdi], xmm0
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB1_2
# %bb.1:
	mov	rax, qword ptr [rbp - 256]      # 8-byte Reload
	add	rsp, 256
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	ViperLinkedListInit, .Lfunc_end1-ViperLinkedListInit
	.cfi_endproc
                                        # -- End function
	.globl	__ViperLinkedListAddItem        # -- Begin function __ViperLinkedListAddItem
	.p2align	4, 0x90
	.type	__ViperLinkedListAddItem,@function
__ViperLinkedListAddItem:               # @__ViperLinkedListAddItem
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 256
	test	al, al
	je	.LBB2_4
# %bb.3:
	movaps	xmmword ptr [rbp - 192], xmm0
	movaps	xmmword ptr [rbp - 176], xmm1
	movaps	xmmword ptr [rbp - 160], xmm2
	movaps	xmmword ptr [rbp - 144], xmm3
	movaps	xmmword ptr [rbp - 128], xmm4
	movaps	xmmword ptr [rbp - 112], xmm5
	movaps	xmmword ptr [rbp - 96], xmm6
	movaps	xmmword ptr [rbp - 80], xmm7
.LBB2_4:
	mov	qword ptr [rbp - 200], r9
	mov	qword ptr [rbp - 208], r8
	mov	qword ptr [rbp - 216], rcx
	mov	qword ptr [rbp - 224], rdx
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 40], rdi
	mov	qword ptr [rbp - 48], rsi
	mov	dword ptr [rbp - 52], 0
	lea	rax, [rbp - 240]
	mov	qword ptr [rbp - 16], rax
	lea	rax, [rbp + 16]
	mov	qword ptr [rbp - 24], rax
	mov	dword ptr [rbp - 28], 48
	mov	dword ptr [rbp - 32], 16
	mov	rdi, qword ptr [rbp - 40]
	mov	rsi, qword ptr [rbp - 48]
	lea	rdx, [rbp - 32]
	call	__ViperLinkedListAddItemVA
	mov	dword ptr [rbp - 52], eax
	mov	eax, dword ptr [rbp - 52]
	mov	dword ptr [rbp - 244], eax      # 4-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB2_2
# %bb.1:
	mov	eax, dword ptr [rbp - 244]      # 4-byte Reload
	add	rsp, 256
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB2_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end2:
	.size	__ViperLinkedListAddItem, .Lfunc_end2-__ViperLinkedListAddItem
	.cfi_endproc
                                        # -- End function
	.globl	LinkedListDeleteItem            # -- Begin function LinkedListDeleteItem
	.p2align	4, 0x90
	.type	LinkedListDeleteItem,@function
LinkedListDeleteItem:                   # @LinkedListDeleteItem
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rax, qword ptr [rbp - 16]
                                        # kill: def $eax killed $eax killed $rax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end3:
	.size	LinkedListDeleteItem, .Lfunc_end3-LinkedListDeleteItem
	.cfi_endproc
                                        # -- End function
	.globl	LinkedListInsertItem            # -- Begin function LinkedListInsertItem
	.p2align	4, 0x90
	.type	LinkedListInsertItem,@function
LinkedListInsertItem:                   # @LinkedListInsertItem
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	eax, dword ptr [rbp - 16]
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end4:
	.size	LinkedListInsertItem, .Lfunc_end4-LinkedListInsertItem
	.cfi_endproc
                                        # -- End function
	.globl	__LinkedListGetItem             # -- Begin function __LinkedListGetItem
	.p2align	4, 0x90
	.type	__LinkedListGetItem,@function
__LinkedListGetItem:                    # @__LinkedListGetItem
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 112
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 48], rdi
	mov	qword ptr [rbp - 56], rsi
	mov	rax, qword ptr [rbp - 48]
	mov	rax, qword ptr [rax + 24]
	mov	qword ptr [rbp - 64], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 64]
	je	.LBB5_8
# %bb.1:
	mov	dword ptr [rbp - 68], 0
.LBB5_2:                                # =>This Inner Loop Header: Depth=1
	movsxd	rax, dword ptr [rbp - 68]
	cmp	rax, qword ptr [rbp - 56]
	jae	.LBB5_7
# %bb.3:                                #   in Loop: Header=BB5_2 Depth=1
	mov	rcx, qword ptr [rbp - 64]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 8]
	jne	.LBB5_5
# %bb.4:
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 0
	mov	qword ptr [rbp - 16], 0
	lea	rax, [rbp - 32]
	lea	rdi, [rip + .L.str.9]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	qword ptr [rbp - 40], 0
	jmp	.LBB5_9
.LBB5_5:                                #   in Loop: Header=BB5_2 Depth=1
	mov	rax, qword ptr [rbp - 64]
	mov	rax, qword ptr [rax + 8]
	mov	qword ptr [rbp - 64], rax
# %bb.6:                                #   in Loop: Header=BB5_2 Depth=1
	mov	eax, dword ptr [rbp - 68]
	add	eax, 1
	mov	dword ptr [rbp - 68], eax
	jmp	.LBB5_2
.LBB5_7:
	jmp	.LBB5_8
.LBB5_8:
	mov	rax, qword ptr [rbp - 64]
	mov	rax, qword ptr [rax + 24]
	mov	qword ptr [rbp - 40], rax
.LBB5_9:
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 80], rax       # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB5_11
# %bb.10:
	mov	rax, qword ptr [rbp - 80]       # 8-byte Reload
	add	rsp, 112
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB5_11:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end5:
	.size	__LinkedListGetItem, .Lfunc_end5-__LinkedListGetItem
	.cfi_endproc
                                        # -- End function
	.globl	LinkedListClear                 # -- Begin function LinkedListClear
	.p2align	4, 0x90
	.type	LinkedListClear,@function
LinkedListClear:                        # @LinkedListClear
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end6:
	.size	LinkedListClear, .Lfunc_end6-LinkedListClear
	.cfi_endproc
                                        # -- End function
	.globl	LinkedListDelete                # -- Begin function LinkedListDelete
	.p2align	4, 0x90
	.type	LinkedListDelete,@function
LinkedListDelete:                       # @LinkedListDelete
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end7:
	.size	LinkedListDelete, .Lfunc_end7-LinkedListDelete
	.cfi_endproc
                                        # -- End function
	.globl	LinkedListToArray               # -- Begin function LinkedListToArray
	.p2align	4, 0x90
	.type	LinkedListToArray,@function
LinkedListToArray:                      # @LinkedListToArray
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
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end8:
	.size	LinkedListToArray, .Lfunc_end8-LinkedListToArray
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Failed to allocate LinkedList_t nodes"
	.size	.L.str, 38

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Failed to alloacte memory for #TYPE"
	.size	.L.str.1, 36

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Creating new list %s"
	.size	.L.str.2, 21

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"ViperInt_t"
	.size	.L.str.3, 11

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"ViperFloat_t"
	.size	.L.str.4, 13

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"ViperApplication_t"
	.size	.L.str.5, 19

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"ViperVulkan_t"
	.size	.L.str.6, 14

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Unknown type"
	.size	.L.str.7, 13

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"Exiting __LinkedListAddItemVA"
	.size	.L.str.8, 30

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"LinkedList_t item not found"
	.size	.L.str.9, 28

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __ViperLinkedListAddItemVA
	.addrsig_sym calloc
	.addrsig_sym __ViperLogger
	.addrsig_sym malloc
	.addrsig_sym __stack_chk_fail
