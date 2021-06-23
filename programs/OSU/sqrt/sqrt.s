.section .text
.global _start
_start:

	li t1, 0x13205		# initialize radicand
	mv t4, zero		# initalize answer
	addi t0, zero, 1
	sll t0, t0, 30		# shift to second-to-top bit

isqrt_bit:
	slt   t2, t1, t0     	# num < bit
	beq   t2, zero, isqrt_loop
	
	srl   t0, t0, 2       	# bit >> 2
	j     isqrt_bit

isqrt_loop:
	beq   t0, zero, isqrt_return
	
	add   t3, t4, t0     	# t3 = return + bit
	slt   t2, t1, t3
	beq   t2, zero, isqrt_else

	srl   t4, t4, 1       	# return >> 1
	j     isqrt_loop_end

isqrt_else:
	sub   t1, t1, t3     	# num -= return + bit
	srl   t4, t4, 1       	# return >> 1
	add   t4, t4, t0     	# return + bit
	
isqrt_loop_end:
	srl   t0, t0, 2       	# bit >> 2
	j     isqrt_loop

isqrt_return:
	ecall			# t4 = floor(sqrt($a0))
