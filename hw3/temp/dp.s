	.file	"dot_product.c"
# GNU C (Ubuntu 4.8.4-2ubuntu1~14.04) version 4.8.4 (i686-linux-gnu)
#	compiled by GNU C version 4.8.4, GMP version 5.1.3, MPFR version 3.1.2-p3, MPC version 1.0.1
# GGC heuristics: --param ggc-min-expand=80 --param ggc-min-heapsize=95399
# options passed:  -imultiarch i386-linux-gnu dot_product.c -m32
# -march=corei7 -msse -auxbase-strip dp.s -O3 -ftree-vectorizer-verbose=7
# -fverbose-asm -fstack-protector -Wformat -Wformat-security
# options enabled:  -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcaller-saves -fcombine-stack-adjustments -fcommon -fcompare-elim
# -fcprop-registers -fcrossjumping -fcse-follow-jumps -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdwarf2-cfi-asm
# -fearly-inlining -feliminate-unused-debug-types -fexpensive-optimizations
# -fforward-propagate -ffunction-cse -fgcse -fgcse-after-reload -fgcse-lm
# -fgnu-runtime -fgnu-unique -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics -finline-functions
# -finline-functions-called-once -finline-small-functions -fipa-cp
# -fipa-cp-clone -fipa-profile -fipa-pure-const -fipa-reference -fipa-sra
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fivopts -fkeep-static-consts -fleading-underscore -fmath-errno
# -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
# -fomit-frame-pointer -foptimize-register-move -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpcc-struct-return -fpeephole
# -fpeephole2 -fpredictive-commoning -fprefetch-loop-arrays -free -fregmove
# -freorder-blocks -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-insns2 -fshow-column -fshrink-wrap
# -fsigned-zeros -fsplit-ivs-in-unroller -fsplit-wide-types
# -fstack-protector -fstrict-aliasing -fstrict-overflow
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop
# -ftree-copyrename -ftree-cselim -ftree-dce -ftree-dominator-opts
# -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-distribute-patterns
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-partial-pre
# -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc -ftree-scev-cprop
# -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vect-loop-version -ftree-vectorize -ftree-vrp -funit-at-a-time
# -funswitch-loops -funwind-tables -fvect-cost-model -fverbose-asm
# -fzero-initialized-in-bss -m32 -m80387 -m96bit-long-double
# -maccumulate-outgoing-args -malign-stringops -mcx16 -mfancy-math-387
# -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp -mlong-double-80 -mmmx
# -mno-red-zone -mpopcnt -mpush-args -msahf -msse -msse2 -msse3 -msse4
# -msse4.1 -msse4.2 -mssse3 -mtls-direct-seg-refs

	.text
	.p2align 4,,15
	.globl	dot_product
	.type	dot_product, @function
dot_product:
.LFB0:
	.cfi_startproc
	movl	12(%esp), %ecx	# length, length
	cmpl	$3, %ecx	#, length
	jle	.L5	#,
	movl	4(%esp), %eax	# v1, ivtmp.8
	fldz
	movl	8(%esp), %edx	# v2, ivtmp.10
	leal	-16(,%ecx,4), %ecx	#, D.1890
	fld	%st(0)	#
	andl	$-16, %ecx	#, D.1890
	fld	%st(1)	#
	leal	16(%eax,%ecx), %ecx	#, D.1890
	fld	%st(2)	#
	.p2align 4,,10
	.p2align 3
.L4:
	flds	(%eax)	# MEM[base: _44, offset: 0B]
	addl	$16, %eax	#, ivtmp.8
	addl	$16, %edx	#, ivtmp.10
	fmuls	-16(%edx)	# MEM[base: _45, offset: 0B]
	faddp	%st, %st(1)	#,
	flds	-12(%eax)	# MEM[base: _44, offset: 4B]
	fmuls	-12(%edx)	# MEM[base: _45, offset: 4B]
	faddp	%st, %st(2)	#,
	flds	-8(%eax)	# MEM[base: _44, offset: 8B]
	fmuls	-8(%edx)	# MEM[base: _45, offset: 8B]
	faddp	%st, %st(3)	#,
	flds	-4(%eax)	# MEM[base: _44, offset: 12B]
	fmuls	-4(%edx)	# MEM[base: _45, offset: 12B]
	cmpl	%ecx, %eax	# D.1890, ivtmp.8
	faddp	%st, %st(4)	#,
	jne	.L4	#,
	faddp	%st, %st(1)	#,
	faddp	%st, %st(1)	#,
	faddp	%st, %st(1)	#,
	ret
.L5:
	fldz
	ret
	.cfi_endproc
.LFE0:
	.size	dot_product, .-dot_product
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
