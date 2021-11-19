#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int fun3( int n ) {return (n<<16) | ((n>>16) & 0xFFFF);}


int main(int argc, char *argv[]) {
    int x = fun3(-32769);
    printf("Utkoma: %i\n", x);
   return 0;
}
