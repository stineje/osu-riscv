	# Ross Thompson
	# October 29, 2019
	# Oklahoma State University

.section .text	
.global __test_csr
.type __test_csr, @function

__test_csr:
	# load a value into a gpr 
	li	t0, 0x100
	li	t1, 0
	# transfer that value into a csr
	csrrw	x0, mscratch, t0
	# read back the csr
	csrrw	t1, mscratch, x0
	bne	t0, t1, fail

success:
  li a0, 10
  ret

fail:
  li a0, 17
  ret

