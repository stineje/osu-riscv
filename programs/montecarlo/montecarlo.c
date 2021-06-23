#include <stdlib.h>
/***MONTE CARLO SIM C IMPLEMENTATION***/
/**To recompile, type `make montecarlo` into terminal**/
int bet();
int play_game(int funds, int wager, int total_plays);

int main (void){
    int play  = 10000;
    int end = play_game(100000, 100, play);
}

int bet(){
    int num = rand() % 100 + 1;
    if(num <= 51){
        return 1;
    }
    else if(num > 51 && num <= 100){
        return 0;
    }
}

int play_game(int funds, int wager, int total_plays){
    int plays = 1;
    while(plays < total_plays){
        int outcome  = bet();
        if(outcome == 1){
            funds += wager;
            plays++;
        }
        else{
            funds -= wager;
            plays++;
        }
    }
    int total_funds = funds;

    return total_funds;
}
