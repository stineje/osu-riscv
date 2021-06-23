######################
#     sltu TESTS     #
######################

.globl __sltu

.text

__sltu:

test01:
  li a1, 1
  li t0, 0x00000000
  li t1, 0x00000000
  sltu t2, t0, t1
  li t3, 0x00000000
  bne t2, t3, fail

test02:
  li a1, 2
  li t0, 0x00000001
  li t1, 0x00000001
  sltu t2, t0, t1
  li t3, 0x00000000
  bne t2, t3, fail

test03:
  li a1, 3
  li t0, 0x00000003
  li t1, 0x00000007
  sltu t2, t0, t1
  li t3, 0x00000001
  bne t2, t3, fail

test04:
  li a1, 4
  li t0, 0x00000007
  li t1, 0x00000003
  sltu t2, t0, t1
  li t3, 0x00000000
  bne t2, t3, fail

test05:
  li a1, 5
  li t0, 0x00000000
  li t1, 0xffff8000
  sltu t2, t0, t1
  li t3, 0x00000001
  bne t2, t3, fail

test06:
  li a1, 6
  li t0, 0x80000000
  li t1, 0x00000000
  sltu t2, t0, t1
  li t3, 0x00000000
  bne t2, t3, fail

test07:
  li a1, 7
  li t0, 0x80000000
  li t1, 0xffff8000
  sltu t2, t0, t1
  li t3, 0x00000001
  bne t2, t3, fail

test08:
  li a1, 8
  li t0, 0x00000000
  li t1, 0x00007fff
  sltu t2, t0, t1
  li t3, 0x00000001
  bne t2, t3, fail

test09:
  li a1, 9
  li t0, 0x7fffffff
  li t1, 0x00000000
  sltu t2, t0, t1
  li t3, 0x00000000
  bne t2, t3, fail

test10:
  li a1, 10
  li t0, 0x7fffffff
  li t1, 0x00007fff
  sltu t2, t0, t1
  li t3, 0x00000000
  bne t2, t3, fail

test11:
  li a1, 11
  li t0, 0x80000000
  li t1, 0x00007fff
  sltu t2, t0, t1
  li t3, 0x00000000
  bne t2, t3, fail

test12:
  li a1, 12
  li t0, 0x7fffffff
  li t1, 0xffff8000
  sltu t2, t0, t1
  li t3, 0x00000001
  bne t2, t3, fail

test13:
  li a1, 13
  li t0, 0x00000000
  li t1, 0xffffffff
  sltu t2, t0, t1
  li t3, 0x00000001
  bne t2, t3, fail

test14:
  li a1, 14
  li t0, 0xffffffff
  li t1, 0x00000001
  sltu t2, t0, t1
  li t3, 0x00000000
  bne t2, t3, fail

test15:
  li a1, 15
  li t0, 0xffffffff
  li t1, 0xffffffff
  sltu t2, t0, t1
  li t3, 0x00000000
  bne t2, t3, fail

test16:
  li a1, 16
  li t0, 0x0000000e
  li t1, 0x0000000d
  sltu t0, t0, t1
  li t3, 0x00000000
  bne t0, t3, fail

test17:
  li a1, 17
  li t0, 0x0000000b
  li t1, 0x0000000d
  sltu t1, t0, t1
  li t3, 0x00000001
  bne t1, t3, fail

test18:
  li a1, 18
  li t0, 0x0000000d
  sltu t0, t0, t0
  li t3, 0x00000000
  bne t0, t3, fail

test19:
  li a1, 19
  li t4, 0
label_test19:
  li t0, 0x0000000b
  li t1, 0x0000000d
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test19
  li t3, 0x00000001
  bne t5, t3, fail

test20:
  li a1, 20
  li t4, 0
label_test20:
  li t0, 0x0000000e
  li t1, 0x0000000d
  sltu t2, t0, t1
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test20
  li t3, 0x00000000
  bne t5, t3, fail

test21:
  li a1, 21
  li t4, 0
label_test21:
  li t0, 0x0000000c
  li t1, 0x0000000d
  sltu t2, t0, t1
  nop
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test21
  li t3, 0x00000001
  bne t5, t3, fail

test22:
  li a1, 22
  li t4, 0
label_test22:
  li t0, 0x0000000e
  li t1, 0x0000000d
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test22
  li t3, 0x00000000
  bne t5, t3, fail

test23:
  li a1, 23
  li t4, 0
label_test23:
  li t0, 0x0000000b
  li t1, 0x0000000d
  nop
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test23
  li t3, 0x00000001
  bne t5, t3, fail

test24:
  li a1, 24
  li t4, 0
label_test24:
  li t0, 0x0000000f
  li t1, 0x0000000d
  nop
  nop
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test24
  li t3, 0x00000000
  bne t5, t3, fail

test25:
  li a1, 25
  li t4, 0
label_test25:
  li t0, 0x0000000a
  nop
  li t1, 0x0000000d
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test25
  li t3, 0x00000001
  bne t5, t3, fail

test26:
  li a1, 26
  li t4, 0
label_test26:
  li t0, 0x00000010
  nop
  li t1, 0x0000000d
  nop
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test26
  li t3, 0x00000000
  bne t5, t3, fail

test27:
  li a1, 27
  li t4, 0
label_test27:
  li t0, 0x00000009
  nop
  nop
  li t1, 0x0000000d
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test27
  li t3, 0x00000001
  bne t5, t3, fail

test28:
  li a1, 28
  li t4, 0
label_test28:
  li t1, 0x0000000d
  li t0, 0x00000011
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test28
  li t3, 0x00000000
  bne t5, t3, fail

test29:
  li a1, 29
  li t4, 0
label_test29:
  li t1, 0x0000000d
  nop
  li t0, 0x00000008
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test29
  li t3, 0x00000001
  bne t5, t3, fail

test30:
  li a1, 30
  li t4, 0
label_test30:
  li t1, 0x0000000d
  nop
  nop
  li t0, 0x00000012
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test30
  li t3, 0x00000000
  bne t5, t3, fail

test31:
  li a1, 31
  li t4, 0
label_test31:
  li t1, 0x0000000d
  li t0, 0x00000007
  nop
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test31
  li t3, 0x00000001
  bne t5, t3, fail

test32:
  li a1, 32
  li t4, 0
label_test32:
  li t1, 0x0000000d
  nop
  li t0, 0x00000013
  nop
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test32
  li t3, 0x00000000
  bne t5, t3, fail

test33:
  li a1, 33
  li t4, 0
label_test33:
  li t1, 0x0000000d
  li t0, 0x00000006
  nop
  nop
  sltu t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test33
  li t3, 0x00000001
  bne t5, t3, fail

test34:
  li a1, 34
  li t0, 0xffffffff
  sltu t1, x0, t0
  li t3, 0x00000001
  bne t1, t3, fail

test35:
  li a1, 35
  li t0, 0xffffffff
  sltu t1, t0, x0
  li t3, 0x00000000
  bne t1, t3, fail

test36:
  li a1, 36
  sltu t0, x0, x0
  li t3, 0x00000000
  bne t0, t3, fail

test37:
  li a1, 37
  li t0, 0x00000010
  li t1, 0x0000001e
  sltu x0, t0, t1
  li t3, 0x00000000
  bne x0, t3, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
