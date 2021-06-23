#include "fib.h"

int fib_helper(int n, int cache[]);
void zero(int *array[], int size);

int fib(int n){
  int cache[8*n];
  zero(&cache, 8*n);
  int res = fib_helper(n, cache);
  return res;
}

void zero(int *array[], int size){
  int i;
  for(i=0; i<size; i++){
    array[i]=0;
  }
  return;
}

int fib_helper(int n, int cache[]){
  if(n == 0 || n == 1){ // base case
    return n;
  }else{
    // check if cache is exists
    // calloc may have return null if the size was zero
    if(cache != 0){
      if(cache[n] == 0){
	int res = fib_helper(n-1, cache) + fib_helper(n-2, cache); // recursive case
	cache[n] = res; // insert into cache
	return res;
      }else{
	return cache[n];
      }
    }else{
      return fib_helper(n-1, cache) + fib_helper(n-2, cache); // recursive case
    }
  }
}

