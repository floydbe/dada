	.file	"dot_product.c"
	.intel_syntax noprefix
	.text
	.globl	dot_product
	.type	dot_product, @function
dot_product:
	push	ebp
	mov	ebp, esp
	sub	esp, 20
	mov	eax, DWORD PTR .LC0
	mov	DWORD PTR [ebp-8], eax
	mov	DWORD PTR [ebp-4], 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [0+eax*4]	# maybe don't need?
	mov	eax, DWORD PTR [ebp+8]	# v1 in eax	
	mov	ebx, DWORD PTR [ebp+12]	# v2 in ebx
	movups	xmm0, [eax]	
	movups	xmm1, [ebx]
	addps
	add	eax, edx		
	fld	DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, edx
	fld	DWORD PTR [eax]
	fmulp	st(1), st
	fld	DWORD PTR [ebp-8]
	faddp	st(1), st
	fstp	DWORD PTR [ebp-8]
	add	DWORD PTR [ebp-4], 1
.L2:
	mov	eax, DWORD PTR [ebp-4]
	cmp	eax, DWORD PTR [ebp+16]
	jl	.L3
	mov	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR [ebp-20], eax
	fld	DWORD PTR [ebp-20]
	leave
	ret
	.size	dot_product, .-dot_product
	.section	.rodata
	.align 4
.LC0:
	.long	0
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
