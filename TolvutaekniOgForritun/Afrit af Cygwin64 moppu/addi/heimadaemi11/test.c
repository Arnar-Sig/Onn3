#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>


int main() {
  int x = 2; 
printf("%d\n", x); 
fflush(stdout); 
pid_t y = fork();
if (y == 0) { 
    //printf("fork er: %d\n", y);
    printf("%d\n", ++x); 
} else { 
    printf("%d\n", --x); 
    wait(NULL); 
} 
//printf("fork er: %d\n", y);
printf("%d\n", ++x); 
exit(0);
}