######################
#     sra TESTS      #
######################

.globl __sra

.text

__sra:

test01:
  li a1, 1
  li t0, 0x80000000
  li t1, 0x00000000
  sra t2, t0, t1
  li t3, 0x80000000
  bne t2, t3, fail

test02:
  li a1, 2
  li t0, 0x80000000
  li t1, 0x00000001
  sra t2, t0, t1
  li t3, 0xc0000000
  bne t2, t3, fail

test03:
  li a1, 3
  li t0, 0x80000000
  li t1, 0x00000007
  sra t2, t0, t1
  li t3, 0xff000000
  bne t2, t3, fail

test04:
  li a1, 4
  li t0, 0x80000000
  li t1, 0x0000000e
  sra t2, t0, t1
  li t3, 0xfffe0000
  bne t2, t3, fail

test05:
  li a1, 5
  li t0, 0x80000001
  li t1, 0x0000001f
  sra t2, t0, t1
  li t3, 0xffffffff
  bne t2, t3, fail

test06:
  li a1, 6
  li t0, 0x7fffffff
  li t1, 0x00000000
  sra t2, t0, t1
  li t3, 0x7fffffff
  bne t2, t3, fail

test07:
  li a1, 7
  li t0, 0x7fffffff
  li t1, 0x00000001
  sra t2, t0, t1
  li t3, 0x3fffffff
  bne t2, t3, fail

test08:
  li a1, 8
  li t0, 0x7fffffff
  li t1, 0x00000007
  sra t2, t0, t1
  li t3, 0x00ffffff
  bne t2, t3, fail

test09:
  li a1, 9
  li t0, 0x7fffffff
  li t1, 0x0000000e
  sra t2, t0, t1
  li t3, 0x0001ffff
  bne t2, t3, fail

test10:
  li a1, 10
  li t0, 0x7fffffff
  li t1, 0x0000001f
  sra t2, t0, t1
  li t3, 0x00000000
  bne t2, t3, fail

test11:
  li a1, 11
  li t0, 0x81818181
  li t1, 0x00000000
  sra t2, t0, t1
  li t3, 0x81818181
  bne t2, t3, fail

test12:
  li a1, 12
  li t0, 0x81818181
  li t1, 0x00000001
  sra t2, t0, t1
  li t3, 0xc0c0c0c0
  bne t2, t3, fail

test13:
  li a1, 13
  li t0, 0x81818181
  li t1, 0x00000007
  sra t2, t0, t1
  li t3, 0xff030303
  bne t2, t3, fail

test14:
  li a1, 14
  li t0, 0x81818181
  li t1, 0x0000000e
  sra t2, t0, t1
  li t3, 0xfffe0606
  bne t2, t3, fail

test15:
  li a1, 15
  li t0, 0x81818181
  li t1, 0x0000001f
  sra t2, t0, t1
  li t3, 0xffffffff
  bne t2, t3, fail

test16:
  li a1, 16
  li t0, 0x81818181
  li t1, 0xffffffc0
  sra t2, t0, t1
  li t3, 0x81818181
  bne t2, t3, fail

test17:
  li a1, 17
  li t0, 0x81818181
  li t1, 0xffffffc1
  sra t2, t0, t1
  li t3, 0xc0c0c0c0
  bne t2, t3, fail

test18:
  li a1, 18
  li t0, 0x81818181
  li t1, 0xffffffc7
  sra t2, t0, t1
  li t3, 0xff030303
  bne t2, t3, fail

test19:
  li a1, 19
  li t0, 0x81818181
  li t1, 0xffffffce
  sra t2, t0, t1
  li t3, 0xfffe0606
  bne t2, t3, fail

test20:
  li a1, 20
  li t0, 0x81818181
  li t1, 0xffffffff
  sra t2, t0, t1
  li t3, 0xffffffff
  bne t2, t3, fail

test21:
  li a1, 21
  li t0, 0x80000000
  li t1, 0x00000007
  sra t0, t0, t1
  li t3, 0xff000000
  bne t0, t3, fail

