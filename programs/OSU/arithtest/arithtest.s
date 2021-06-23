.section .text
.global _start
_start:
	li t0, 0x1			# R5 = 1
	li t1, 0x3			# R6 = 3
	add s2, t1, t0			# R18 = 3+1 <= 4
	li s3, 0xb 			# R19 = 11
	or s4, s3, s2 			# R20 = 0xB | 0x4 <= 15
	and s5, s4, s2 			# R21 = 0xF | 0x4 <= 4
	sub s6, s4, t1 			# R22 = 15 - 3 = 12
	addi s4, s5, 0x7ff 		# R20 = 7ff + 4 = 803
	sw s4, 0x8(x0) 			# R20 = Store 803
	lw s5, 0x8(x0) 			# R21 = Load 803
	add s6, s4, s5 			# R22 = 803 + 803 = 1006
	or s7, s5, s6 			# R23 = 803 | 1006 = 1807
	li s8, 0x0			# R24 = 0
	beq s4, s5, end			# R20==R21? goto end (yes)
	addi s8,s8, 0x8 		# don't execute

end:
	
	addi s8, s8, 0x1 		# R24 = 0+1
	ecall
#####
#This program should put 1 into s8 if it is run correctly. If there is a 9 in s8 that means something probably broke
####	
