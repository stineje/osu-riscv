######################
#     lui TESTS      #
######################

.globl __lui

.text

__lui:

test01:
  li a1, 1
  lui t0, 0x00000
  li t3, 0x00000000
  bne t0, t3, fail

test02:
  li a1, 2
  lui t0, 0xfffff
  srai t0,t0,1
  li t3, 0xfffff800
  bne t0, t3, fail

test03:
  li a1, 3
  lui t0, 0x7ffff
  srai t0,t0,20
  li t3, 0x000007ff
  bne t0, t3, fail

test04:
  li a1, 4
  lui t0, 0x80000
  srai t0,t0,20
  li t3, 0xfffff800
  bne t0, t3, fail

test05:
  li a1, 5
  lui x0, 0x80000
  li t3, 0x00000000
  bne x0, t3, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret
