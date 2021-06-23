.file	"montecarlo.c"
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
li	a5,8192 #INPUT: number of plays
addi	a5,a5,1808 #***use this if value of play is >li available value***
sw	a5,-20(s0)
lw	a2,-20(s0)
li	a1,100 #INPUT: wager on each bet
li	a5,98304  #INPUT: Funds
addi	a0,a5,1696 #INPUT: Funds (Cont'd.)
call	play_game

sw	a0,-24(s0)
li	a5,0
mv	a0,a5
lw	ra,28(sp)
lw	s0,24(sp)
addi	sp,sp,32
jr	ra

.size	main, .-main
.globl	__modsi3
.align	2
.globl	bet
.type	bet, @function

bet:              #function that determines whether you've won the bet or not
addi	sp,sp,-32
sw	ra,28(sp)
sw	s0,24(sp)
addi	s0,sp,32
call	rand
mv	a5,a0
li	a1,100
mv	a0,a5
call	__modsi3
mv	a5,a0
addi	a5,a5,1
sw	a5,-20(s0)
lw	a4,-20(s0)
li	a5,51
bgt	a4,a5,.L4
li	a5,1
j	.L3

.L4:
lw	a4,-20(s0)

li	a5,51
ble	a4,a5,.L6
lw	a4,-20(s0)
li	a5,100
bgt	a4,a5,.L6
li	a5,0
j	.L3

.L6:

.L3:
mv	a0,a5
lw	ra,28(sp)
lw	s0,24(sp)
addi	sp,sp,32
jr	ra

.size	bet, .-bet
.align	2
.globl	play_game
.type	play_game, @function

play_game:  #Function that simulates mass gameplay. you bet the same amount each time, and the outcome of bet()
addi	sp,sp,-48 #function determines whether you won or lost money.
sw	ra,44(sp)
sw	s0,40(sp)
addi	s0,sp,48
sw	a0,-36(s0)
sw	a1,-40(s0)
sw	a2,-44(s0)
li	a5,1
sw	a5,-20(s0)
j	.L8

.L10:
call	bet
sw	a0,-28(s0)
lw	a4,-28(s0)
li	a5,1
bne	a4,a5,.L9
lw	a4,-36(s0)
lw	a5,-40(s0)
add	a5,a4,a5
sw	a5,-36(s0)
lw	a5,-20(s0)
addi	a5,a5,1
sw	a5,-20(s0)
j	.L8

.L9:
lw	a4,-36(s0)
lw	a5,-40(s0)
sub	a5,a4,a5
sw	a5,-36(s0)
lw	a5,-20(s0)
addi	a5,a5,1
sw	a5,-20(s0)

.L8:
lw	a4,-20(s0)
lw	a5,-44(s0)
blt	a4,a5,.L10
lw	a5,-36(s0)
sw	a5,-24(s0)
lw	a5,-24(s0)
mv	a0,a5
lw	ra,44(sp)
lw	s0,40(sp)
addi	sp,sp,48
jr	ra

.size	play_game, .-play_game
.ident	"GCC: (GNU) 9.2.0"