test22:
  li a1, 22
  li t0, 0x80000000
  li t1, 0x0000000e
  sra t1, t0, t1
  li t3, 0xfffe0000
  bne t1, t3, fail

test23:
  li a1, 23
  li t0, 0x00000007
  sra t0, t0, t0
  li t3, 0x00000000
  bne t0, t3, fail

test24:
  li a1, 24
  li t4, 0
label_test24:
  li t0, 0x80000000
  li t1, 0x00000007
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test24
  li t3, 0xff000000
  bne t5, t3, fail

test25:
  li a1, 25
  li t4, 0
label_test25:
  li t0, 0x80000000
  li t1, 0x0000000e
  sra t2, t0, t1
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test25
  li t3, 0xfffe0000
  bne t5, t3, fail

test26:
  li a1, 26
  li t4, 0
label_test26:
  li t0, 0x80000000
  li t1, 0x0000001f
  sra t2, t0, t1
  nop
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test26
  li t3, 0xffffffff
  bne t5, t3, fail

test27:
  li a1, 27
  li t4, 0
label_test27:
  li t0, 0x80000000
  li t1, 0x00000007
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test27
  li t3, 0xff000000
  bne t5, t3, fail

test28:
  li a1, 28
  li t4, 0
label_test28:
  li t0, 0x80000000
  li t1, 0x0000000e
  nop
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test28
  li t3, 0xfffe0000
  bne t5, t3, fail

test29:
  li a1, 29
  li t4, 0
label_test29:
  li t0, 0x80000000
  li t1, 0x0000001f
  nop
  nop
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test29
  li t3, 0xffffffff
  bne t5, t3, fail

test30:
  li a1, 30
  li t4, 0
label_test30:
  li t0, 0x80000000
  nop
  li t1, 0x00000007
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test30
  li t3, 0xff000000
  bne t5, t3, fail

test31:
  li a1, 31
  li t4, 0
label_test31:
  li t0, 0x80000000
  nop
  li t1, 0x0000000e
  nop
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test31
  li t3, 0xfffe0000
  bne t5, t3, fail

test32:
  li a1, 32
  li t4, 0
label_test32:
  li t0, 0x80000000
  nop
  nop
  li t1, 0x0000001f
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test32
  li t3, 0xffffffff
  bne t5, t3, fail

test33:
  li a1, 33
  li t4, 0
label_test33:
  li t1, 0x00000007
  li t0, 0x80000000
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test33
  li t3, 0xff000000
  bne t5, t3, fail

test34:
  li a1, 34
  li t4, 0
label_test34:
  li t1, 0x0000000e
  nop
  li t0, 0x80000000
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test34
  li t3, 0xfffe0000
  bne t5, t3, fail

test35:
  li a1, 35
  li t4, 0
label_test35:
  li t1, 0x0000001f
  nop
  nop
  li t0, 0x80000000
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test35
  li t3, 0xffffffff
  bne t5, t3, fail

test36:
  li a1, 36
  li t4, 0
label_test36:
  li t1, 0x00000007
  li t0, 0x80000000
  nop
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test36
  li t3, 0xff000000
  bne t5, t3, fail

test37:
  li a1, 37
  li t4, 0
label_test37:
  li t1, 0x0000000e
  nop
  li t0, 0x80000000
  nop
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test37
  li t3, 0xfffe0000
  bne t5, t3, fail

test38:
  li a1, 38
  li t4, 0
label_test38:
  li t1, 0x0000001f
  li t0, 0x80000000
  nop
  nop
  sra t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test38
  li t3, 0xffffffff
  bne t5, t3, fail

test39:
  li a1, 39
  li t0, 0x0000000f
  sra t1, x0, t0
  li t3, 0x00000000
  bne t1, t3, fail

test40:
  li a1, 40
  li t0, 0x00000020
  sra t1, t0, x0
  li t3, 0x00000020
  bne t1, t3, fail

test41:
  li a1, 41
  sra t0, x0, x0
  li t3, 0x00000000
  bne t0, t3, fail

test42:
  li a1, 42
  li t0, 0x00000400
  li t1, 0x00000800
  sra x0, t0, t1
  li t3, 0x00000000
  bne x0, t3, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
