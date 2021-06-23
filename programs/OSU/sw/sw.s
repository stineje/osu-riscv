.section .text
.global _start
_start:
	li t0, 0x1		# Load the immediate value 1 into temp reg 0
	li t1, 0x3		# Load the immediate value 2 into temp reg 1
	add t2, t0, t1		# Add temp registers 0 and 1 and store in 2
	sw t2, 0x8(x0)		# Store temp register 2 in Mem[0x8]
	nop
	lw t3, 0x8(x0)
	nop
	ecall
	
