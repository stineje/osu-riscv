.section .text
.global _start
_start:

# Harris/Harris test program adapted for RISC-V (from MIPS)
# Test the MIPS processor.  
# add, sub, and, or, slt, addi, lw, sw, beq, j
# If successful, it should write the value 7 to address 84

main:   addi x2, x0, 5  	# initialize $2 = 5
	lui x2, 0xEFE		# x2 = 0x0x0EFE_0000
	sll x2, x2, 8		# x2 = 0xEFE0_0000
	jal fwd
        addi x3, x0, 14		# not executed
back:	ble x2, x0, here	# should be taken
fwd:	addi x3, ra, -4		# x3 <= ra - 4 = 12
	j back
here:	addi x7, x3, -9		# initialize x7 = 3
	addi x6, x0, 5		# initialize x6 = 5 
        or   x4, x7, x6		# x4 <= 3 or x5 = 7      
        and  x5, x3, x4		# x5 <= 12 and x3 = 4    
        add  x5, x5, x4		# x5 = 4 + 7 = 11       
        beq  x5, x7, end	# shouldn't be taken
	slti x4, x3, 7		# x4 = 12 < 7 = 0
        beq  x4, x0, around	# should be taken       
        addi x5, x0, 0		# shouldn't happen      
around: slti x4, x7, 5		# x4 = 3 < 5 = 1        
        add x7, x4, x5		# x7 = 1 + 11 = 12
        sub x7, x7, x6		# x7 = 12 - 5 = 7
        sw x7, 68(x3)		# [68+12] = [80] = 7
	sw x2, 88(x0)		# [88] = 0xEFE0_0000
        lw   x2, 80(x0)		# x2 = [80] = 7
	li x3, 0xFFFFEFE0	# original program used lh
        j    end		# should be taken       
        addi x2, zero, 1	# shouldn't happen      
end:	sub x8, x2, x3		# x8 = 7 - (-4128) = 4135
	sw   x8, 92(x0)		# write adr 92 = 4135
	ecall
