	.file	"dot_product.c"
	.text
	.globl	dot_product
	.type	dot_product, @function
dot_product:
	pushl	%ebp		# push base pointer onto stack
	movl	%esp, %ebp	# move stack pointer to base pointer
	subl	$20, %esp	# allocate space for local variables
	movl	.LC0, %eax	# store 0 (float) in eax
	movl	%eax, -8(%ebp)	# move the 0 (float) to (epb-8), where result lives
	movl	$0, -4(%ebp)	# move a 0 into (ebp-4), where i lives
	jmp	.L2		# goto .L2
.L3:
	movl	-4(%ebp), %eax	# put i in eax
	leal	0(,%eax,4), %edx # compute offset to use in getting array element
	movl	8(%ebp), %eax	# put (ebp+8) v1, the address of the array 1 in eax
	addl	%edx, %eax	# address of current element of array 1 in eax
	flds	(%eax)		# load the value at that address into fp register
	movl	-4(%ebp), %eax	# move i (ebp-4) into eax
	leal	0(,%eax,4), %edx # compute offset to use in getting array element
	movl	12(%ebp), %eax	# put (ebp+12) v2, the address of array 2, in eax
	addl	%edx, %eax	# address of current element of arr 2 in eax
	flds	(%eax)		# load the value into fp register
	fmulp	%st, %st(1)	# multiply the two elements, free st
	flds	-8(%ebp)	# load result into st
	faddp	%st, %st(1)	# add, store in st(1), free st
	fstps	-8(%ebp)	# store st(1) in (ebp-8), where result lives
	addl	$1, -4(%ebp)	# add 1 to i
.L2:
	movl	-4(%ebp), %eax	# put i in eax
	cmpl	16(%ebp), %eax	# if i is less than length (ebp+16)
	jl	.L3			# goto .L3
	movl	-8(%ebp), %eax	
	movl	%eax, -20(%ebp)	
	flds	-20(%ebp)
	leave
	ret
	.size	dot_product, .-dot_product
	.section	.rodata
	.align 4
.LC0:
	.long	0
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
