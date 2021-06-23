/* # The Josephus Problem    */

/* This problem stems from an old account of the Siege of Yodfat by a jewish historian, one Flavius Josephus. */
/* >a group of soldiers of size *n* are standing in a circle, and are trapped by the enemy. Choosing death over capture, they move around the circle, skipping *k* people, where the *k* th person is executed<sup>1</sup>. */
/* The process repeats itself until there is only one person remaining, leaving that one person to live and decide whether to be captured or to kill themselves. */

/* The question proposed is: **for any number of people in the circle, what point should one stand in if they want to stay alive?** */

/* While the process itself is quite interesting, this implementation uses bitwise operands and shifting as suggested in the [Josephus Problem Wikipedia solution](https://en.wikipedia.org/wiki/Josephus_problem#Solution). */

/* In this directory, I have the C implementation, the RISCV-Assembly solution, and the corresponding hex files. Input can be any positive integer in the 32-bit range. */

/* Special thanks to Ross Thompson for helping me run the makefile for converting C to RISCV-Assembly, helping with running the programs in vsim, and just overall making sure I didn't blow anything up by mistake. */


/* `1: in this implementation, k = 2.` */

/* `This test was designed and implemented by Peter Tikalsky in 2019` */


int highestBit(int n){
  n |= (n >>  1);
  n |= (n >>  2);
  n |= (n >>  4);
  n |= (n >>  8);
  n |= (n >> 16);
  return n - (n >> 1);
}

int test_josephus(){
  int  i = 4115206;
  int hb = highestBit(i*2);
  int final = ~hb & ((i<<1) | 1);
  int expected = 4036109;
  if(final != expected){
    return 17;
  }else{
    return 10;
  }
}
