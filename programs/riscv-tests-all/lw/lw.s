######################
#      lw TESTS      #
######################

.globl __lw

.data

tdat:
  tdat1:  .word 0x00ff00ff
  tdat2:  .word 0xff00ff00
  tdat3:  .word 0x0ff00ff0
  tdat4:  .word 0xf00ff00f

.text

__lw:

test01:
  li a1, 1
  la t0, tdat
  lw t2, 0(t0)
  li t3, 0x00ff00ff
  bne t2, t3, fail

test02:
  li a1, 2
  la t0, tdat
  lw t2, 4(t0)
  li t3, 0xff00ff00
  bne t2, t3, fail

test03:
  li a1, 3
  la t0, tdat
  lw t2, 8(t0)
  li t3, 0x0ff00ff0
  bne t2, t3, fail

test04:
  li a1, 4
  la t0, tdat
  lw t2, 12(t0)
  li t3, 0xf00ff00f
  bne t2, t3, fail

test05:
  li a1, 5
  la t0, tdat4
  lw t2, -12(t0)
  li t3, 0x00ff00ff
  bne t2, t3, fail

test06:
  li a1, 6
  la t0, tdat4
  lw t2, -8(t0)
  li t3, 0xff00ff00
  bne t2, t3, fail

test07:
  li a1, 7
  la t0, tdat4
  lw t2, -4(t0)
  li t3, 0x0ff00ff0
  bne t2, t3, fail

test08:
  li a1, 8
  la t0, tdat4
  lw t2, 0(t0)
  li t3, 0xf00ff00f
  bne t2, t3, fail

test09:
  li a1, 9
  la t0, tdat
  addi t0, t0, -32
  lw t6, 32(t0)
  li t3, 0x00ff00ff
  bne t6, t3, fail

test10:
  li a1, 10
  la t0, tdat
  addi t0, t0, -3
  lw t6, 7(t0)
  li t3, 0xff00ff00
  bne t6, t3, fail

test11:
  li a1, 11
  li t4, 0
label1_test11:
  la t0, tdat2
  lw t2, 4(t0)
  addi t5, t2, 0
  li t3, 0x0ff00ff0
  bne t5, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test11

test12:
  li a1, 12
  li t4, 0
label1_test12:
  la t0, tdat3
  lw t2, 4(t0)
  nop
  addi t5, t2, 0
  li t3, 0xf00ff00f
  bne t5, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test12

test13:
  li a1, 13
  li t4, 0
label1_test13:
  la t0, tdat1
  lw t2, 4(t0)
  nop
  nop
  addi t5, t2, 0
  li t3, 0xff00ff00
  bne t5, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test13

test14:
  li a1, 14
  li t4, 0
label1_test14:
  la t0, tdat2
  lw t2, 4(t0)
  li t3, 0x0ff00ff0
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test14

test15:
  li a1, 15
  li t4, 0
label1_test15:
  la t0, tdat3
  nop
  lw t2, 4(t0)
  li t3, 0xf00ff00f
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test15

test16:
  li a1, 16
  li t4, 0
label1_test16:
  la t0, tdat1
  nop
  nop
  lw t2, 4(t0)
  li t3, 0xff00ff00
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test16

test17:
  li a1, 17
  la t6, tdat
  lw t1, 0(t6)
  li t1, 2
  li t3, 0x00000002
  bne t1, t3, fail

test18:
  li a1, 18
  la t6, tdat
  lw t1, 0(t6)
  nop
  li t1, 2
  li t3, 0x00000002
  bne t1, t3, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
