#include "fib.h"

  int gold[] = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55,
  		89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765};

int test_fib(){
  int i;
  for(i=1; i<sizeof(gold)/sizeof(int); i++){
    int res = fib(i);
    if(res != gold[i]){
      return 17;
    }
  }
  return 10;
}

