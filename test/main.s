	.file	"main.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$1666, %esp   
	xorl	%esi,  (%esi)
	xorl 	%esp,  (%esi)
	movl	$0, %eax
	popl	%ebp
	ret
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
