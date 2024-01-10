	.text
	.intel_syntax noprefix
	.file	"socket.c"
	.globl	ViperSocketCreate               # -- Begin function ViperSocketCreate
	.p2align	4, 0x90
	.type	ViperSocketCreate,@function
ViperSocketCreate:                      # @ViperSocketCreate
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 320
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 232], rdi
	mov	qword ptr [rbp - 240], rsi
	mov	dword ptr [rbp - 12], 0
	mov	dword ptr [rbp - 244], 0
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 48]
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 248], eax
	mov	qword ptr [rbp - 24], 0
	lea	rdi, [rbp - 72]
	xor	esi, esi
	mov	edx, 48
	call	memset@PLT
	lea	rax, [rbp - 72]
	add	rax, 4
	mov	qword ptr [rbp - 256], rax      # 8-byte Spill
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
	cmp	eax, dword ptr [rcx + 16]
	jne	.LBB0_2
# %bb.1:
	mov	eax, 10
	mov	dword ptr [rbp - 260], eax      # 4-byte Spill
	jmp	.LBB0_3
.LBB0_2:
	mov	rax, qword ptr [rbp - 240]
	mov	eax, dword ptr [rax + 16]
	mov	dword ptr [rbp - 260], eax      # 4-byte Spill
.LBB0_3:
	mov	rax, qword ptr [rbp - 256]      # 8-byte Reload
	mov	ecx, dword ptr [rbp - 260]      # 4-byte Reload
	mov	dword ptr [rax], ecx
	lea	rax, [rbp - 72]
	add	rax, 8
	mov	qword ptr [rbp - 272], rax      # 8-byte Spill
	mov	rcx, qword ptr [rbp - 240]
	xor	eax, eax
	cmp	eax, dword ptr [rcx + 20]
	jne	.LBB0_5
# %bb.4:
	mov	eax, 1
	mov	dword ptr [rbp - 276], eax      # 4-byte Spill
	jmp	.LBB0_6
.LBB0_5:
	mov	rax, qword ptr [rbp - 240]
	mov	eax, dword ptr [rax + 20]
	mov	dword ptr [rbp - 276], eax      # 4-byte Spill
.LBB0_6:
	mov	rax, qword ptr [rbp - 272]      # 8-byte Reload
	mov	ecx, dword ptr [rbp - 276]      # 4-byte Reload
	mov	dword ptr [rax], ecx
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 8]
	and	rax, 1
	cmp	rax, 0
	je	.LBB0_8
# %bb.7:
	mov	dword ptr [rbp - 72], 1
.LBB0_8:
	jmp	.LBB0_9
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 240]
	mov	rdi, qword ptr [rax + 24]
	mov	rsi, qword ptr [rax + 32]
	lea	rdx, [rbp - 72]
	lea	rcx, [rbp - 24]
	call	getaddrinfo@PLT
	mov	dword ptr [rbp - 244], eax
	mov	ecx, eax
	mov	dword ptr [rbp - 280], ecx      # 4-byte Spill
	sub	eax, -3
	je	.LBB0_11
	jmp	.LBB0_36
.LBB0_36:
	mov	eax, dword ptr [rbp - 280]      # 4-byte Reload
	test	eax, eax
	jne	.LBB0_14
	jmp	.LBB0_10
.LBB0_10:
	mov	qword ptr [rbp - 96], 0
	mov	qword ptr [rbp - 88], 0
	mov	qword ptr [rbp - 80], 0
	lea	rax, [rbp - 96]
	lea	rdi, [rip + .L.str]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 48]
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 248], eax
	jmp	.LBB0_15
.LBB0_11:                               #   in Loop: Header=BB0_9 Depth=1
	mov	ecx, dword ptr [rbp - 248]
	mov	eax, ecx
	add	eax, -1
	mov	dword ptr [rbp - 248], eax
	xor	eax, eax
	cmp	eax, ecx
	je	.LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_9 Depth=1
	mov	edi, 5
	call	usleep@PLT
	jmp	.LBB0_9
.LBB0_13:
	jmp	.LBB0_14
.LBB0_14:
	mov	qword ptr [rbp - 120], 0
	mov	qword ptr [rbp - 112], 4
	mov	qword ptr [rbp - 104], 0
	mov	esi, dword ptr [rbp - 244]
	lea	rax, [rbp - 120]
	lea	rdi, [rip + .L.str.1]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_32
.LBB0_15:
	mov	rax, qword ptr [rbp - 24]
	mov	edi, dword ptr [rax + 4]
	mov	rax, qword ptr [rbp - 24]
	mov	esi, dword ptr [rax + 8]
	mov	rax, qword ptr [rbp - 24]
	mov	edx, dword ptr [rax + 12]
	call	socket@PLT
	mov	ecx, eax
	mov	rax, qword ptr [rbp - 232]
	mov	dword ptr [rax + 8], ecx
	mov	rcx, qword ptr [rbp - 232]
	mov	eax, 4294967295
	cmp	eax, dword ptr [rcx + 8]
	jne	.LBB0_17
