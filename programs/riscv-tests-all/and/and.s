######################
#     and TESTS      #
######################

.globl __and

.text

__and:

test01:
  li a1, 1
  li t0, 0xff00ff00
  li t1, 0x0f0f0f0f
  and t2, t0, t1
  li t3, 0x0f000f00
  bne t2, t3, fail

test02:
  li a1, 2
  li t0, 0x0ff00ff0
  li t1, 0xf0f0f0f0
  and t2, t0, t1
  li t3, 0x00f000f0
  bne t2, t3, fail

test03:
  li a1, 3
  li t0, 0x00ff00ff
  li t1, 0x0f0f0f0f
  and t2, t0, t1
  li t3, 0x000f000f
  bne t2, t3, fail

test04:
  li a1, 4
  li t0, 0xf00ff00f
  li t1, 0xf0f0f0f0
  and t2, t0, t1
  li t3, 0xf000f000
  bne t2, t3, fail

test05:
  li a1, 5
  li t0, 0xff00ff00
  li t1, 0x0f0f0f0f
  and t0, t0, t1
  li t3, 0x0f000f00
  bne t0, t3, fail

test06:
  li a1, 6
  li t0, 0x0ff00ff0
  li t1, 0xf0f0f0f0
  and t1, t0, t1
  li t3, 0x00f000f0
  bne t1, t3, fail

test07:
  li a1, 7
  li t0, 0xff00ff00
  and t0, t0, t0
  li t3, 0xff00ff00
  bne t0, t3, fail

test08:
  li a1, 8
  li t4, 0
label_test08:
  li t0, 0xff00ff00
  li t1, 0x0f0f0f0f
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test08
  li t3, 0x0f000f00
  bne t5, t3, fail

test09:
  li a1, 9
  li t4, 0
label_test09:
  li t0, 0x0ff00ff0
  li t1, 0xf0f0f0f0
  and t2, t0, t1
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test09
  li t3, 0x00f000f0
  bne t5, t3, fail

test10:
  li a1, 10
  li t4, 0
label_test10:
  li t0, 0x00ff00ff
  li t1, 0x0f0f0f0f
  and t2, t0, t1
  nop
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test10
  li t3, 0x000f000f
  bne t5, t3, fail

test11:
  li a1, 11
  li t4, 0
label_test11:
  li t0, 0xff00ff00
  li t1, 0x0f0f0f0f
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test11
  li t3, 0x0f000f00
  bne t5, t3, fail

test12:
  li a1, 12
  li t4, 0
label_test12:
  li t0, 0x0ff00ff0
  li t1, 0xf0f0f0f0
  nop
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test12
  li t3, 0x00f000f0
  bne t5, t3, fail

test13:
  li a1, 13
  li t4, 0
label_test13:
  li t0, 0x00ff00ff
  li t1, 0x0f0f0f0f
  nop
  nop
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test13
  li t3, 0x000f000f
  bne t5, t3, fail

test14:
  li a1, 14
  li t4, 0
label_test14:
  li t0, 0xff00ff00
  nop
  li t1, 0x0f0f0f0f
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test14
  li t3, 0x0f000f00
  bne t5, t3, fail

test15:
  li a1, 15
  li t4, 0
label_test15:
  li t0, 0x0ff00ff0
  nop
  li t1, 0xf0f0f0f0
  nop
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test15
  li t3, 0x00f000f0
  bne t5, t3, fail

test16:
  li a1, 16
  li t4, 0
label_test16:
  li t0, 0x00ff00ff
  nop
  nop
  li t1, 0x0f0f0f0f
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test16
  li t3, 0x000f000f
  bne t5, t3, fail

test17:
  li a1, 17
  li t4, 0
label_test17:
  li t1, 0x0f0f0f0f
  li t0, 0xff00ff00
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test17
  li t3, 0x0f000f00
  bne t5, t3, fail

test18:
  li a1, 18
  li t4, 0
label_test18:
  li t1, 0xf0f0f0f0
  nop
  li t0, 0x0ff00ff0
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test18
  li t3, 0x00f000f0
  bne t5, t3, fail

test19:
  li a1, 19
  li t4, 0
label_test19:
  li t1, 0x0f0f0f0f
  nop
  nop
  li t0, 0x00ff00ff
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test19
  li t3, 0x000f000f
  bne t5, t3, fail

test20:
  li a1, 20
  li t4, 0
label_test20:
  li t1, 0x0f0f0f0f
  li t0, 0xff00ff00
  nop
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test20
  li t3, 0x0f000f00
  bne t5, t3, fail

test21:
  li a1, 21
  li t4, 0
label_test21:
  li t1, 0xf0f0f0f0
  nop
  li t0, 0x0ff00ff0
  nop
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test21
  li t3, 0x00f000f0
  bne t5, t3, fail

test22:
  li a1, 22
  li t4, 0
label_test22:
  li t1, 0x0f0f0f0f
  li t0, 0x00ff00ff
  nop
  nop
  and t2, t0, t1
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label_test22
  li t3, 0x000f000f
  bne t5, t3, fail

test23:
  li a1, 23
  li t0, 0xff00ff00
  and t1, x0, t0
  li t3, 0x00000000
  bne t1, t3, fail

test24:
  li a1, 24
  li t0, 0x00ff00ff
  and t1, t0, x0
  li t3, 0x00000000
  bne t1, t3, fail

test25:
  li a1, 25
  and t0, x0, x0
  li t3, 0x00000000
  bne t0, t3, fail

test26:
  li a1, 26
  li t0, 0x11111111
  li t1, 0x22222222
  and x0, t0, t1
  li t3, 0x00000000
  bne x0, t3, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
