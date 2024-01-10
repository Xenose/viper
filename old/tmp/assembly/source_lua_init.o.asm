	.text
	.intel_syntax noprefix
	.file	"init.c"
	.globl	LuaInit                         # -- Begin function LuaInit
	.p2align	4, 0x90
	.type	LuaInit,@function
LuaInit:                                # @LuaInit
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	mov	byte ptr [rbp - 1], 1
	mov	al, byte ptr [rbp - 1]
	xchg	byte ptr [rip + _accessingState], al
	mov	byte ptr [rbp - 2], al
	test	byte ptr [rbp - 2], 1
	je	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_1
.LBB0_3:
	call	luaL_newstate@PLT
	mov	qword ptr [rip + _luaState], rax
	mov	rdi, qword ptr [rip + _luaState]
	call	luaL_openlibs@PLT
	mov	byte ptr [rbp - 3], 0
	mov	al, byte ptr [rbp - 3]
	mov	byte ptr [rip + _accessingState], al
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	movsx	eax, al
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	LuaInit, .Lfunc_end0-LuaInit
	.cfi_endproc
                                        # -- End function
	.globl	LuaUnload                       # -- Begin function LuaUnload
	.p2align	4, 0x90
	.type	LuaUnload,@function
LuaUnload:                              # @LuaUnload
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	mov	byte ptr [rbp - 1], 1
	mov	al, byte ptr [rbp - 1]
	xchg	byte ptr [rip + _accessingState], al
	mov	byte ptr [rbp - 2], al
	test	byte ptr [rbp - 2], 1
	je	.LBB1_3
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_1
.LBB1_3:
	mov	rdi, qword ptr [rip + _luaState]
	call	lua_close@PLT
	mov	byte ptr [rbp - 3], 0
	mov	al, byte ptr [rbp - 3]
	mov	byte ptr [rip + _accessingState], al
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	movsx	eax, al
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	LuaUnload, .Lfunc_end1-LuaUnload
	.cfi_endproc
                                        # -- End function
	.globl	LuaHelloWorld                   # -- Begin function LuaHelloWorld
	.p2align	4, 0x90
	.type	LuaHelloWorld,@function
LuaHelloWorld:                          # @LuaHelloWorld
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	lea	rax, [rip + .L.str]
	mov	qword ptr [rbp - 8], rax
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	mov	byte ptr [rbp - 9], 1
	mov	al, byte ptr [rbp - 9]
	xchg	byte ptr [rip + _accessingState], al
	mov	byte ptr [rbp - 10], al
	test	byte ptr [rbp - 10], 1
	je	.LBB2_3
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_1
.LBB2_3:
	mov	rdi, qword ptr [rip + _luaState]
	lea	rsi, [rip + .L.str]
	call	luaL_loadstring@PLT
	mov	ecx, eax
	xor	eax, eax
	cmp	eax, ecx
	jne	.LBB2_7
# %bb.4:
	mov	rdi, qword ptr [rip + _luaState]
	xor	ecx, ecx
	xor	eax, eax
	mov	r9d, eax
	mov	esi, ecx
	mov	edx, ecx
	mov	r8, r9
	call	lua_pcallk@PLT
	mov	ecx, eax
	xor	eax, eax
	cmp	eax, ecx
	jne	.LBB2_6
# %bb.5:
	mov	rax, qword ptr [rip + _luaState]
	mov	qword ptr [rbp - 24], rax       # 8-byte Spill
	mov	rdi, qword ptr [rip + _luaState]
	call	lua_gettop@PLT
	mov	rdi, qword ptr [rbp - 24]       # 8-byte Reload
	xor	esi, esi
	sub	esi, eax
	sub	esi, 1
	call	lua_settop@PLT
.LBB2_6:
	jmp	.LBB2_7
.LBB2_7:
	mov	byte ptr [rbp - 11], 0
	mov	al, byte ptr [rbp - 11]
	mov	byte ptr [rip + _accessingState], al
	add	rsp, 32
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end2:
	.size	LuaHelloWorld, .Lfunc_end2-LuaHelloWorld
	.cfi_endproc
                                        # -- End function
	.globl	LuaLoadApi                      # -- Begin function LuaLoadApi
	.p2align	4, 0x90
	.type	LuaLoadApi,@function
LuaLoadApi:                             # @LuaLoadApi
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	mov	byte ptr [rbp - 1], 1
	mov	al, byte ptr [rbp - 1]
	xchg	byte ptr [rip + _accessingState], al
	mov	byte ptr [rbp - 2], al
	test	byte ptr [rbp - 2], 1
	je	.LBB3_3
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_1
.LBB3_3:
	mov	rdi, qword ptr [rip + _luaState]
	mov	rsi, qword ptr [rip + ViperLuaApiItoa@GOTPCREL]
	xor	edx, edx
	call	lua_pushcclosure@PLT
	mov	rdi, qword ptr [rip + _luaState]
	lea	rsi, [rip + .L.str.1]
	call	lua_setglobal@PLT
	mov	byte ptr [rbp - 3], 0
	mov	al, byte ptr [rbp - 3]
	mov	byte ptr [rip + _accessingState], al
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end3:
	.size	LuaLoadApi, .Lfunc_end3-LuaLoadApi
	.cfi_endproc
                                        # -- End function
	.type	_accessingState,@object         # @_accessingState
	.local	_accessingState
	.comm	_accessingState,1,1
	.type	_luaState,@object               # @_luaState
	.local	_luaState
	.comm	_luaState,8,8
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"print('Hello, World')"
	.size	.L.str, 22

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Itoa"
	.size	.L.str.1, 5

	.ident	"clang version 16.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym luaL_newstate
	.addrsig_sym luaL_openlibs
	.addrsig_sym lua_close
	.addrsig_sym luaL_loadstring
	.addrsig_sym lua_pcallk
	.addrsig_sym lua_settop
	.addrsig_sym lua_gettop
	.addrsig_sym lua_pushcclosure
	.addrsig_sym ViperLuaApiItoa
	.addrsig_sym lua_setglobal
	.addrsig_sym _accessingState
	.addrsig_sym _luaState
