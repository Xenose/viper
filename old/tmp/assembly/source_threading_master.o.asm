	.text
	.intel_syntax noprefix
	.file	"master.c"
	.globl	ExecuteAsync                    # -- Begin function ExecuteAsync
	.p2align	4, 0x90
	.type	ExecuteAsync,@function
ExecuteAsync:                           # @ExecuteAsync
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	dword ptr [rbp - 4], 0
	mov	eax, 4294967295
	cmp	eax, dword ptr [rbp - 4]
	jne	.LBB0_2
# %bb.1:
	jmp	.LBB0_2
.LBB0_2:
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	ExecuteAsync, .Lfunc_end0-ExecuteAsync
	.cfi_endproc
                                        # -- End function
	.globl	ViperThreadTaskAdd              # -- Begin function ViperThreadTaskAdd
	.p2align	4, 0x90
	.type	ViperThreadTaskAdd,@function
ViperThreadTaskAdd:                     # @ViperThreadTaskAdd
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
	mov	dword ptr [rbp - 36], edi
	mov	qword ptr [rbp - 48], rsi
	mov	qword ptr [rbp - 56], 0
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 48]
	jne	.LBB1_2
# %bb.1:
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 3
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
	jmp	.LBB1_6
.LBB1_2:
	mov	eax, 1
	cmp	eax, dword ptr [rbp - 36]
	jne	.LBB1_4
# %bb.3:
	mov	rdi, qword ptr [rip + __tasksOpenGL]
	mov	rax, qword ptr [rip + __taskCountOpenGL]
	add	rax, 1
	mov	qword ptr [rip + __taskCountOpenGL], rax
	imul	rsi, rax, 40
	call	realloc@PLT
	mov	qword ptr [rip + __tasksOpenGL], rax
	mov	rax, qword ptr [rip + __tasksOpenGL]
	mov	rcx, qword ptr [rip + __taskCountOpenGL]
	sub	rcx, 1
	imul	rcx, rcx, 40
	add	rax, rcx
	mov	qword ptr [rbp - 56], rax
	jmp	.LBB1_5
.LBB1_4:
	mov	rdi, qword ptr [rip + __tasks]
	mov	rax, qword ptr [rip + __taskCount]
	add	rax, 1
	mov	qword ptr [rip + __taskCount], rax
	add	rax, 1
	imul	rsi, rax, 40
	call	realloc@PLT
	mov	qword ptr [rip + __tasks], rax
	mov	rax, qword ptr [rip + __tasks]
	mov	rcx, qword ptr [rip + __taskCount]
	sub	rcx, 1
	imul	rcx, rcx, 40
	add	rax, rcx
	mov	qword ptr [rbp - 56], rax
.LBB1_5:
	mov	rcx, qword ptr [rbp - 48]
	mov	rax, qword ptr [rbp - 56]
	mov	qword ptr [rax + 24], rcx
.LBB1_6:
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB1_8
# %bb.7:
	add	rsp, 80
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB1_8:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end1:
	.size	ViperThreadTaskAdd, .Lfunc_end1-ViperThreadTaskAdd
	.cfi_endproc
                                        # -- End function
	.globl	ViperRenderLoopOpenGL2          # -- Begin function ViperRenderLoopOpenGL2
	.p2align	4, 0x90
	.type	ViperRenderLoopOpenGL2,@function
ViperRenderLoopOpenGL2:                 # @ViperRenderLoopOpenGL2
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
	mov	rax, qword ptr [rax + 96]
	mov	qword ptr [rbp - 24], rax
	mov	dword ptr [rbp - 28], 0
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movsxd	rax, dword ptr [rbp - 28]
	cmp	rax, qword ptr [rip + __taskCountOpenGL]
	jae	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	mov	rax, qword ptr [rip + __tasksOpenGL]
	movsxd	rcx, dword ptr [rbp - 28]
	imul	rcx, rcx, 40
	add	rax, rcx
	mov	rax, qword ptr [rax + 24]
	mov	rdi, qword ptr [rbp - 16]
	call	rax
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	mov	eax, dword ptr [rbp - 28]
	add	eax, 1
	mov	dword ptr [rbp - 28], eax
	jmp	.LBB2_1
