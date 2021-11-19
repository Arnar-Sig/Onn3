	.file	"div2k.c"
	.text
	.globl	div2k
	.def	div2k;	.scl	2;	.type	32;	.endef
	.seh_proc	div2k
div2k:
	.seh_endprologue
	movl	%ecx, %eax
	movl	%edx, %ecx
	cltd
	movl	$1, %r8d
	sall	%cl, %r8d
	subl	$1, %r8d
	andl	%r8d, %edx
	addl	%edx, %eax
	sarl	%cl, %eax
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
