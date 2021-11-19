#include <stdio.h>
#include <stdlib.h>

int div2k( int n, int k ) {
    int bias = (n >> 31) & ((1<<k)-1);
    return (n + bias) >> k;
}