.LBB2_4:
	mov	rax, qword ptr [rbp - 24]
	mov	rdi, qword ptr [rax + 24]
	call	glfwSwapBuffers@PLT
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 104]
	mov	rdi, qword ptr [rbp - 16]
	call	rax
	xor	eax, eax
	add	rsp, 32
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end2:
	.size	ViperRenderLoopOpenGL2, .Lfunc_end2-ViperRenderLoopOpenGL2
	.cfi_endproc
                                        # -- End function
	.globl	ViperThreadWorker               # -- Begin function ViperThreadWorker
	.p2align	4, 0x90
	.type	ViperThreadWorker,@function
ViperThreadWorker:                      # @ViperThreadWorker
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rbp - 16], rax
.LBB3_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
                                        #     Child Loop BB3_10 Depth 2
                                        #     Child Loop BB3_12 Depth 2
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 8]
	and	rax, -2
	cmp	rax, 0
	je	.LBB3_3
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_1
.LBB3_3:                                #   in Loop: Header=BB3_1 Depth=1
	mov	rcx, qword ptr [rbp - 16]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rcx + 40]
	jne	.LBB3_7
# %bb.4:                                #   in Loop: Header=BB3_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, rax
	add	rcx, 8
	mov	qword ptr [rbp - 32], rcx       # 8-byte Spill
	mov	rax, qword ptr [rax + 8]
	mov	qword ptr [rbp - 24], rax       # 8-byte Spill
.LBB3_5:                                #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rax, qword ptr [rbp - 24]       # 8-byte Reload
	mov	rcx, qword ptr [rbp - 32]       # 8-byte Reload
	mov	rdx, rax
	and	rdx, -2
	lock		cmpxchg	qword ptr [rcx], rdx
	sete	cl
	test	cl, 1
	mov	qword ptr [rbp - 24], rax       # 8-byte Spill
	jne	.LBB3_6
	jmp	.LBB3_5
.LBB3_6:                                #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_1
.LBB3_7:                                #   in Loop: Header=BB3_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 40]
	mov	rax, qword ptr [rax + 8]
	and	rax, -2
	cmp	rax, 0
	je	.LBB3_9
# %bb.8:                                #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_1
.LBB3_9:                                #   in Loop: Header=BB3_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 40]
	mov	rcx, rax
	add	rcx, 8
	mov	qword ptr [rbp - 48], rcx       # 8-byte Spill
	mov	rax, qword ptr [rax + 8]
	mov	qword ptr [rbp - 40], rax       # 8-byte Spill
.LBB3_10:                               #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rax, qword ptr [rbp - 40]       # 8-byte Reload
	mov	rcx, qword ptr [rbp - 48]       # 8-byte Reload
	mov	rdx, rax
	and	rdx, -2
	lock		cmpxchg	qword ptr [rcx], rdx
	sete	cl
	test	cl, 1
	mov	qword ptr [rbp - 40], rax       # 8-byte Spill
	jne	.LBB3_11
	jmp	.LBB3_10
.LBB3_11:                               #   in Loop: Header=BB3_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rax + 40], 0
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, rax
	add	rcx, 8
	mov	qword ptr [rbp - 64], rcx       # 8-byte Spill
	mov	rax, qword ptr [rax + 8]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
.LBB3_12:                               #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
	mov	rcx, qword ptr [rbp - 64]       # 8-byte Reload
	mov	rdx, rax
	and	rdx, -2
	lock		cmpxchg	qword ptr [rcx], rdx
	sete	cl
	test	cl, 1
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	jne	.LBB3_13
	jmp	.LBB3_12
.LBB3_13:                               #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_1
.Lfunc_end3:
	.size	ViperThreadWorker, .Lfunc_end3-ViperThreadWorker
	.cfi_endproc
                                        # -- End function
	.globl	ViperThreadCreateWorker         # -- Begin function ViperThreadCreateWorker
	.p2align	4, 0x90
	.type	ViperThreadCreateWorker,@function
ViperThreadCreateWorker:                # @ViperThreadCreateWorker
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	rax, qword ptr [rip + __workerCount]
	add	rax, 1
	mov	qword ptr [rip + __workerCount], rax
	mov	rdi, qword ptr [rbp - 16]
	mov	rax, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rax + 16]
	add	rsi, 8192
	mov	rcx, qword ptr [rbp - 24]
	mov	edx, 256
	mov	al, 0
	call	clone@PLT
	movsxd	rcx, eax
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 24], rcx
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 24]
                                        # kill: def $eax killed $eax killed $rax
	add	rsp, 32
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end4:
	.size	ViperThreadCreateWorker, .Lfunc_end4-ViperThreadCreateWorker
	.cfi_endproc
                                        # -- End function
	.globl	ViperThreadForemanAssignTasks   # -- Begin function ViperThreadForemanAssignTasks
	.p2align	4, 0x90
	.type	ViperThreadForemanAssignTasks,@function