# %bb.16:
	mov	qword ptr [rbp - 144], 0
	mov	qword ptr [rbp - 136], 4
	mov	qword ptr [rbp - 128], 0
	call	__errno_location@PLT
	mov	esi, dword ptr [rax]
	lea	rax, [rbp - 144]
	lea	rdi, [rip + .L.str.2]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_31
.LBB0_17:
	mov	eax, 10
	cmp	eax, dword ptr [rbp - 68]
	jne	.LBB0_21
# %bb.18:
	mov	rax, qword ptr [rbp - 232]
	mov	edi, dword ptr [rax + 8]
	mov	esi, 41
	mov	edx, 26
	lea	rcx, [rbp - 12]
	mov	r8d, 4
	call	setsockopt@PLT
	mov	ecx, eax
	mov	eax, 4294967295
	cmp	eax, ecx
	jne	.LBB0_20
# %bb.19:
	mov	qword ptr [rbp - 168], 0
	mov	qword ptr [rbp - 160], 3
	mov	qword ptr [rbp - 152], 0
	call	__errno_location@PLT
	mov	esi, dword ptr [rax]
	lea	rax, [rbp - 168]
	lea	rdi, [rip + .L.str.3]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB0_20:
	jmp	.LBB0_21
.LBB0_21:
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 8]
	and	rax, 1
	cmp	rax, 0
	je	.LBB0_29
# %bb.22:
	mov	eax, 1
	cmp	eax, dword ptr [rbp - 64]
	jne	.LBB0_26
# %bb.23:
	mov	rax, qword ptr [rbp - 232]
	mov	edi, dword ptr [rax + 8]
	mov	rax, qword ptr [rbp - 24]
	mov	rsi, qword ptr [rax + 24]
	mov	rax, qword ptr [rbp - 24]
	mov	edx, dword ptr [rax + 16]
	call	bind@PLT
	mov	ecx, eax
	mov	eax, 4294967295
	cmp	eax, ecx
	jne	.LBB0_25
# %bb.24:
	mov	qword ptr [rbp - 192], 0
	mov	qword ptr [rbp - 184], 4
	mov	qword ptr [rbp - 176], 0
	call	__errno_location@PLT
	mov	esi, dword ptr [rax]
	lea	rax, [rbp - 192]
	lea	rdi, [rip + .L.str.4]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_31
.LBB0_25:
	jmp	.LBB0_26
.LBB0_26:
	mov	rax, qword ptr [rbp - 232]
	mov	edi, dword ptr [rax + 8]
	mov	rax, qword ptr [rbp - 240]
	mov	rax, qword ptr [rax + 40]
	mov	esi, eax
	call	listen@PLT
	mov	ecx, eax
	mov	eax, 4294967295
	cmp	eax, ecx
	jne	.LBB0_28
# %bb.27:
	mov	qword ptr [rbp - 216], 0
	mov	qword ptr [rbp - 208], 4
	mov	qword ptr [rbp - 200], 0
	call	__errno_location@PLT
	mov	esi, dword ptr [rax]
	lea	rax, [rbp - 216]
	lea	rdi, [rip + .L.str.5]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
	jmp	.LBB0_31
.LBB0_28:
	jmp	.LBB0_29
.LBB0_29:
	jmp	.LBB0_30
.LBB0_30:
	mov	rdi, qword ptr [rbp - 24]
	call	freeaddrinfo@PLT
	mov	byte ptr [rbp - 217], 0
	jmp	.LBB0_33
.LBB0_31:
	mov	rdi, qword ptr [rbp - 24]
	call	freeaddrinfo@PLT
.LBB0_32:
	mov	byte ptr [rbp - 217], -1
.LBB0_33:
	mov	al, byte ptr [rbp - 217]
	mov	byte ptr [rbp - 281], al        # 1-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_35
# %bb.34:
	mov	al, byte ptr [rbp - 281]        # 1-byte Reload
	movsx	eax, al
	add	rsp, 320
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_35:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperSocketCreate, .Lfunc_end0-ViperSocketCreate
	.cfi_endproc
                                        # -- End function
	.globl	ViperSocketSend                 # -- Begin function ViperSocketSend
	.p2align	4, 0x90
	.type	ViperSocketSend,@function
