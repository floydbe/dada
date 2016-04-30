	.file	"dot_product.c"
	.text
	.globl	dot_product
	.type	dot_product, @function
dot_product:
	pushl	%ebp	#
	movl	%esp, %ebp	#,
	subl	$20, %esp	#,
	movl	.LC0, %eax	#, tmp70
	movl	%eax, -8(%ebp)	# tmp70, result
	movl	$0, -4(%ebp)	#, i
	jmp	.L2	#
.L3:
	movl	-4(%ebp), %eax	# i, i.0
	leal	0(,%eax,4), %edx	#, D.1391
	movl	8(%ebp), %eax	# v1, tmp71
	addl	%edx, %eax	# D.1391, D.1392
	flds	(%eax)	# *_9
	movl	-4(%ebp), %eax	# i, i.1
	leal	0(,%eax,4), %edx	#, D.1391
	movl	12(%ebp), %eax	# v2, tmp72
	addl	%edx, %eax	# D.1391, D.1392
	flds	(%eax)	# *_14
	fmulp	%st, %st(1)	#,
	flds	-8(%ebp)	# result
	faddp	%st, %st(1)	#,
	fstps	-8(%ebp)	# result
	addl	$1, -4(%ebp)	#, i
.L2:
	movl	-4(%ebp), %eax	# i, tmp75
	cmpl	16(%ebp), %eax	# length, tmp75
	jl	.L3	#,
	movl	-8(%ebp), %eax	# result, D.1393
	movl	%eax, -20(%ebp)	# D.1393, %sfp
	flds	-20(%ebp)	# %sfp
	leave
	ret
	.size	dot_product, .-dot_product
	.section	.rodata
	.align 4
.LC0:
	.long	0
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
