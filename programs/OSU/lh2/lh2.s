.section .text
.global _start
_start:
	li t0, 0x02
	li t1, 0xF2
	li s1, 0xF2
	add t2, t0, t1
	sw t2, 0x0(s1)
	lw t3, 0x0(s1)
	add t4, x0, t3
	lh t4, 0x0(s1)
	lh x11, 0x0(t4)	
	ecall
	
