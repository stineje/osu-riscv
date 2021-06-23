######################
#     srli TESTS     #
######################

.globl __srli

.text

__srli:

test01:
  li a1, 1
  li t0, 0x80000000
  srli t2, t0, 0
  li t3, 0x80000000
  bne t2, t3, fail

test02:
  li a1, 2
  li t0, 0x80000000
  srli t2, t0, 1
  li t3, 0x40000000
  bne t2, t3, fail

test03:
  li a1, 3
  li t0, 0x80000000
  srli t2, t0, 7
  li t3, 0x01000000
  bne t2, t3, fail

test04:
  li a1, 4
  li t0, 0x80000000
  srli t2, t0, 14
  li t3, 0x00020000
  bne t2, t3, fail

test05:
  li a1, 5
  li t0, 0x80000001
  srli t2, t0, 31
  li t3, 0x00000001
  bne t2, t3, fail

test06:
  li a1, 6
  li t0, 0xffffffff
  srli t2, t0, 0
  li t3, 0xffffffff
  bne t2, t3, fail

test07:
  li a1, 7
  li t0, 0xffffffff
  srli t2, t0, 1
  li t3, 0x7fffffff
  bne t2, t3, fail

test08:
  li a1, 8
  li t0, 0xffffffff
  srli t2, t0, 7
  li t3, 0x01ffffff
  bne t2, t3, fail

test09:
  li a1, 9
  li t0, 0xffffffff
  srli t2, t0, 14
  li t3, 0x0003ffff
  bne t2, t3, fail

test10:
  li a1, 10
  li t0, 0xffffffff
  srli t2, t0, 31
  li t3, 0x00000001
  bne t2, t3, fail

test11:
  li a1, 11
  li t0, 0x21212121
  srli t2, t0, 0
  li t3, 0x21212121
  bne t2, t3, fail

test12:
  li a1, 12
  li t0, 0x21212121
  srli t2, t0, 1
  li t3, 0x10909090
  bne t2, t3, fail

test13:
  li a1, 13
  li t0, 0x21212121
  srli t2, t0, 7
  li t3, 0x00424242
  bne t2, t3, fail

test14:
  li a1, 14
  li t0, 0x21212121
  srli t2, t0, 14
  li t3, 0x00008484
  bne t2, t3, fail

test15:
  li a1, 15
  li t0, 0x21212121
  srli t2, t0, 31
  li t3, 0x00000000
  bne t2, t3, fail

test16:
  li a1, 16
  li t0, 0x80000000
  srli t0, t0, 7
  li t3, 0x01000000
  bne t0, t3, fail

test17:
  li a1, 17
  li t4, 0
label1_test17:
  li t0, 0x80000000
  srli t2, t0, 7
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test17
  li t3, 0x01000000
  bne t5, t3, fail

test18:
  li a1, 18
  li t4, 0
label1_test18:
  li t0, 0x80000000
  srli t2, t0, 14
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test18
  li t3, 0x00020000
  bne t5, t3, fail

test19:
  li a1, 19
  li t4, 0
label1_test19:
  li t0, 0x80000001
  srli t2, t0, 31
  nop
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test19
  li t3, 0x00000001
  bne t5, t3, fail

test20:
  li a1, 20
  li t4, 0
label1_test20:
  li t0, 0x80000000
  srli t2, t0, 7
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test20
  li t3, 0x01000000
  bne t2, t3, fail

test21:
  li a1, 21
  li t4, 0
label1_test21:
  li t0, 0x80000000
  nop
  srli t2, t0, 14
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test21
  li t3, 0x00020000
  bne t2, t3, fail

test22:
  li a1, 22
  li t4, 0
label1_test22:
  li t0, 0x80000001
  nop
  nop
  srli t2, t0, 31
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test22
  li t3, 0x00000001
  bne t2, t3, fail

test23:
  li a1, 23
  srli t0, x0, 4
  li t3, 0x00000000
  bne t0, t3, fail

test24:
  li a1, 24
  li t0, 0x00000021
  srli x0, t0, 10
  li t3, 0x00000000
  bne x0, t3, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
