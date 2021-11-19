#include <stdio.h>
#include <math.h>

int veldi(int a, int n) {
    if(n==0){
        return 1;
    }
    else if(n%2==0){
        return veldi(a*a, n/2);
    }
    else{
        return a * veldi(a*a,n/2);
    }
}



int main() {
    int ut = veldi(2,4);
    printf("ut: %d\n", ut);
    return 0;
}



