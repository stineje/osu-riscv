.section .text
.global _start
_start:
	li t0, 0x0002
	li t1, 0xF002
	li s1, 0xF0
	add t2, t0, t1
	sw t2, 0x0(s1)
	lw t3, 0x0(s1)
	add t4, x0, t3
	li t4, 0x0
	li x11, 0x0
	lb t4, 0x0(s1)
	lb x11, 0x1(s1)	
	ecall
	
