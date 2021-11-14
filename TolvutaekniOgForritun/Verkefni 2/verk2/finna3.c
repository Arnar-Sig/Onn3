#include <math.h>
#include<stdio.h>

int main(){
    for(int s =0;s<20;s++){
        for(int E=1;E<20; E++){
            for(int b=0;b<20;b++){
                if(pow(2,s) * E * pow(2,b) == 32768){
                    printf("s, E, b : %d, %d, %d = \n", s, E, b);
                }
            }
        }
    }
    return 0;
}