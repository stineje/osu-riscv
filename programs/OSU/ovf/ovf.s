.section .text
.global _start
_start:
	lui  x1, 0x80000
	addi x2, x0, -1
	xor x2, x2, x1
	li x1, 0x1
	add x3, x2, x1

	slti t3, x1, 0
	slt t4, x3, x2
	bne t3, t4, overflow
	addi x4, x0, 0x3
	ecall
overflow:
	addi x4, x0, 0x7FF	
	ecall

