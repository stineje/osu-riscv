.section .text
.global fail
.type fail, @function

fail:
	li t3, 0xF
	sw t3, 0xFFFFFFFC(x0)
	li t3, 0x0
	sw t3, 0xFFFFFFFC(x0)
	li t3, 0xF
	sw t3, 0xFFFFFFFC(x0)
	ret

.section .text
.global pass
.type pass, @function

pass:	
	li t3, 0xA
	sw t3, 0xFFFFFFFC(x0)
	li t3, 0x5
	sw t3, 0xFFFFFFFC(x0)
	li t3, 0xA
	sw t3, 0xFFFFFFFC(x0)
	li t3, 0x5
	sw t3, 0xFFFFFFFC(x0)
	li t3, 0xA
	sw t3, 0xFFFFFFFC(x0)
	ret


.section .text
.global write_gpo
.type write_gpo, @function
write_gpo:
	sw a0, 0xFFFFFFFC(x0)
	ret
