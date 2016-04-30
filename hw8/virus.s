	.file	"virus.c"
	.section	.rodata
	.align 4
.LC0:
	.string	"You have been infected with the Cavman virus!"
	.text
	.globl	VirusCode
	.type	VirusCode, @function
VirusCode:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$.LC0, (%esp)
	call	puts
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	VirusCode, .-VirusCode
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
