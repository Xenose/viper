	.text
	.intel_syntax noprefix
	.file	"integer.c"
	.globl	ViperLuaApiItoa                 # -- Begin function ViperLuaApiItoa
	.p2align	4, 0x90
	.type	ViperLuaApiItoa,@function
ViperLuaApiItoa:                        # @ViperLuaApiItoa
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
	mov	qword ptr [rbp - 40], rdi
	mov	rdi, qword ptr [rbp - 40]
	mov	esi, 1
	call	luaL_checkinteger@PLT
	mov	qword ptr [rbp - 48], rax
	mov	rdi, qword ptr [rbp - 40]
	mov	esi, 2
	call	luaL_checkinteger@PLT
	mov	qword ptr [rbp - 56], rax
	mov	rdi, qword ptr [rbp - 40]
	mov	esi, 3
	call	luaL_checkinteger@PLT
                                        # kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 60], eax
	mov	rdi, qword ptr [rbp - 56]
	mov	esi, 1
	call	calloc@PLT
	mov	qword ptr [rbp - 72], rax
	mov	rdi, qword ptr [rbp - 48]
	mov	rsi, qword ptr [rbp - 72]
	mov	rdx, qword ptr [rbp - 56]
	mov	ecx, dword ptr [rbp - 60]
	call	ViperItoa@PLT
	mov	rcx, rax
	mov	rax, -1
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
.LBB0_2:
	mov	rdi, qword ptr [rbp - 40]
	mov	rsi, qword ptr [rbp - 72]
	call	lua_pushstring@PLT
	mov	rdi, qword ptr [rbp - 72]
	call	free@PLT
	mov	rax, qword ptr fs:[40]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	.LBB0_4
# %bb.3:
	mov	eax, 1
	add	rsp, 96
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB0_4:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	ViperLuaApiItoa, .Lfunc_end0-ViperLuaApiItoa
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Lua script failed to use ViperItoa"
	.size	.L.str, 35

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym luaL_checkinteger
	.addrsig_sym calloc
	.addrsig_sym ViperItoa
	.addrsig_sym __ViperLogger
	.addrsig_sym lua_pushstring
	.addrsig_sym free
	.addrsig_sym __stack_chk_fail
