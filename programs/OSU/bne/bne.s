.section .text
.global _start
_start:
	li x10, 5		# R10 = 5
	li x19, 5		# R19 = 5
	li x18, 0		# R18 = 0
loop:
	bne	x19, x10, end	
	add x18, x18, x10	# R18=0+5
	addi x19, x19, 1	# R19=5+1
	j loop			
end:
	addi t0, x0, 0xAA	# R5=0xAA
	ecall
	
