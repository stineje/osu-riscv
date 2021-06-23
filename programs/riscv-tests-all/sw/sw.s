######################
#      sw TESTS      #
######################

.globl __sw

.data

tdat:
  tdat1:  .word 0xdeadbeef
  tdat2:  .word 0xdeadbeef
  tdat3:  .word 0xdeadbeef
  tdat4:  .word 0xdeadbeef
  tdat5:  .word 0xdeadbeef
  tdat6:  .word 0xdeadbeef
  tdat7:  .word 0xdeadbeef
  tdat8:  .word 0xdeadbeef
  tdat9:  .word 0xdeadbeef
  tdat10: .word 0xdeadbeef

.text

__sw:

test01:
  li a1, 1
  la t0, tdat
  li t1, 0x00aa00aa
  sw t1, 0(t0)
  lw t2, 0(t0)
  li t3, 0x00aa00aa
  bne t2, t3, fail

test02:
  li a1, 2
  la t0, tdat
  li t1, 0xaa00aa00
  sw t1, 4(t0)
  lw t2, 4(t0)
  li t3, 0xaa00aa00
  bne t2, t3, fail

test03:
  li a1, 3
  la t0, tdat
  li t1, 0x0aa00aa0
  sw t1, 8(t0)
  lw t2, 8(t0)
  li t3, 0x0aa00aa0
  bne t2, t3, fail

test04:
  li a1, 4
  la t0, tdat
  li t1, 0xa00aa00a
  sw t1, 12(t0)
  lw t2, 12(t0)
  li t3, 0xa00aa00a
  bne t2, t3, fail

test05:
  li a1, 5
  la t0, tdat8
  li t1, 0x00aa00aa
  sw t1, -12(t0)
  lw t2, -12(t0)
  li t3, 0x00aa00aa
  bne t2, t3, fail

test06:
  li a1, 6
  la t0, tdat8
  li t1, 0xaa00aa00
  sw t1, -8(t0)
  lw t2, -8(t0)
  li t3, 0xaa00aa00
  bne t2, t3, fail

test07:
  li a1, 7
  la t0, tdat8
  li t1, 0x0aa00aa0
  sw t1, -4(t0)
  lw t2, -4(t0)
  li t3, 0x0aa00aa0
  bne t2, t3, fail

test08:
  li a1, 8
  la t0, tdat8
  li t1, 0xa00aa00a
  sw t1, 0(t0)
  lw t2, 0(t0)
  li t3, 0xa00aa00a
  bne t2, t3, fail

test09:
  li a1, 9
  la t0, tdat9
  li t1, 0x12345678
  addi t4, t0, -32
  sw t1, 32(t4)
  lw t6, 0(t0)
  li t3, 0x12345678
  bne t6, t3, fail

test10:
  li a1, 10
  la t0, tdat9
  li t1, 0x58213098
  addi t0, t0, -3
  sw t1, 7(t0)
  la t4, tdat10
  lw t6, 0(t4)
  li t3, 0x58213098
  bne t6, t3, fail

test11:
  li a1, 11
  li t4, 0
label1_test11:
  li t0, 0xaabbccdd
  la t1, tdat
  sw t0, 0(t1)
  lw t2, 0(t1)
  li t3, 0xaabbccdd
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test11

test12:
  li a1, 12
  li t4, 0
label1_test12:
  li t0, 0xdaabbccd
  la t1, tdat
  nop
  sw t0, 4(t1)
  lw t2, 4(t1)
  li t3, 0xdaabbccd
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test12

test13:
  li a1, 13
  li t4, 0
label1_test13:
  li t0, 0xddaabbcc
  la t1, tdat
  nop
  nop
  sw t0, 8(t1)
  lw t2, 8(t1)
  li t3, 0xddaabbcc
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test13

test14:
  li a1, 14
  li t4, 0
label1_test14:
  li t0, 0xcddaabbc
  nop
  la t1, tdat
  sw t0, 12(t1)
  lw t2, 12(t1)
  li t3, 0xcddaabbc
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test14

test15:
  li a1, 15
  li t4, 0
label1_test15:
  li t0, 0xccddaabb
  nop
  la t1, tdat
  nop
  sw t0, 16(t1)
  lw t2, 16(t1)
  li t3, 0xccddaabb
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test15

test16:
  li a1, 16
  li t4, 0
label1_test16:
  li t0, 0xbccddaab
  nop
  nop
  la t1, tdat
  sw t0, 20(t1)
  lw t2, 20(t1)
  li t3, 0xbccddaab
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test16

test17:
  li a1, 17
  li t4, 0
label1_test17:
  la t1, tdat
  li t0, 0x00112233
  sw t0, 0(t1)
  lw t2, 0(t1)
  li t3, 0x00112233
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test17

test18:
  li a1, 18
  li t4, 0
label1_test18:
  la t1, tdat
  li t0, 0x30011223
  nop
  sw t0, 4(t1)
  lw t2, 4(t1)
  li t3, 0x30011223
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test18

test19:
  li a1, 19
  li t4, 0
label1_test19:
  la t1, tdat
  li t0, 0x33001122
  nop
  nop
  sw t0, 8(t1)
  lw t2, 8(t1)
  li t3, 0x33001122
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test19

test20:
  li a1, 20
  li t4, 0
label1_test20:
  la t1, tdat
  nop
  li t0, 0x23300112
  sw t0, 12(t1)
  lw t2, 12(t1)
  li t3, 0x23300112
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test20

test21:
  li a1, 21
  li t4, 0
label1_test21:
  la t1, tdat
  nop
  li t0, 0x22330011
  nop
  sw t0, 16(t1)
  lw t2, 16(t1)
  li t3, 0x22330011
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test21

test22:
  li a1, 22
  li t4, 0
label1_test22:
  la t1, tdat
  nop
  nop
  li t0, 0x12233001
  sw t0, 20(t1)
  lw t2, 20(t1)
  li t3, 0x12233001
  bne t2, t3, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test22

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
