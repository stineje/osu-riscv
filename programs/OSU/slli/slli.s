.section .text
.global _start
_start:
	li t0, 240
	li t1, -240
	slli t0, t0, 3
	slli t1, t1, 7
	ecall
	
