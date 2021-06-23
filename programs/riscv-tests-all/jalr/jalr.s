######################
#     jalr TESTS     #
######################

.globl __jalr

.text

__jalr:

test01:
  li a1, 1
  li t0, 0
  li t1, 0x00000018
  nop
#  la t1, target_2
  jalr t0, t1, 0
linkaddr_2:
  j fail
target_2:
  li t1, 0x00000014
  nop
#  la  t1, linkaddr_2
  bne t0, t1, fail

test02:
  li a1, 2
  li x4, 0
label1_test02:
  li x6, 0x0000003c
  nop
#  la x6, label2_test02
  jalr x19, x6, 0
  bne x0, a1, fail
label2_test02:
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test02

test03:
  li a1, 3
  li x4, 0
label1_test03:
  li x6, 0x00000064
  nop
#  la x6, label2_test03
  nop
  jalr x19, x6, 0
  bne x0, a1, fail
label2_test03:
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test03

test04:
  li a1, 4
  li x4, 0
label1_test04:
  li x6, 0x00000090
  nop
#  la x6, label2_test04
  nop
  nop
  jalr x19, x6, 0
  bne x0, a1, fail
label2_test04:
  addi x4, x4, 1
  li x5, 2
  bne x4, x5, label1_test04

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
