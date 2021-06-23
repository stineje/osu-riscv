
int highestBit(int n);


int main(void) {
  int  i = 4115206;
  int hb = highestBit(i*2);
  int final = ~hb & ((i<<1) | 1);
  printf("With %d many people, sit in seat %d\n", i, final);
  int expected = 4036109;

}

int highestBit(int n){
  n |= (n >>  1);
  n |= (n >>  2);
  n |= (n >>  4);
  n |= (n >>  8);
  n |= (n >> 16);
  return n - (n >> 1);

}
