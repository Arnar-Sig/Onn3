#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    int lengd = 0;
    for(int i=1; i<argc; i++){
        lengd = lengd + strlen(argv[i]);
    }
    printf("lengd: %i\n", lengd);

    int location = 0;
    char nytt[lengd];
    for(int i=1; i<argc; i++){
        for(int j=0; j<strlen(argv[i]);j++){
            nytt[location]=argv[i][j];
            location++;
        }
    }
    nytt[lengd]=0;
    printf("Samskeyting: %s\n", nytt);

   return 0;
}
