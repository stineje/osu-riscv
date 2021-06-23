.section .text
.global _start
_start:
	li t0, 0x1323998
	li t1, 0x7F37998
	add t2, t0, t1		# Add temp registers 0 and 1 and store in 2
	sw t2, 0x8(x0)		# Store temp register 2 in Mem[0x8]
	nop
	lw t3, 0x8(x0)
	nop
	ecall
	