ViperSocketSend:                        # @ViperSocketSend
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 80
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 40], 0
	mov	qword ptr [rbp - 48], 0
	mov	rax, qword ptr [rbp - 24]
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rbp - 56], rax
	mov	rax, qword ptr [rbp - 24]
	mov	rax, qword ptr [rax + 8]
	mov	qword ptr [rbp - 64], rax
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	edi, dword ptr [rax + 8]
	mov	rsi, qword ptr [rbp - 56]
	mov	rdx, qword ptr [rbp - 64]
	xor	ecx, ecx
	call	send@PLT
	mov	qword ptr [rbp - 48], rax
	mov	rax, -1
	cmp	rax, qword ptr [rbp - 48]
	jne	.LBB1_10
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	call	__errno_location@PLT
	mov	eax, dword ptr [rax]
	mov	dword ptr [rbp - 68], eax       # 4-byte Spill
	sub	eax, 11
	je	.LBB1_3
	jmp	.LBB1_14
.LBB1_14:                               #   in Loop: Header=BB1_1 Depth=1
	mov	eax, dword ptr [rbp - 68]       # 4-byte Reload
	sub	eax, 90
	je	.LBB1_6
	jmp	.LBB1_9
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	mov	rcx, qword ptr [rbp - 32]
	mov	rax, rcx
	add	rax, 1
	mov	qword ptr [rbp - 32], rax
	mov	eax, 3
	cmp	rax, rcx
	jge	.LBB1_5
# %bb.4:
	mov	qword ptr [rbp - 8], 101
	jmp	.LBB1_13
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_1
.LBB1_6:                                #   in Loop: Header=BB1_1 Depth=1
	mov	rax, qword ptr [rbp - 64]
	mov	ecx, 2
	cqo
	idiv	rcx
	mov	qword ptr [rbp - 64], rax
	cmp	qword ptr [rbp - 64], 512
	jge	.LBB1_8
# %bb.7:
	mov	qword ptr [rbp - 8], 90
	jmp	.LBB1_13
.LBB1_8:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_1
.LBB1_9:
	call	__errno_location@PLT
	movsxd	rax, dword ptr [rax]
	mov	qword ptr [rbp - 8], rax
	jmp	.LBB1_13
.LBB1_10:                               #   in Loop: Header=BB1_1 Depth=1
	mov	rax, qword ptr [rbp - 48]
	add	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 40], rax
	mov	rax, qword ptr [rbp - 40]
	mov	rcx, qword ptr [rbp - 24]
	cmp	rax, qword ptr [rcx + 8]
	jae	.LBB1_12
# %bb.11:                               #   in Loop: Header=BB1_1 Depth=1
	mov	rax, qword ptr [rbp - 48]
	add	rax, qword ptr [rbp - 56]
	mov	qword ptr [rbp - 56], rax
	jmp	.LBB1_1
.LBB1_12:
	mov	qword ptr [rbp - 8], 0
.LBB1_13:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 80
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	ViperSocketSend, .Lfunc_end1-ViperSocketSend
	.cfi_endproc
                                        # -- End function
	.globl	ViperSokcetReceive              # -- Begin function ViperSokcetReceive
	.p2align	4, 0x90
	.type	ViperSokcetReceive,@function
ViperSokcetReceive:                     # @ViperSokcetReceive
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	qword ptr [rbp - 32], 0
	mov	dword ptr [rbp - 36], 0
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	edi, dword ptr [rax + 8]
	mov	rax, qword ptr [rbp - 24]
	mov	rsi, qword ptr [rax + 16]
	mov	rax, qword ptr [rbp - 24]
	mov	rdx, qword ptr [rax + 8]
	sub	rdx, 1
	xor	ecx, ecx
	call	recv@PLT
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 36], eax
	mov	eax, 4294967295
	cmp	eax, dword ptr [rbp - 36]
	jne	.LBB2_7
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	mov	eax, dword ptr [rbp - 36]
	mov	dword ptr [rbp - 40], eax       # 4-byte Spill
	sub	eax, 4
	je	.LBB2_3
	jmp	.LBB2_9
.LBB2_9:                                #   in Loop: Header=BB2_1 Depth=1
	mov	eax, dword ptr [rbp - 40]       # 4-byte Reload
	sub	eax, 11
	jne	.LBB2_6
	jmp	.LBB2_3
.LBB2_3:                                #   in Loop: Header=BB2_1 Depth=1
	mov	rcx, qword ptr [rbp - 32]
	mov	rax, rcx
	add	rax, 1
	mov	qword ptr [rbp - 32], rax
	mov	eax, 3
	cmp	rax, rcx
	jge	.LBB2_5
# %bb.4:
	mov	qword ptr [rbp - 8], 101
	jmp	.LBB2_8
.LBB2_5:                                #   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_1
.LBB2_6:
	call	__errno_location@PLT
	movsxd	rax, dword ptr [rax]
	mov	qword ptr [rbp - 8], rax
	jmp	.LBB2_8
