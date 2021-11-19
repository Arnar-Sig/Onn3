#include <stdio.h>
#include <stdlib.h>

int main() {
    int data[1];
    FILE *skra;
    skra = fopen("gildi.txt","r");
    char gogn[400];
    int j = 0;
    int max;
    int min;
    int diff;
    while(fscanf(skra, "%c", data)!=EOF){
        gogn[j] = data[0];
        j++;
        printf("data[0]: %c\n", data[0]);
    }
    printf("utan lykkju\n");
    printf("gogn 345 : %c \n", gogn[50]);
    printf("lykkjur bunar \n");
    diff = max - min;

    printf("max: %d\n", max);
    printf("min: %d\n", min);
}
