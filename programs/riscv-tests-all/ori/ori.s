######################
#     ori TESTS      #
######################

.globl __ori

.text

__ori:

test01:
  li a1, 1
  li t0, 0xff00ff00
  ori t2, t0, -241
  li t3, 0xffffff0f
  bne t2, t3, fail

test02:
  li a1, 2
  li t0, 0x0ff00ff0
  ori t2, t0, 240
  li t3, 0x0ff00ff0
  bne t2, t3, fail

test03:
  li a1, 3
  li t0, 0x00ff00ff
  ori t2, t0, 1807
  li t3, 0x00ff07ff
  bne t2, t3, fail

test04:
  li a1, 4
  li t0, 0xf00ff00f
  ori t2, t0, 240
  li t3, 0xf00ff0ff
  bne t2, t3, fail

test05:
  li a1, 5
  li t0, 0xff00ff00
  ori t0, t0, 240
  li t3, 0xff00fff0
  bne t0, t3, fail

test06:
  li a1, 6
  li t4, 0
label1_test06:
  li t0, 0x0ff00ff0
  ori t2, t0, 240
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test06
  li t3, 0x0ff00ff0
  bne t5, t3, fail

test07:
  li a1, 7
  li t4, 0
label1_test07:
  li t0, 0x00ff00ff
  ori t2, t0, 1807
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test07
  li t3, 0x00ff07ff
  bne t5, t3, fail

test08:
  li a1, 8
  li t4, 0
label1_test08:
  li t0, 0xf00ff00f
  ori t2, t0, 240
  nop
  nop
  addi t5, t2, 0
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test08
  li t3, 0xf00ff0ff
  bne t5, t3, fail

test09:
  li a1, 9
  li t4, 0
label1_test09:
  li t0, 0x0ff00ff0
  ori t2, t0, 240
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test09
  li t3, 0x0ff00ff0
  bne t2, t3, fail

test10:
  li a1, 10
  li t4, 0
label1_test10:
  li t0, 0x00ff00ff
  nop
  ori t2, t0, -241
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test10
  li t3, 0xffffffff
  bne t2, t3, fail

test11:
  li a1, 11
  li t4, 0
label1_test11:
  li t0, 0xf00ff00f
  nop
  nop
  ori t2, t0, 240
  addi t4, t4, 1
  li t6, 2
  bne t4, t6, label1_test11
  li t3, 0xf00ff0ff
  bne t2, t3, fail

test12:
  li a1, 12
  ori t0, x0, 240
  li t3, 0x000000f0
  bne t0, t3, fail

test13:
  li a1, 13
  li t0, 0x00ff00ff
  ori x0, t0, 1807
  li t3, 0x00000000
  bne x0, t3, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