.LBB2_7:
	movsxd	rax, dword ptr [rbp - 36]
	mov	qword ptr [rbp - 8], rax
.LBB2_8:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 48
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end2:
	.size	ViperSokcetReceive, .Lfunc_end2-ViperSokcetReceive
	.cfi_endproc
                                        # -- End function
	.globl	ViperSocketAccept               # -- Begin function ViperSocketAccept
	.p2align	4, 0x90
	.type	ViperSocketAccept,@function
ViperSocketAccept:                      # @ViperSocketAccept
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 32], rdi
	mov	qword ptr [rbp - 40], rsi
	mov	rax, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	mov	qword ptr [rbp - 24], 0
	mov	rax, qword ptr [rbp - 32]
	mov	edi, dword ptr [rax + 8]
	xor	eax, eax
	mov	edx, eax
	mov	rsi, rdx
	call	accept@PLT
	mov	ecx, eax
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
	mov	dword ptr [rbp - 16], ecx
	movups	xmm0, xmmword ptr [rbp - 24]
	movups	xmmword ptr [rax], xmm0
	mov	rax, qword ptr [rbp - 40]
	movsxd	rax, dword ptr [rax + 8]
	mov	qword ptr [rbp - 48], rax       # 8-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB3_2
# %bb.1:
	mov	rax, qword ptr [rbp - 48]       # 8-byte Reload
	add	rsp, 64
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB3_2:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end3:
	.size	ViperSocketAccept, .Lfunc_end3-ViperSocketAccept
	.cfi_endproc
                                        # -- End function
	.globl	ViperEpollAddServer             # -- Begin function ViperEpollAddServer
	.p2align	4, 0x90
	.type	ViperEpollAddServer,@function
ViperEpollAddServer:                    # @ViperEpollAddServer
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	movsx	eax, al
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end4:
	.size	ViperEpollAddServer, .Lfunc_end4-ViperEpollAddServer
	.cfi_endproc
                                        # -- End function
	.globl	ViperEpollAddClient             # -- Begin function ViperEpollAddClient
	.p2align	4, 0x90
	.type	ViperEpollAddClient,@function
ViperEpollAddClient:                    # @ViperEpollAddClient
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	movsx	eax, al
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end5:
	.size	ViperEpollAddClient, .Lfunc_end5-ViperEpollAddClient
	.cfi_endproc
                                        # -- End function
	.globl	ViperEpoll                      # -- Begin function ViperEpoll
	.p2align	4, 0x90
	.type	ViperEpoll,@function
ViperEpoll:                             # @ViperEpoll
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	edi, dword ptr [rbp - 4]
	mov	rsi, qword ptr [rbp - 16]
	mov	rax, qword ptr [rbp - 24]
	mov	edx, eax
	mov	ecx, 4294967295
	call	epoll_wait@PLT
	mov	dword ptr [rbp - 28], eax
	mov	eax, 4294967295
	cmp	eax, dword ptr [rbp - 28]
	jne	.LBB6_2
# %bb.1:
	jmp	.LBB6_6
.LBB6_2:
	mov	dword ptr [rbp - 32], 1
.LBB6_3:                                # =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 32]
	cmp	eax, dword ptr [rbp - 28]
	jge	.LBB6_6
# %bb.4:                                #   in Loop: Header=BB6_3 Depth=1
	jmp	.LBB6_5
.LBB6_5:                                #   in Loop: Header=BB6_3 Depth=1
	mov	eax, dword ptr [rbp - 32]
	add	eax, 1
	mov	dword ptr [rbp - 32], eax
	jmp	.LBB6_3
.LBB6_6:
	add	rsp, 32
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end6:
	.size	ViperEpoll, .Lfunc_end6-ViperEpoll
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"getaddrinfo success"
	.size	.L.str, 20

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"getaddrinfo failed : %n"
	.size	.L.str.1, 24

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Failed to create socket : %n"
	.size	.L.str.2, 29

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Turning off IPv6 only mode failed : %n"
	.size	.L.str.3, 39

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Failed to bind socket : %n"
	.size	.L.str.4, 27

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Failed to listen socket : %n"
	.size	.L.str.5, 29

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym getaddrinfo
	.addrsig_sym __ViperLogger
	.addrsig_sym usleep
	.addrsig_sym socket
	.addrsig_sym __errno_location
	.addrsig_sym setsockopt
	.addrsig_sym bind
	.addrsig_sym listen
	.addrsig_sym freeaddrinfo
	.addrsig_sym send
	.addrsig_sym recv
	.addrsig_sym accept
	.addrsig_sym epoll_wait
	.addrsig_sym __stack_chk_fail
