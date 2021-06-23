.section .text
.global _start
_start:
	li t0, 0xC98	
	li t1, 0x30F	
	or t2, t0, t1	
	ecall

