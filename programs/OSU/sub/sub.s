.section .text
.global _start
_start:
	li t0, 0x1F9		# Load the immediate value 1 into temp reg 0
	li t1, 0x33C		# Load the immediate value 2 into temp reg 1
	sub t2, t0, t1	# Add temp registers 0 and 1 and store in 2
	ecall

