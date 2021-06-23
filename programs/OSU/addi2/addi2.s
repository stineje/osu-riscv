.section .text
.global _start
_start:
	li t0, 0x01FA
	li t1, 0x389
	li s10, 0x10C
	li t5, 0xEEF
	li ra, 0x159
	li t0, 0x5AA
	addi t2, t0, 0x000000FF
	add  a5, t1, s10
	ecall

