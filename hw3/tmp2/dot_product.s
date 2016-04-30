	.file	"dot_product.c"
	.text
	.globl	dot_product
	.type	dot_product, @function
dot_product:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	.LC0, %eax
	movl	%eax, -8(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L2
.L3:
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fmulp	%st, %st(1)
	flds	-8(%ebp)
	faddp	%st, %st(1)
	fstps	-8(%ebp)
	addl	$1, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L3
	movl	-8(%ebp), %eax
	movl	%eax, -20(%ebp)
	flds	-20(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	dot_product, .-dot_product
	.section	.rodata
	.align 4
.LC0:
	.long	0
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
