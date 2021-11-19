#include<stdbool.h>
#include<stdio.h>
int main() {
  int x = 16777217 ;
  bool a = (x == (int)(float)x);
  
  if(a == true){
    printf("true");
  }
  else{
    printf("false");
  }
  
  return 0;
}