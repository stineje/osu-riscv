.section .text
.global _start
_start:
	li t0, 0x1A		# Load the immediate value 0 into temp register 0
	xori t1, t0, 0x000000FF	# Add immediate to temp register 0 and store in 1
	ecall

