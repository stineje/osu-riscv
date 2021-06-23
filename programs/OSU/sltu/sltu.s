.section .text
.global _start
_start:
	addi x2, x0, -1
	li t0, 0x1		# Load the immediate value 1 into temp reg 0
	slt t2, t0, x2
	sltu t3, t0, x2
	ecall

