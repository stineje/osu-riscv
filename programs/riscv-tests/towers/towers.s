#Towers of Hanoi Problem, Functioning Edition
#By Peter Tikalsky

#Better version to come as my brain cells align
#Credit to Andriy Makukha on Stack Overflow for creating a MIPS version
#Link: https://stackoverflow.com/questions/50382420/hanoi-towers-recursive-solution-using-mips/50383530#50383530
#I've adapted this MIPS implementation to run on our RISCV processor

.section .text
.global _start
_start:
  add a0, x0, 0 # move to $a0
  li a2, 'A'
  li a3, 'B'
  li a4, 'C'
    jal hanoi           # call hanoi routine

move:
   #move has to recurse
   #bge num bit > 1
   # sub
       #save in stack
       addi sp, sp, -20
       sw   s0, 4(sp)
       sw   s1, 8(sp)
       sw   s2, 12(sp)
       sw   s3, 16(sp)

       add s0, a0, x0
       add s1, a2, x0
       add s2, a3, x0
       add s3, a4, x0

       addi t1, x0, 1
       beq s0, t1, out

       recur1:

           addi a0, s0, -1
           add a1, s1, x0
           add a2, s3, x0
           add a3, s2, x0
           jal hanoi

           j out

       recur2:

           addi a0, s0, -1
           add a1, s3, zero
           add a2, s2, zero
           add a3, s1, zero
           jal hanoi

       exitmove:

           lw   ra, 0(sp)        # restore registers from stack
           lw   s0, 4(sp)
           lw   s1, 8(sp)
           lw   s2, 12(sp)
           lw   s3, 16(sp)

           addi sp, sp, 20       # restore stack pointer
      out:

      beq s0, t1, exithanoi
      j recur2
