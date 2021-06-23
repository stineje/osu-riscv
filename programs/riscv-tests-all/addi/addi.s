######################
#     addi TESTS     #
######################

.globl __addi

.text

__addi:

test01:
  li a1, 1
  li t0, 0x00000000
  addi t2, t0, 0
  li t3, 0x00000000
  bne t2, t3, fail

test02:
  li a1, 2
  li t0, 0x00000001
  addi t2, t0, 1
  li t3, 0x00000002
  bne t2, t3, fail

test03:
  li a1, 3
  li t0, 0x00000003
  addi t2, t0, 7
  li t3, 0x0000000a
  bne t2, t3, fail

test04:
  li a1, 4
  li t0, 0x00000000
  addi t2, t0, -2048
  li t3, 0xfffff800
  bne t2, t3, fail

test05:
  li a1, 5
  li t0, 0x80000000
  addi t2, t0, 0
  li t3, 0x80000000
  bne t2, t3, fail

test06:
  li a1, 6
  li t0, 0x80000000
  addi t2, t0, -2048
  li t3, 0x7ffff800
  bne t2, t3, fail

test07:
  li a1, 7
  li t0, 0x00000000
  addi t2, t0, 2047
  li t3, 0x000007ff
  bne t2, t3, fail

test08:
  li a1, 8
  li t0, 0x7fffffff
  addi t2, t0, 0
  li t3, 0x7fffffff
  bne t2, t3, fail

test09:
  li a1, 9
  li t0, 0x7fffffff
  addi t2, t0, 2047
  li t3, 0x800007fe
  bne t2, t3, fail

test10:
  li a1, 10
  li t0, 0x80000000
  addi t2, t0, 2047
  li t3, 0x800007ff
  bne t2, t3, fail

test11:
  li a1, 11
  li t0, 0x7fffffff
  addi t2, t0, -2048
  li t3, 0x7ffff7ff
  bne t2, t3, fail

test12:
  li a1, 12
  li t0, 0x00000000
  addi t2, t0, -1
  li t3, 0xffffffff
  bne t2, t3, fail

test13:
  li a1, 13
  li t0, 0xffffffff
  addi t2, t0, 1
  li t3, 0x00000000
  bne t2, t3, fail

test14:
  li a1, 14
  li t0, 0xffffffff
  addi t2, t0, -1
  li t3, 0xfffffffe
  bne t2, t3, fail

test15:
  li a1, 15
  li t0, 0x7fffffff
  addi t2, t0, 1
  li t3, 0x80000000
  bne t2, t3, fail

test16:
  li a1, 16
  li t0, 0x0000000d
  addi t0, t0, 11
  li t3, 0x00000018
  bne t0, t3, fail

test17:
  li a1, 17
  li t4, 0
label1_test17:
  li t0, 0x0000000d
  addi t2, t0, 11
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test17
  li t3, 0x00000018
  bne t5, t3, fail

test18:
  li a1, 18
  li t4, 0
label1_test18:
  li t0, 0x0000000d
  addi t2, t0, 10
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test18
  li t3, 0x00000017
  bne t5, t3, fail

test19:
  li a1, 19
  li t4, 0
label1_test19:
  li t0, 0x0000000d
  addi t2, t0, 9
  nop
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test19
  li t3, 0x00000016
  bne t5, t3, fail

test20:
  li a1, 20
  li t4, 0
label1_test20:
  li t0, 0x0000000d
  addi t2, t0, 11
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test20
  li t3, 0x00000018
  bne t2, t3, fail

test21:
  li a1, 21
  li t4, 0
label1_test21:
  li t0, 0x0000000d
  nop
  addi t2, t0, 10
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test21
  li t3, 0x00000017
  bne t2, t3, fail

test22:
  li a1, 22
  li t4, 0
label1_test22:
  li t0, 0x0000000d
  nop
  nop
  addi t2, t0, 9
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test22
  li t3, 0x00000016
  bne t2, t3, fail

test23:
  li a1, 23
  addi t0, x0, 32
  li t3, 0x00000020
  bne t0, t3, fail

test24:
  li a1, 24
  li t0, 0x00000021
  addi x0, t0, 50
  li t3, 0x00000000
  bne x0, t3, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
