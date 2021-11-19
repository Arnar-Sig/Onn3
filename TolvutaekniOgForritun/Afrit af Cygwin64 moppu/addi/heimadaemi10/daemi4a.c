#include <stdio.h> 
int vixl(void); 
 
int a[5] = {1, 2, 4, 6, 8}; 
int n = 5; 
 
int cnt = 0; 
 
int main(int argc, char** argv) { 
   int c = vixl(); 
   printf("cnt: %d, c: %d\n", cnt, c); 
   return 0; 
} 