ViperThreadForemanAssignTasks:          # @ViperThreadForemanAssignTasks
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	qword ptr [rbp - 32], rcx
	mov	qword ptr [rbp - 40], r8
	mov	dword ptr [rbp - 44], 0
.LBB5_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
                                        #       Child Loop BB5_9 Depth 3
                                        #       Child Loop BB5_11 Depth 3
	movsxd	rax, dword ptr [rbp - 44]
	cmp	rax, qword ptr [rbp - 40]
	jge	.LBB5_16
# %bb.2:                                #   in Loop: Header=BB5_1 Depth=1
	mov	rax, qword ptr [rbp - 32]
	movsxd	rcx, dword ptr [rbp - 44]
	lea	rcx, [rcx + 4*rcx]
	lea	rdx, [rax + 8*rcx]
	mov	rax, qword ptr [rax + 8*rcx + 8]
	and	rax, 1
	cmp	rax, 0
	je	.LBB5_4
# %bb.3:                                #   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_15
.LBB5_4:                                #   in Loop: Header=BB5_1 Depth=1
	mov	dword ptr [rbp - 48], 0
.LBB5_5:                                #   Parent Loop BB5_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_9 Depth 3
                                        #       Child Loop BB5_11 Depth 3
	movsxd	rax, dword ptr [rbp - 48]
	cmp	rax, qword ptr [rbp - 24]
	jge	.LBB5_14
# %bb.6:                                #   in Loop: Header=BB5_5 Depth=2
	mov	rax, qword ptr [rbp - 16]
	movsxd	rcx, dword ptr [rbp - 48]
	lea	rcx, [rcx + 2*rcx]
	shl	rcx, 4
	mov	rdx, rax
	add	rdx, rcx
	mov	rax, qword ptr [rax + rcx + 8]
	and	rax, 1
	cmp	rax, 0
	je	.LBB5_8
# %bb.7:                                #   in Loop: Header=BB5_5 Depth=2
	jmp	.LBB5_13
.LBB5_8:                                #   in Loop: Header=BB5_5 Depth=2
	mov	rcx, qword ptr [rbp - 32]
	movsxd	rax, dword ptr [rbp - 44]
	imul	rax, rax, 40
	add	rcx, rax
	mov	rax, qword ptr [rbp - 16]
	movsxd	rdx, dword ptr [rbp - 48]
	imul	rdx, rdx, 48
	add	rax, rdx
	mov	qword ptr [rax + 40], rcx
	mov	rcx, qword ptr [rbp - 8]
	mov	rax, qword ptr [rbp - 16]
	movsxd	rdx, dword ptr [rbp - 48]
	imul	rdx, rdx, 48
	add	rax, rdx
	mov	qword ptr [rax + 32], rcx
	mov	rax, qword ptr [rbp - 32]
	movsxd	rcx, dword ptr [rbp - 44]
	imul	rcx, rcx, 40
	add	rax, rcx
	mov	rcx, rax
	add	rcx, 8
	mov	qword ptr [rbp - 64], rcx       # 8-byte Spill
	mov	rax, qword ptr [rax + 8]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
.LBB5_9:                                #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
	mov	rcx, qword ptr [rbp - 64]       # 8-byte Reload
	mov	rdx, rax
	or	rdx, 1
	lock		cmpxchg	qword ptr [rcx], rdx
	sete	cl
	test	cl, 1
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	jne	.LBB5_10
	jmp	.LBB5_9
.LBB5_10:                               #   in Loop: Header=BB5_5 Depth=2
	mov	rax, qword ptr [rbp - 16]
	movsxd	rcx, dword ptr [rbp - 48]
	imul	rcx, rcx, 48
	add	rax, rcx
	mov	rcx, rax
	add	rcx, 8
	mov	qword ptr [rbp - 80], rcx       # 8-byte Spill
	mov	rax, qword ptr [rax + 8]
	mov	qword ptr [rbp - 72], rax       # 8-byte Spill
