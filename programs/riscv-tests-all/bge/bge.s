######################
#     bge TESTS      #
######################

.globl __bge

.text

__bge:

test01:
  li a1, 1
  li t0, 0x00000000
  li t1, 0x00000000
  bge t0, t1, label2_test01
  bne x0, a1, fail
label1_test01:
  bne x0, a1, label3_test01
label2_test01:
  bge t0, t1, label1_test01
  bne x0, a1, fail
label3_test01:

test02:
  li a1, 2
  li t0, 0x00000001
  li t1, 0x00000001
  bge t0, t1, label2_test02
  bne x0, a1, fail
label1_test02:
  bne x0, a1, label3_test02
label2_test02:
  bge t0, t1, label1_test02
  bne x0, a1, fail
label3_test02:

test03:
  li a1, 3
  li t0, 0xffffffff
  li t1, 0xffffffff
  bge t0, t1, label2_test03
  bne x0, a1, fail
label1_test03:
  bne x0, a1, label3_test03
label2_test03:
  bge t0, t1, label1_test03
  bne x0, a1, fail
label3_test03:

test04:
  li a1, 4
  li t0, 0x00000001
  li t1, 0x00000000
  bge t0, t1, label2_test04
  bne x0, a1, fail
label1_test04:
  bne x0, a1, label3_test04
label2_test04:
  bge t0, t1, label1_test04
  bne x0, a1, fail
label3_test04:

test05:
  li a1, 5
  li t0, 0x00000001
  li t1, 0xffffffff
  bge t0, t1, label2_test05
  bne x0, a1, fail
label1_test05:
  bne x0, a1, label3_test05
label2_test05:
  bge t0, t1, label1_test05
  bne x0, a1, fail
label3_test05:

test06:
  li a1, 6
  li t0, 0xffffffff
  li t1, 0xfffffffe
  bge t0, t1, label2_test06
  bne x0, a1, fail
label1_test06:
  bne x0, a1, label3_test06
label2_test06:
  bge t0, t1, label1_test06
  bne x0, a1, fail
label3_test06:

test07:
  li a1, 7
  li t0, 0x00000000
  li t1, 0x00000001
  bge t0, t1, label1_test07
  bne x0, a1, label2_test07
label1_test07:
  bne x0, a1, fail
label2_test07:
  bge t0, t1, label1_test07
label3_test07:

test08:
  li a1, 8
  li t0, 0xffffffff
  li t1, 0x00000001
  bge t0, t1, label1_test08
  bne x0, a1, label2_test08
label1_test08:
  bne x0, a1, fail
label2_test08:
  bge t0, t1, label1_test08
label3_test08:

test09:
  li a1, 9
  li t0, 0xfffffffe
  li t1, 0xffffffff
  bge t0, t1, label1_test09
  bne x0, a1, label2_test09
label1_test09:
  bne x0, a1, fail
label2_test09:
  bge t0, t1, label1_test09
label3_test09:

test10:
  li a1, 10
  li t0, 0xfffffffe
  li t1, 0x00000001
  bge t0, t1, label1_test10
  bne x0, a1, label2_test10
label1_test10:
  bne x0, a1, fail
label2_test10:
  bge t0, t1, label1_test10
label3_test10:

test11:
  li a1, 11
  li t4, 0
label1_test11:
  li t0, 0xffffffff
  li t1, 0x00000000
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test11

test12:
  li a1, 12
  li t4, 0
label1_test12:
  li t0, 0xffffffff
  li t1, 0x00000000
  nop
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test12

test13:
  li a1, 13
  li t4, 0
label1_test13:
  li t0, 0xffffffff
  li t1, 0x00000000
  nop
  nop
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test13

test14:
  li a1, 14
  li t4, 0
label1_test14:
  li t0, 0xffffffff
  nop
  li t1, 0x00000000
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test14

test15:
  li a1, 15
  li t4, 0
label1_test15:
  li t0, 0xffffffff
  nop
  li t1, 0x00000000
  nop
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test15

test16:
  li a1, 16
  li t4, 0
label1_test16:
  li t0, 0xffffffff
  nop
  nop
  li t1, 0x00000000
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test16

test17:
  li a1, 17
  li t4, 0
label1_test17:
  li t0, 0xffffffff
  li t1, 0x00000000
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test17

test18:
  li a1, 18
  li t4, 0
label1_test18:
  li t0, 0xffffffff
  li t1, 0x00000000
  nop
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test18

test19:
  li a1, 19
  li t4, 0
label1_test19:
  li t0, 0xffffffff
  li t1, 0x00000000
  nop
  nop
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test19

test20:
  li a1, 20
  li t4, 0
label1_test20:
  li t0, 0xffffffff
  nop
  li t1, 0x00000000
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test20

test21:
  li a1, 21
  li t4, 0
label1_test21:
  li t0, 0xffffffff
  nop
  li t1, 0x00000000
  nop
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test21

test22:
  li a1, 22
  li t4, 0
label1_test22:
  li t0, 0xffffffff
  nop
  nop
  li t1, 0x00000000
  bge t0, t1, fail
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test22

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
