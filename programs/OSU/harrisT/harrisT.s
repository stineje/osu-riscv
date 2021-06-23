.section .text
.global _start
_start:

# Harris/Harris test program adapted for RISC-V (from MIPS)
# Test the MIPS processor.  
# add, sub, and, or, slt, addi, lw, sw, beq, j
# If successful, it should write the value 7 to address 84

main:   addi x2, x0, 5  	# initialize x2 = 5     
        addi x3, x0, 12		# initialize x3 = 12    
        addi x7, x3, -9		# initialize x7 = 3     
        or   x4, x7, x2		# x4 <= 3 or 5 = 7
        and  x5, x3, x4		# x5 <= 12 and 7 = 4    
        add  x5, x5, x4		# x5 = 4 + 7 = 11       
        beq  x5, x7, end	# shouldn't be taken    
        slt  x4, x3, x4		# x4 = 12 < 7 = 0       
        beq  x4, x0, around	# should be taken       
        addi x5, x0, 0		# shouldn't happen      
around: slt  x4, x7, x2		# x4 = 3 < 5 = 1        
        add  x7, x4, x5		# x7 = 1 + 11 = 12
        sub  x7, x7, x2		# x7 = 12 - 5 = 7       
        sw   x7, 68(x3)		# [68+12] = [80] = 7              
        lw   x2, 80(x0)		# x2 = [80] = 7         
        j    end		# should be taken       
        addi x2, zero, 1	# shouldn't happen      
end:    sw   x2, 84(x0)		# write adr 84 = 7      
	ecall
