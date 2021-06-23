.section .text
.global _start
_start:
	li t0, 240
	li t1, -240
	li t3, 4
	sra t0, t0, t3
	sra t1, t1, t3
	ecall
	
