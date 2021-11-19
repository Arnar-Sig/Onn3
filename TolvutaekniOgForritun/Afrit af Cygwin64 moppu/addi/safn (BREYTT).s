safn:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L2
.L3:
	movq	-8(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	addq	%rax, -16(%rbp)
	addq	$1, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jl	.L3
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	ret
