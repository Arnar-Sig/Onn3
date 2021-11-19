	.file	"safn.c"
	.text
	.globl	safn
	.def	safn;	.scl	2;	.type	32;	.endef
	.seh_proc	safn
safn:
	.seh_endprologue
	movl	$0, %r8d
	movl	$0, %eax
	jmp	.L2
.L3:
	leaq	(%rcx,%rax,2), %r9
	addq	%r9, %r8
	addq	$1, %rax
.L2:
	cmpq	%rdx, %rax
	jl	.L3
	movq	%r8, %rax
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	__main
	movl	$0, %eax
	addq	$40, %rsp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
