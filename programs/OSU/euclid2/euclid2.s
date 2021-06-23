.section .text
.global _start
_start:
	li t0, 0x6f9		# Load the immediate value 1 into temp reg 0
	li t1, 0x222		# Load the immediate value 2 into temp reg 1
gcd:	beq t0, t1, exit	# if a==b, go to end
	slt t2, t0, t1		# is a < b
	bne t2, x0, L1		# If yes, goto L1
	sub t0, t0, t1		# a = a - b
	j gcd			# repeat
L1:	sub t1, t1, t0		# b = b - a
	j gcd			# repeate
exit:	add x1, t0, x0		# store result
	ecall
	
	
	

