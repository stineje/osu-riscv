.section .text
.global _start
_start:
	lui t0, 0x0002
	lui t1, 0x2002
	lui ra, 0x4002
	ecall
	
