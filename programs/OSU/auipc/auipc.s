.section .text
.global _start
_start:
	li t0, 0x0		# Load the immediate value 0 into temp register 0
	addi t1, t0, 0x000000FF	# Add immediate to temp register 0 and store in 1
	auipc t2, 0x3C		# Try auipc
	ecall

