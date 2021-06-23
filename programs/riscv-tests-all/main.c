#include "header.h"

test_func_t tests[] = {__add, // 0
		       __addi,// 1
		       __and, // 2
		       __beq, // 3
		       __bge, // 4
		       __bgeu,// 5
		       __blt, // 6
		       __bltu,// 7
		       __bne, // 8
		       __lui, // 9
		       __or,  // A
		       __ori, // B
		       __sll, // C
		       __slli,// D
		       __slt, // E
		       __slti,// F
		       __sltu,// 10
		       __sltiu,// 11
		       __sra,// 12
		       __srai,// 13
		       __srl,// 14
		       __srli,//15
		       __sub,// 16
		       __lw, // 17
		       __sw, // 18
		       test_store, // 19
		       test_fib, // 1A
		       test_josephus // 1B

		       
};

int check(int);

int main(){
  int num_tests = sizeof(tests)/sizeof(test_func_t);
  int index;
  int res;
  for(index = 0; index < num_tests; index++){
    res = tests[index]();
    write_gpo(index);
    if(check(res)){
      fail();
      return 0;
    }
  }
  pass();
  return 0;
}

// returns 1 if value is 17 (wrong result)
int check(int value){
  return (value == 17);
}
  
