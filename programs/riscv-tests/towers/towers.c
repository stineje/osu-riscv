/**
Here is an implementation of the Towers of Hanoi problem
**/

void move(int n, int pole1, int pole2, int targetpole);

int main(void)
 {
  move(4, 1, 2, 3);

}

void move(int n, int pole1, int pole2, int targetpole)
{
  if (n > 1) {
    move(n - 1, pole1, pole2, targetpole);
    //printf("Move disk from pole %d to pole %d\n", pole1, targetpole);
    move(n - 1, pole2, pole1,  targetpole);
  } else {
    //printf("Move disk from pole %d to pole %d\n", pole1, targetpole);
  }
}
