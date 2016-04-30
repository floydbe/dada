	.file	"dot_product.c"
	.text
	.p2align 4,,15
	.globl	dot_product
	.type	dot_product, @function
dot_product:
.LFB0:
	.cfi_startproc
	movl	12(%esp), %ecx
	cmpl	$3, %ecx
	jle	.L5
	movl	4(%esp), %eax
	fldz
	movl	8(%esp), %edx
	leal	-16(,%ecx,4), %ecx
	fld	%st(0)
	andl	$-16, %ecx
	fld	%st(1)
	leal	16(%eax,%ecx), %ecx
	fld	%st(2)
	.p2align 4,,10
	.p2align 3
.L4:
	flds	(%eax)
	addl	$16, %eax
	addl	$16, %edx
	fmuls	-16(%edx)
	faddp	%st, %st(1)
	flds	-12(%eax)
	fmuls	-12(%edx)
	faddp	%st, %st(2)
	flds	-8(%eax)
	fmuls	-8(%edx)
	faddp	%st, %st(3)
	flds	-4(%eax)
	fmuls	-4(%edx)
	cmpl	%ecx, %eax
	faddp	%st, %st(4)
	jne	.L4
	faddp	%st, %st(1)
	faddp	%st, %st(1)
	faddp	%st, %st(1)
	ret
.L5:
	fldz
	ret
	.cfi_endproc
.LFE0:
	.size	dot_product, .-dot_product
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
