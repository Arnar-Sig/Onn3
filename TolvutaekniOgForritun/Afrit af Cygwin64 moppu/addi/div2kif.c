#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int div2kif( int n, int k ) {
    float bias = (pow(2, k))-1;
    if(n>0){
        float plus = (pow(2, k)/n);
        return plus;
    }
    else{
        float minus = bias/n;
        return minus;
    }
}
int main(){
    float x = div2kif(3, 4);
    printf("x: %.5f\n",x);
}