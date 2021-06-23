######################
#     srai TESTS     #
######################

.globl __srai

.text

__srai:

test01:
  li a1, 1
  li t0, 0x00000000
  srai t2, t0, 0
  li t3, 0x00000000
  bne t2, t3, fail

test02:
  li a1, 2
  li t0, 0x80000000
  srai t2, t0, 1
  li t3, 0xc0000000
  bne t2, t3, fail

test03:
  li a1, 3
  li t0, 0x80000000
  srai t2, t0, 7
  li t3, 0xff000000
  bne t2, t3, fail

test04:
  li a1, 4
  li t0, 0x80000000
  srai t2, t0, 14
  li t3, 0xfffe0000
  bne t2, t3, fail

test05:
  li a1, 5
  li t0, 0x80000001
  srai t2, t0, 31
  li t3, 0xffffffff
  bne t2, t3, fail

test06:
  li a1, 6
  li t0, 0x7fffffff
  srai t2, t0, 0
  li t3, 0x7fffffff
  bne t2, t3, fail

test07:
  li a1, 7
  li t0, 0x7fffffff
  srai t2, t0, 1
  li t3, 0x3fffffff
  bne t2, t3, fail

test08:
  li a1, 8
  li t0, 0x7fffffff
  srai t2, t0, 7
  li t3, 0x00ffffff
  bne t2, t3, fail

test09:
  li a1, 9
  li t0, 0x7fffffff
  srai t2, t0, 14
  li t3, 0x0001ffff
  bne t2, t3, fail

test10:
  li a1, 10
  li t0, 0x7fffffff
  srai t2, t0, 31
  li t3, 0x00000000
  bne t2, t3, fail

test11:
  li a1, 11
  li t0, 0x81818181
  srai t2, t0, 0
  li t3, 0x81818181
  bne t2, t3, fail

test12:
  li a1, 12
  li t0, 0x81818181
  srai t2, t0, 1
  li t3, 0xc0c0c0c0
  bne t2, t3, fail

test13:
  li a1, 13
  li t0, 0x81818181
  srai t2, t0, 7
  li t3, 0xff030303
  bne t2, t3, fail

test14:
  li a1, 14
  li t0, 0x81818181
  srai t2, t0, 14
  li t3, 0xfffe0606
  bne t2, t3, fail

test15:
  li a1, 15
  li t0, 0x81818181
  srai t2, t0, 31
  li t3, 0xffffffff
  bne t2, t3, fail

test16:
  li a1, 16
  li t0, 0x80000000
  srai t0, t0, 7
  li t3, 0xff000000
  bne t0, t3, fail

test17:
  li a1, 17
  li t4, 0
label1_test17:
  li t0, 0x80000000
  srai t2, t0, 7
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test17
  li t3, 0xff000000
  bne t5, t3, fail

test18:
  li a1, 18
  li t4, 0
label1_test18:
  li t0, 0x80000000
  srai t2, t0, 14
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test18
  li t3, 0xfffe0000
  bne t5, t3, fail

test19:
  li a1, 19
  li t4, 0
label1_test19:
  li t0, 0x80000001
  srai t2, t0, 31
  nop
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test19
  li t3, 0xffffffff
  bne t5, t3, fail

test20:
  li a1, 20
  li t4, 0
label1_test20:
  li t0, 0x80000000
  srai t2, t0, 7
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test20
  li t3, 0xff000000
  bne t2, t3, fail

test21:
  li a1, 21
  li t4, 0
label1_test21:
  li t0, 0x80000000
  nop
  srai t2, t0, 14
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test21
  li t3, 0xfffe0000
  bne t2, t3, fail

test22:
  li a1, 22
  li t4, 0
label1_test22:
  li t0, 0x80000001
  nop
  nop
  srai t2, t0, 31
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test22
  li t3, 0xffffffff
  bne t2, t3, fail

test23:
  li a1, 23
  srai t0, x0, 4
  li t3, 0x00000000
  bne t0, t3, fail

test24:
  li a1, 24
  li t0, 0x00000021
  srai x0, t0, 10
  li t3, 0x00000000
  bne x0, t3, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
