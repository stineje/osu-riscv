######################
#      sw TESTS      #
######################

.globl __start

.text

__start:

test01:
  li a1, 1
  li x1, 0x000000F0
  li x2, 0x00aa00aa
  sw x2, 0(x1)
  lw x30, 0(x1)
  li x29, 0x00aa00aa
  bne x30, x29, fail

test02:
  li a1, 2
  li x1, 0x000000F0
  li x2, 0xaa00aa00
  sw x2, 4(x1)
  lw x30, 4(x1)
  li x29, 0xaa00aa00
  bne x30, x29, fail

test03:
  li a1, 3
  li x1, 0x000000F0
  li x2, 0x0aa00aa0
  sw x2, 8(x1)
  lw x30, 8(x1)
  li x29, 0x0aa00aa0
  bne x30, x29, fail

test04:
  li a1, 4
  li x1, 0x000000F0
  li x2, 0xa00aa00a
  sw x2, 12(x1)
  lw x30, 12(x1)
  li x29, 0xa00aa00a
  bne x30, x29, fail

test05:
  li a1, 5
  li x1, 0x000000F0
  li x2, 0x00aa00aa
  sw x2, -12(x1)
  lw x30, -12(x1)
  li x29, 0x00aa00aa
  bne x30, x29, fail

test06:
  li a1, 6
  li x1, 0x000000F0
  li x2, 0xaa00aa00
  sw x2, -8(x1)
  lw x30, -8(x1)
  li x29, 0xaa00aa00
  bne x30, x29, fail

test07:
  li a1, 7
  li x1, 0x000000F0
  li x2, 0x0aa00aa0
  sw x2, -4(x1)
  lw x30, -4(x1)
  li x29, 0x0aa00aa0
  bne x30, x29, fail

test08:
  li a1, 8
  li x1, 0x000000F0
  li x2, 0xa00aa00a
  sw x2, 0(x1)
  lw x30, 0(x1)
  li x29, 0xa00aa00a
  bne x30, x29, fail

test09:
  li a1, 9
  li x1, 0x000000F0
  li x2, 0x12345678
  addi x4, x1, -32
  sw x2, 32(x4)
  lw x5, 0(x1)
  li x29, 0x12345678
  bne x5, x29, fail

test10:
  li a1, 10
  li x1, 0x000000F0
  li x2, 0x58213098
  addi x1, x1, -3
  sw x2, 7(x1)
  li x4, 0x000000F4
  lw x5, 0(x4)
  li x29, 0x58213098
  bne x5, x29, fail

test11:
  li a1, 11
  li x4, 0
label1_test11:
  li x1, 0xaabbccdd
  li x2, 0x000000F0
  sw x1, 0(x2)
  lw x30, 0(x2)
  li x29, 0xaabbccdd
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test11

test12:
  li a1, 12
  li x4, 0
label1_test12:
  li x1, 0xdaabbccd
  li x2, 0x000000F0
  nop
  sw x1, 4(x2)
  lw x30, 4(x2)
  li x29, 0xdaabbccd
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test12

test13:
  li a1, 13
  li x4, 0
label1_test13:
  li x1, 0xddaabbcc
  li x2, 0x000000F0
  nop
  nop
  sw x1, 8(x2)
  lw x30, 8(x2)
  li x29, 0xddaabbcc
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test13

test14:
  li a1, 14
  li x4, 0
label1_test14:
  li x1, 0xcddaabbc
  nop
  li x2, 0x000000F0
  sw x1, 12(x2)
  lw x30, 12(x2)
  li x29, 0xcddaabbc
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test14

test15:
  li a1, 15
  li x4, 0
label1_test15:
  li x1, 0xccddaabb
  nop
  li x2, 0x000000F0
  nop
  sw x1, 16(x2)
  lw x30, 16(x2)
  li x29, 0xccddaabb
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test15

test16:
  li a1, 16
  li x4, 0
label1_test16:
  li x1, 0xbccddaab
  nop
  nop
  li x2, 0x000000F0
  sw x1, 20(x2)
  lw x30, 20(x2)
  li x29, 0xbccddaab
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test16

test17:
  li a1, 17
  li x4, 0
label1_test17:
  li x2, 0x000000F0
  li x1, 0x00112233
  sw x1, 0(x2)
  lw x30, 0(x2)
  li x29, 0x00112233
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test17

test18:
  li a1, 18
  li x4, 0
label1_test18:
  li x2, 0x000000F0
  li x1, 0x30011223
  nop
  sw x1, 4(x2)
  lw x30, 4(x2)
  li x29, 0x30011223
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test18

test19:
  li a1, 19
  li x4, 0
label1_test19:
  li x2, 0x000000F0
  li x1, 0x33001122
  nop
  nop
  sw x1, 8(x2)
  lw x30, 8(x2)
  li x29, 0x33001122
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test19

test20:
  li a1, 20
  li x4, 0
label1_test20:
  li x2, 0x000000F0
  nop
  li x1, 0x23300112
  sw x1, 12(x2)
  lw x30, 12(x2)
  li x29, 0x23300112
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test20

test21:
  li a1, 21
  li x4, 0
label1_test21:
  li x2, 0x000000F0
  nop
  li x1, 0x22330011
  nop
  sw x1, 16(x2)
  lw x30, 16(x2)
  li x29, 0x22330011
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test21

test22:
  li a1, 22
  li x4, 0
label1_test22:
  li x2, 0x000000F0
  nop
  nop
  li x1, 0x12233001
  sw x1, 20(x2)
  lw x30, 20(x2)
  li x29, 0x12233001
  bne x30, x29, fail
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test22

success:
  li a0, 10
  ecall

fail:
  li a0, 17
  ecall
