#ifndef __header
#define __header

typedef int (*test_func_t)();

int __add();
int __addi();
int __and();
int __beq();
int __bge();
int __bgeu();
int __blt();
int __bltu();
int __bne();
int __jal();
int __jalr();
int __lui();
int __lw ();
int __or ();
int __ori();
int __sll();
int __slli();
int __slt();
int __slti();
int __sltu();
int __sltiu();
int __sra();
int __srai();
int __srl();
int __srli();
int __sub();
int __sw();
int test_josephus();
int test_store();

int fail();
int pass();
int write_gpo();
int test_fib();

#endif
