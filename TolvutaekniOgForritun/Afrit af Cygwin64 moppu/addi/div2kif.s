	.fSile	"div2kif.c"
	.text
	.globl	div2kif
	.def	div2kif;	.scl	2;	.type	32;	.endef
	.seh_proc	div2kif
div2kif:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	movaps	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	.seh_endprologue
	movl	%ecx, %ebx
	pxor	%xmm6, %xmm6
	cvtsi2sdl	%edx, %xmm6
	movapd	%xmm6, %xmm1
	movsd	.LC0(%rip), %xmm0
	call	pow
	subsd	.LC1(%rip), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	testl	%ebx, %ebx
	jg	.L4
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%ebx, %xmm1
	divss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %eax
.L1:
	movaps	32(%rsp), %xmm6
	addq	$48, %rsp
	popq	%rbx
	ret
.L4:
	movapd	%xmm6, %xmm1
	movsd	.LC0(%rip), %xmm0
	call	pow
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cvttss2sil	%xmm0, %eax
	jmp	.L1
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1073741824
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.ident	"GCC: (GNU) 11.2.0"
	.def	pow;	.scl	2;	.type	32;	.endef
