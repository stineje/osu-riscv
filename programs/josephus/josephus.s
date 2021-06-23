.file	"josephus.c"
.option nopic
.attribute arch, "rv32i2p0"
.attribute unaligned_access, 0
.attribute stack_align, 16
.text
.align	2
.globl	main
.type	main, @function
main:
    addi	sp,sp,-32
    sw	ra,28(sp)
    sw	s0,24(sp)
    addi	s0,sp,32
    li	a5, 16        #input number
    addi	a5,a5,-1274
    sw	a5,-20(s0)
    lw	a5,-20(s0)
    slli	a5,a5,1
    mv	a0,a5
    call	highestBit

    sw	a0,-24(s0)
    lw	a5,-24(s0)
    not	a4,a5
    lw	a5,-20(s0)
    slli	a5,a5,1
    ori	a5,a5,1
    and	a5,a4,a5
    sw	a5,-28(s0) #output
    li	a5,0
    mv	a0,a5
    lw	ra,28(sp)
    lw	s0,24(sp)
    addi	sp,sp,32
    jr	ra

.align	2
.globl	highestBit
highestBit:          #the highestBit function runs through the number in binary and
    addi	sp,sp,-32  #looks for the largest
    sw	s0,28(sp)
    addi	s0,sp,32
    sw	a0,-20(s0)
    lw	a5,-20(s0)

    srai	a5,a5,1
    lw	a4,-20(s0)
    or	a5,a4,a5
    sw	a5,-20(s0)
    lw	a5,-20(s0)

    srai	a5,a5,2
    lw	a4,-20(s0)
    or	a5,a4,a5
    sw	a5,-20(s0)
    lw	a5,-20(s0)

    srai	a5,a5,4
		lw	a4,-20(s0)
		or	a5,a4,a5
 		sw	a5,-20(s0)
	  lw	a5,-20(s0)

		srai	a5,a5,8
		lw	a4,-20(s0)
		or	a5,a4,a5
 		sw	a5,-20(s0)
		lw	a5,-20(s0)

    srai	a5,a5,16
    lw	a4,-20(s0)
  	or	a5,a4,a5
    sw	a5,-20(s0)
    lw	a5,-20(s0)

    srai	a5,a5,1
    lw	a4,-20(s0)
   	sub	a5,a4,a5
  	mv	a0,a5
		lw	s0,28(sp)
 		addi	sp,sp,32
 		jr	ra

.size	highestBit, .-highestBit
.ident	"GCC: (GNU) 9.2.0"
