	.text
	.intel_syntax noprefix
	.file	"allocator.c"
	.globl	InitAllocator                   # -- Begin function InitAllocator
	.p2align	4, 0x90
	.type	InitAllocator,@function
InitAllocator:                          # @InitAllocator
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rsi, qword ptr [rbp - 8]
	xor	eax, eax
	mov	r9d, eax
	mov	edx, 2
	mov	ecx, 1
	xor	r8d, r8d
	mov	rdi, r9
	call	mmap@PLT
	mov	qword ptr [rip + __heapStatic], rax
	mov	rsi, qword ptr [rbp - 16]
	xor	eax, eax
	mov	r9d, eax
	mov	edx, 2
	mov	ecx, 1
	xor	r8d, r8d
	mov	rdi, r9
	call	mmap@PLT
	mov	qword ptr [rip + __heapDynamic], rax
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	InitAllocator, .Lfunc_end0-InitAllocator
	.cfi_endproc
                                        # -- End function
	.globl	DynamicAllocation               # -- Begin function DynamicAllocation
	.p2align	4, 0x90
	.type	DynamicAllocation,@function
DynamicAllocation:                      # @DynamicAllocation
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	xor	eax, eax
                                        # kill: def $rax killed $eax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	DynamicAllocation, .Lfunc_end1-DynamicAllocation
	.cfi_endproc
                                        # -- End function
	.globl	StaticAllocation                # -- Begin function StaticAllocation
	.p2align	4, 0x90
	.type	StaticAllocation,@function
StaticAllocation:                       # @StaticAllocation
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	xor	eax, eax
                                        # kill: def $rax killed $eax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end2:
	.size	StaticAllocation, .Lfunc_end2-StaticAllocation
	.cfi_endproc
                                        # -- End function
	.globl	StaticHugeAllocation            # -- Begin function StaticHugeAllocation
	.p2align	4, 0x90
	.type	StaticHugeAllocation,@function
StaticHugeAllocation:                   # @StaticHugeAllocation
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	xor	eax, eax
                                        # kill: def $rax killed $eax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end3:
	.size	StaticHugeAllocation, .Lfunc_end3-StaticHugeAllocation
	.cfi_endproc
                                        # -- End function
	.globl	DynamicHugeAllocation           # -- Begin function DynamicHugeAllocation
	.p2align	4, 0x90
	.type	DynamicHugeAllocation,@function
DynamicHugeAllocation:                  # @DynamicHugeAllocation
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	xor	eax, eax
                                        # kill: def $rax killed $eax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end4:
	.size	DynamicHugeAllocation, .Lfunc_end4-DynamicHugeAllocation
	.cfi_endproc
                                        # -- End function
	.globl	Allocate                        # -- Begin function Allocate
	.p2align	4, 0x90
	.type	Allocate,@function
Allocate:                               # @Allocate
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	xor	eax, eax
                                        # kill: def $rax killed $eax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end5:
	.size	Allocate, .Lfunc_end5-Allocate
	.cfi_endproc
                                        # -- End function
	.globl	Reallocate                      # -- Begin function Reallocate
	.p2align	4, 0x90
	.type	Reallocate,@function
Reallocate:                             # @Reallocate
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	xor	eax, eax
                                        # kill: def $rax killed $eax
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end6:
	.size	Reallocate, .Lfunc_end6-Reallocate
	.cfi_endproc
                                        # -- End function
	.globl	FreeStatic                      # -- Begin function FreeStatic
	.p2align	4, 0x90
	.type	FreeStatic,@function
FreeStatic:                             # @FreeStatic
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
.Lfunc_end7:
	.size	FreeStatic, .Lfunc_end7-FreeStatic
	.cfi_endproc
                                        # -- End function
	.globl	FreeDynamic                     # -- Begin function FreeDynamic
	.p2align	4, 0x90
	.type	FreeDynamic,@function
FreeDynamic:                            # @FreeDynamic
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
	.size	FreeDynamic, .Lfunc_end8-FreeDynamic
	.cfi_endproc
                                        # -- End function
	.type	__heapStatic,@object            # @__heapStatic
	.local	__heapStatic
	.comm	__heapStatic,8,8
	.type	__heapDynamic,@object           # @__heapDynamic
	.local	__heapDynamic
	.comm	__heapDynamic,8,8
	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym mmap
	.addrsig_sym __heapStatic
	.addrsig_sym __heapDynamic