.LBB5_11:                               #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	mov	rax, qword ptr [rbp - 72]       # 8-byte Reload
	mov	rcx, qword ptr [rbp - 80]       # 8-byte Reload
	mov	rdx, rax
	or	rdx, 1
	lock		cmpxchg	qword ptr [rcx], rdx
	sete	cl
	test	cl, 1
	mov	qword ptr [rbp - 72], rax       # 8-byte Spill
	jne	.LBB5_12
	jmp	.LBB5_11
.LBB5_12:                               #   in Loop: Header=BB5_5 Depth=2
.LBB5_13:                               #   in Loop: Header=BB5_5 Depth=2
	mov	eax, dword ptr [rbp - 48]
	add	eax, 1
	mov	dword ptr [rbp - 48], eax
	jmp	.LBB5_5
.LBB5_14:                               #   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_15
.LBB5_15:                               #   in Loop: Header=BB5_1 Depth=1
	mov	eax, dword ptr [rbp - 44]
	add	eax, 1
	mov	dword ptr [rbp - 44], eax
	jmp	.LBB5_1
.LBB5_16:
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end5:
	.size	ViperThreadForemanAssignTasks, .Lfunc_end5-ViperThreadForemanAssignTasks
	.cfi_endproc
                                        # -- End function
	.globl	ViperThreadTaskForeman          # -- Begin function ViperThreadTaskForeman
	.p2align	4, 0x90
	.type	ViperThreadTaskForeman,@function
ViperThreadTaskForeman:                 # @ViperThreadTaskForeman
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
	mov	qword ptr [rbp - 64], rdi
	mov	qword ptr [rbp - 72], rsi
	imul	rsi, qword ptr [rbp - 72], 48
	mov	edi, 1
	call	calloc@PLT
	mov	qword ptr [rbp - 80], rax
	mov	qword ptr [rbp - 80], rax
	xor	eax, eax
                                        # kill: def $rax killed $eax
	cmp	rax, qword ptr [rbp - 80]
	jne	.LBB6_3
# %bb.1:
	mov	qword ptr [rbp - 32], 0
	mov	qword ptr [rbp - 24], 4
	mov	qword ptr [rbp - 16], 0
	mov	rcx, qword ptr [rbp - 16]
	mov	rax, rsp
	mov	qword ptr [rax + 16], rcx
	movups	xmm0, xmmword ptr [rbp - 32]
	movups	xmmword ptr [rax], xmm0
	lea	rdi, [rip + .L.str.1]
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	call	__ViperLogger@PLT
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB6_17
# %bb.2:
	add	rsp, 128
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB6_3:
	.cfi_def_cfa rbp, 16
	mov	dword ptr [rbp - 84], 0
.LBB6_4:                                # =>This Inner Loop Header: Depth=1
	movsxd	rax, dword ptr [rbp - 84]
	cmp	rax, qword ptr [rbp - 72]
	jge	.LBB6_7
# %bb.5:                                #   in Loop: Header=BB6_4 Depth=1
	mov	edi, 8192
	call	malloc@PLT
	mov	rcx, rax
	mov	rax, qword ptr [rbp - 80]
	movsxd	rdx, dword ptr [rbp - 84]
	imul	rdx, rdx, 48
	add	rax, rdx
	mov	qword ptr [rax + 16], rcx
# %bb.6:                                #   in Loop: Header=BB6_4 Depth=1
	mov	eax, dword ptr [rbp - 84]
	add	eax, 1
	mov	dword ptr [rbp - 84], eax
	jmp	.LBB6_4
.LBB6_7:
	mov	rax, qword ptr [rbp - 64]
	mov	rax, qword ptr [rax + 96]
	mov	rdi, qword ptr [rax + 24]
	call	glfwMakeContextCurrent@PLT
	mov	dword ptr [rbp - 88], 0
.LBB6_8:                                # =>This Inner Loop Header: Depth=1
	movsxd	rax, dword ptr [rbp - 88]
	cmp	rax, qword ptr [rbp - 72]
	jge	.LBB6_13
