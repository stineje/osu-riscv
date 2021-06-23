// https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Example_3

int isqrt(int num) {
  int ret = 0;
  int bit = 1 << 30; // The second-to-top bit is set

  // "bit" starts at the highest power of four <= the argument.
  while (num < bit) {
    bit >>= 2;
  }

  while (bit != 0) {
    if (num < ret + bit) {
      ret >>= 1;
    } else {
      num -= ret + bit;
      ret = (ret >> 1) + bit;
    }
    bit >>= 2;
  }
  return ret;
}
