.section .text
.global _start
_start:
	li x1, 0
	li x2, 0
	li x3, 0
	li x4, 0
	li x5, 0
	li x6, 0
	li x7, 0
	li x8, 0
	li x9, 0
	li x10, 0
	li x11, 0
	li x12, 0
	li x13, 0
	li x14, 0
	li x15, 0
	li x16, 0
	li x17, 0
	li x18, 0
	li x19, 0
	li x20, 0
	li x21, 0
	li x22, 0
	li x23, 0
	li x24, 0
	li x25, 0
	li x26, 0
	li x27, 0
	li x28, 0
	li x29, 0
	li x30, 0
	li x31, 0
	

	li t0, 0x331		# Load the immediate value 1 into temp reg 0
	li t1, 0x15		# Load the immediate value 2 into temp reg 1
gcd:	beq t0, t1, exit	# if a==b, go to end
	slt t2, t0, t1		# is a < b
	bne t2, x0, L1		# If yes, goto L1
	sub t0, t0, t1		# a = a - b
	j gcd			# repeat
L1:	sub t1, t1, t0		# b = b - a
	j gcd			# repeate
exit:	add x1, t0, x0		# store result
	ecall
	
	

