######################
#     slti TESTS     #
######################

.globl __slti

.text

__slti:

test01:
  li a1, 1
  li t0, 0x00000000
  slti t2, t0, 0
  li t3, 0x00000000
  bne t2, t3, fail

test02:
  li a1, 2
  li t0, 0x00000001
  slti t2, t0, 1
  li t3, 0x00000000
  bne t2, t3, fail

test03:
  li a1, 3
  li t0, 0x00000003
  slti t2, t0, 7
  li t3, 0x00000001
  bne t2, t3, fail

test04:
  li a1, 4
  li t0, 0x00000007
  slti t2, t0, 3
  li t3, 0x00000000
  bne t2, t3, fail

test05:
  li a1, 5
  li t0, 0x00000000
  slti t2, t0, -2048
  li t3, 0x00000000
  bne t2, t3, fail

test06:
  li a1, 6
  li t0, 0x80000000
  slti t2, t0, 0
  li t3, 0x00000001
  bne t2, t3, fail

test07:
  li a1, 7
  li t0, 0x80000000
  slti t2, t0, -2048
  li t3, 0x00000001
  bne t2, t3, fail

test08:
  li a1, 8
  li t0, 0x00000000
  slti t2, t0, 2047
  li t3, 0x00000001
  bne t2, t3, fail

test09:
  li a1, 9
  li t0, 0x7fffffff
  slti t2, t0, 0
  li t3, 0x00000000
  bne t2, t3, fail

test10:
  li a1, 10
  li t0, 0x7fffffff
  slti t2, t0, 2047
  li t3, 0x00000000
  bne t2, t3, fail

test11:
  li a1, 11
  li t0, 0x80000000
  slti t2, t0, 2047
  li t3, 0x00000001
  bne t2, t3, fail

test12:
  li a1, 12
  li t0, 0x7fffffff
  slti t2, t0, -2048
  li t3, 0x00000000
  bne t2, t3, fail

test13:
  li a1, 13
  li t0, 0x00000000
  slti t2, t0, -1
  li t3, 0x00000000
  bne t2, t3, fail

test14:
  li a1, 14
  li t0, 0xffffffff
  slti t2, t0, 1
  li t3, 0x00000001
  bne t2, t3, fail

test15:
  li a1, 15
  li t0, 0xffffffff
  slti t2, t0, -1
  li t3, 0x00000000
  bne t2, t3, fail

test16:
  li a1, 16
  li t0, 0x0000000b
  slti t0, t0, 13
  li t3, 0x00000001
  bne t0, t3, fail

test17:
  li a1, 17
  li t4, 0
label1_test17:
  li t0, 0x0000000f
  slti t2, t0, 10
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test17
  li t3, 0x00000000
  bne t5, t3, fail

test18:
  li a1, 18
  li t4, 0
label1_test18:
  li t0, 0x0000000a
  slti t2, t0, 16
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test18
  li t3, 0x00000001
  bne t5, t3, fail

test19:
  li a1, 19
  li t4, 0
label1_test19:
  li t0, 0x00000010
  slti t2, t0, 9
  nop
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test19
  li t3, 0x00000000
  bne t5, t3, fail

test20:
  li a1, 20
  li t4, 0
label1_test20:
  li t0, 0x0000000b
  slti t2, t0, 15
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test20
  li t3, 0x00000001
  bne t2, t3, fail

test21:
  li a1, 21
  li t4, 0
label1_test21:
  li t0, 0x00000011
  nop
  slti t2, t0, 8
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test21
  li t3, 0x00000000
  bne t2, t3, fail

test22:
  li a1, 22
  li t4, 0
label1_test22:
  li t0, 0x0000000c
  nop
  nop
  slti t2, t0, 14
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test22
  li t3, 0x00000001
  bne t2, t3, fail

test23:
  li a1, 23
  slti t0, x0, -1
  li t3, 0x00000000
  bne t0, t3, fail

test24:
  li a1, 24
  li t0, 0x00ff00ff
  slti x0, t0, -1
  li t3, 0x00000000
  bne x0, t3, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