# %bb.9:                                #   in Loop: Header=BB6_8 Depth=1
	mov	rdi, qword ptr [rbp - 80]
	movsxd	rax, dword ptr [rbp - 88]
	imul	rax, rax, 48
	add	rdi, rax
	mov	rdx, qword ptr [rbp - 80]
	movsxd	rax, dword ptr [rbp - 88]
	imul	rax, rax, 48
	add	rdx, rax
	lea	rsi, [rip + ViperThreadWorker]
	call	ViperThreadCreateWorker
	mov	dword ptr [rbp - 92], eax
	mov	eax, 4294967295
	cmp	eax, dword ptr [rbp - 92]
	jne	.LBB6_11
# %bb.10:                               #   in Loop: Header=BB6_8 Depth=1
	mov	qword ptr [rbp - 56], 0
	mov	qword ptr [rbp - 48], 4
	mov	qword ptr [rbp - 40], 0
	lea	rax, [rbp - 56]
	lea	rdi, [rip + .L.str.2]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	mov	al, 0
	call	__ViperLogger@PLT
.LBB6_11:                               #   in Loop: Header=BB6_8 Depth=1
	jmp	.LBB6_12
.LBB6_12:                               #   in Loop: Header=BB6_8 Depth=1
	mov	eax, dword ptr [rbp - 88]
	add	eax, 1
	mov	dword ptr [rbp - 88], eax
	jmp	.LBB6_8
.LBB6_13:
	jmp	.LBB6_14
.LBB6_14:                               # =>This Inner Loop Header: Depth=1
	call	glfwPollEvents@PLT
	mov	rax, qword ptr [rbp - 64]
	mov	rax, qword ptr [rax + 96]
	mov	rdi, qword ptr [rax + 24]
	call	glfwWindowShouldClose@PLT
	cmp	eax, 0
	je	.LBB6_16
# %bb.15:                               #   in Loop: Header=BB6_14 Depth=1
	mov	rcx, qword ptr [rbp - 64]
	xor	eax, eax
                                        # kill: def $rax killed $eax
	xchg	qword ptr [rcx + 16], rax
.LBB6_16:                               #   in Loop: Header=BB6_14 Depth=1
	mov	rdi, qword ptr [rbp - 64]
	call	ViperRenderLoopOpenGL2
	mov	rdi, qword ptr [rbp - 64]
	mov	rsi, qword ptr [rbp - 80]
	mov	rdx, qword ptr [rip + __workerCount]
	mov	rcx, qword ptr [rip + __tasks]
	mov	r8, qword ptr [rip + __taskCount]
	call	ViperThreadForemanAssignTasks
	jmp	.LBB6_14
.LBB6_17:
	call	__stack_chk_fail@PLT
.Lfunc_end6:
	.size	ViperThreadTaskForeman, .Lfunc_end6-ViperThreadTaskForeman
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Tried to added NULL function"
	.size	.L.str, 29

	.type	__tasksOpenGL,@object           # @__tasksOpenGL
	.local	__tasksOpenGL
	.comm	__tasksOpenGL,8,8
	.type	__taskCountOpenGL,@object       # @__taskCountOpenGL
	.local	__taskCountOpenGL
	.comm	__taskCountOpenGL,8,8
	.type	__tasks,@object                 # @__tasks
	.local	__tasks
	.comm	__tasks,8,8
	.type	__taskCount,@object             # @__taskCount
	.local	__taskCount
	.comm	__taskCount,8,8
	.type	__workerCount,@object           # @__workerCount
	.local	__workerCount
	.comm	__workerCount,8,8
	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"malloc failed"
	.size	.L.str.1, 14

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Failed to create thread"
	.size	.L.str.2, 24

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __ViperLogger
	.addrsig_sym realloc
	.addrsig_sym ViperRenderLoopOpenGL2
	.addrsig_sym glfwSwapBuffers
	.addrsig_sym ViperThreadWorker
	.addrsig_sym ViperThreadCreateWorker
	.addrsig_sym clone
	.addrsig_sym ViperThreadForemanAssignTasks
	.addrsig_sym calloc
	.addrsig_sym malloc
	.addrsig_sym glfwMakeContextCurrent
	.addrsig_sym glfwPollEvents
	.addrsig_sym glfwWindowShouldClose
	.addrsig_sym __stack_chk_fail
	.addrsig_sym __tasksOpenGL
	.addrsig_sym __taskCountOpenGL
	.addrsig_sym __tasks
	.addrsig_sym __taskCount
	.addrsig_sym __workerCount
