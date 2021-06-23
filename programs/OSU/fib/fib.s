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


	li t3, 0x26		# Load the value of n for F[n]
	li t2, 0x0		# initialize
	li t1, 0x1		# Load F[1] = 1 
	li t0, 0x0		# Load F[0] = 0
fib:
	beq t3, x0, finish	# branch if done
	add t2, t1, t0		# F[n] = F[n-1] + F[n-2]
	mv t0, t1		# move F[n-2] = F[n-1]	
	mv t1, t2		# move F[n] = F[n-1]
	addi t3, t3, -1
	j fib
finish:
	# try the I/O interface
	# write a number
	li t2, 0xF
	jal ra, fun1
	sw t2, 0xFFFFFFFC(x0)
	
	ecall
	



fun1:
	jr ra
