.section .text
.global _start
_start:
	li t0, 0x1		# Load the immediate value 1 into temp reg 0
	li t1, 0x3		# Load the immediate value 2 into temp reg 1
	slt t2, t0, t1
	slt t3, t1, t0
	ecall

