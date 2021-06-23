.section .text
.global _start
_start:
	li t0, 0x0002
	li t1, 0x2002
	li ra, 0x4002
	ecall
	
