	# Ross Thompson
	# November 04, 2019
	# Oklahoma State University

.section .text	
.global __test_m_ecall
.type __test_mecall, @function

__test_m_ecall:
	# 1. first load  ISR routin into mtvec (this is done in startup)
	# 2. assign a call back to the ecall exception
	# 2. use ecall to generate interrupt to mtvec routin
	# 3. return from ISR.

	addi	sp, sp, -28
	sw	s0, 0(sp)
	sw	s1, 4(sp)
	sw	s2, 8(sp)
	sw	s3, 12(sp)
	sw	s4, 16(sp)
	sw	s5, 20(sp)
	sw	s6, 24(sp)

	# setup the supervisor isr.
	la	t0, __s_trap_handler
	csrrw	x0, stvec, t0


	la	t0, s_ecall_cb
	la	t1, isr_s_ecall_cb_fp
	sw	t0, 0(t1)

	la	t0, u_ecall_cb
	la	t1, isr_u_ecall_cb_fp
	sw	t0, 0(t1)

	la	t0, m_ecall_cb
	la	t1, isr_m_ecall_cb_fp
	sw	t0, 0(t1)
	

	li	s6, 0 # delegation mode
	li	s5, 3
deleg_loop:	
	li	s4, 0 # privilege mode
	li	s3, 3
	
mode_loop:	
	li	s0, 0
	li	s1, 20

	# selects the counter
	slli	t0, s6, 3	# multiply by 8
	slli	t1, s6, 2	# multiply by 4
	add	t0, t0, t1	# x * 12 = (x * 8) + (x * 4)
	slli	t1, s4, 2	# multiply by 4
	la	t2, index_array
	add	t2, t0, t2
	add	t2, t1, t2	# points to the index_array[index]
	lw	t2, 0(t2)
	la	s2, local_m_ecall_counter
	add	s2, s2, t2	# points to the specific mode counter
	sw	x0, 0(s2)	# set counter to zero

loop:
	# set a7 to 0 so we can execute a call back function
	li 	a7, 0
	ecall	# x mode ecall
	addi	s0, s0, 1
	bne	s0, s1, loop

	lw	t1, 0(s2)
	bne	s1, s0, fail
	bne	t1, s1, fail

	# change mode and rerun the test
	addi	s4, s4, 1
	li	a7, 1
	ecall	# change mode by decrementing the privilege
	blt	s4, s3, mode_loop

	# switch back to supervisor mode
	li	a7, 2
	ecall	# increment mode
	# switch back to machine mode	
	li	a7, 2
	ecall	# increment mode

	# if deleg_loop 0 then we set the medelg bit
	bne	s6, x0, skip_medeleg_set
	# set the trap delegtation for supervisor and user evironment exceptions.
	li	t0, 0x00000300	# bits 9 and 8 of medeleg
	csrrw	x0, medeleg, t0

skip_medeleg_set:	
	# if deleg_loop 1 then we set the sedelg bit
	li	t0, 1
	bne	s6, t0, skip_sedeleg_set
	# set the trap delegtation for user evironment exception.
	li	t0, 0x00000100	# bit 8 of sedeleg
	csrrw	x0, sedeleg, t0

skip_sedeleg_set:	
	addi	s6, s6, 1
	blt	s6, s5, deleg_loop

	mv	t0, x0
	csrrw	x0, medeleg, t0
	csrrw	x0, sedeleg, t0	

	lw	s0, 0(sp)
	lw	s1, 4(sp)
	lw	s2, 8(sp)
	lw	s3, 12(sp)	
	lw	s4, 16(sp)
	lw	s5, 20(sp)
	lw	s6, 24(sp)
	addi	sp, sp, 28

end:	
	li	a0, 10
	ret

fail:
	li	a0, 17
	j	end


.section .text
.global m_ecall_cb
.type m_ecall_cb, @function
m_ecall_cb:
	la	t1, local_m_ecall_counter
	lw	t0, 0(t1)
	addi	t0, t0, 1
	sw	t0, 0(t1)
	ret

.section .text
.global s_ecall_cb
.type s_ecall_cb, @function
s_ecall_cb:
	la	t1, local_s_ecall_counter
	lw	t0, 0(t1)
	addi	t0, t0, 1
	sw	t0, 0(t1)
	ret

.section .text
.global u_ecall_cb
.type u_ecall_cb, @function
u_ecall_cb:
	la	t1, local_u_ecall_counter
	lw	t0, 0(t1)
	addi	t0, t0, 1
	sw	t0, 0(t1)
	ret

.section .data
local_m_ecall_counter:	
.int 0
local_s_ecall_counter:	
.int 0
local_u_ecall_counter:	
.int 0
.section .data
index_array:
# machine delegation
.int 0 # machine
.int 0 # super
.int 0 # user
# supervisor delegation	
.int 0 # machine
.int 4 # super
.int 4 # user
# user delegation
.int 0 # machine
.int 4 # super
.int 8 # user
