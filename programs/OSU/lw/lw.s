.section .text
.global _start
_start:
	li t0, 0x0002
	li t1, 0x2002
	li s1, 0xF2
	add t2, t0, t1
	sw t2, 0x0(s1)
	lw t3, 0x0(s1)
	ecall
	
