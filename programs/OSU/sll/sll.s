.section .text
.global _start
_start:
	li t0, 240
	li t1, -240
	li t3, 4
	li t4, 8
	sll t0, t0, t3
	sll t1, t1, t4
	ecall
	
