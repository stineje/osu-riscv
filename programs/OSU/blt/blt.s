.section .text
.global _start
_start:
	li x10, 1
	li x19, 4
	li x18, 0
loop:
	blt	x19, x10, end
	add x18, x18, x10
	addi x19, x19, -2
	j loop
end:
	addi t0, x0, 0x000000AA
	ecall
	
