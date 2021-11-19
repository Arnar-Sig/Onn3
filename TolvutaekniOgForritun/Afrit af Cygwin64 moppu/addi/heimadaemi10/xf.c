#include <stdio.h>

extern char main;
char test;

void f() {
    printf("%c\n", main);
    printf("%d\n", main);
    printf("%d\n", test);
}