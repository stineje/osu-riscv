######################
#     bltu TESTS     #
######################

.globl __bltu

.text

__bltu:

test01:
  li a1, 1
  li t0, 0x00000000
  li t1, 0x00000001
  bltu t0, t1, label2_test01
  bne x0, a1, fail
label1_test01:
  bne x0, a1, label3_test01
label2_test01:
  bltu t0, t1, label1_test01
  bne x0, a1, fail
label3_test01:

test02:
  li a1, 2
  li t0, 0xfffffffe
  li t1, 0xffffffff
  bltu t0, t1, label2_test02
  bne x0, a1, fail
label1_test02:
  bne x0, a1, label3_test02
label2_test02:
  bltu t0, t1, label1_test02
  bne x0, a1, fail
label3_test02:

test03:
  li a1, 3
  li t0, 0x00000000
  li t1, 0xffffffff
  bltu t0, t1, label2_test03
  bne x0, a1, fail
label1_test03:
  bne x0, a1, label3_test03
label2_test03:
  bltu t0, t1, label1_test03
  bne x0, a1, fail
label3_test03:

test04:
  li a1, 4
  li t0, 0x00000001
  li t1, 0x00000000
  bltu t0, t1, label1_test04
  bne x0, a1, label2_test04
label1_test04:
  bne x0, a1, fail
label2_test04:
  bltu t0, t1, label1_test04
label3_test04:

test05:
  li a1, 5
  li t0, 0xffffffff
  li t1, 0xfffffffe
  bltu t0, t1, label1_test05
  bne x0, a1, label2_test05
label1_test05:
  bne x0, a1, fail
label2_test05:
  bltu t0, t1, label1_test05
label3_test05:

test06:
  li a1, 6
  li t0, 0xffffffff
  li t1, 0x00000000
  bltu t0, t1, label1_test06
  bne x0, a1, label2_test06
label1_test06:
  bne x0, a1, fail
label2_test06:
  bltu t0, t1, label1_test06
label3_test06:

test07:
  li a1, 7
  li t0, 0x80000000
  li t1, 0x7fffffff
  bltu t0, t1, label1_test07
  bne x0, a1, label2_test07
label1_test07:
  bne x0, a1, fail
label2_test07:
  bltu t0, t1, label1_test07
label3_test07:

test08:
  li a1, 8
  li t4, 0
label1_test08:
  li t0, 0xf0000000
  li t1, 0xefffffff
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test08

test09:
  li a1, 9
  li t4, 0
label1_test09:
  li t0, 0xf0000000
  li t1, 0xefffffff
  nop
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test09

test10:
  li a1, 10
  li t4, 0
label1_test10:
  li t0, 0xf0000000
  li t1, 0xefffffff
  nop
  nop
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test10

test11:
  li a1, 11
  li t4, 0
label1_test11:
  li t0, 0xf0000000
  nop
  li t1, 0xefffffff
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test11

test12:
  li a1, 12
  li t4, 0
label1_test12:
  li t0, 0xf0000000
  nop
  li t1, 0xefffffff
  nop
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test12

test13:
  li a1, 13
  li t4, 0
label1_test13:
  li t0, 0xf0000000
  nop
  nop
  li t1, 0xefffffff
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test13

test14:
  li a1, 14
  li t4, 0
label1_test14:
  li t0, 0xf0000000
  li t1, 0xefffffff
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test14

test15:
  li a1, 15
  li t4, 0
label1_test15:
  li t0, 0xf0000000
  li t1, 0xefffffff
  nop
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test15

test16:
  li a1, 16
  li t4, 0
label1_test16:
  li t0, 0xf0000000
  li t1, 0xefffffff
  nop
  nop
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test16

test17:
  li a1, 17
  li t4, 0
label1_test17:
  li t0, 0xf0000000
  nop
  li t1, 0xefffffff
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test17

test18:
  li a1, 18
  li t4, 0
label1_test18:
  li t0, 0xf0000000
  nop
  li t1, 0xefffffff
  nop
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test18

test19:
  li a1, 19
  li t4, 0
label1_test19:
  li t0, 0xf0000000
  nop
  nop
  li t1, 0xefffffff
  bltu t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test19

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
