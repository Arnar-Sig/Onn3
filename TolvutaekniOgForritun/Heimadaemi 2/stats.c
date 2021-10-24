#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main(int argc, char *argv[]) {
   //printf("argc er: %d\n", argc);
   if(argc < 2){
      printf("Needs a command line argument!");
   }
   else if(argc == 2){
      printf("sum: %s\n", argv[1]);
      printf("max: %s\n", argv[1]);
      printf("min: %s\n", argv[1]);
   }
   else if(argc>2){
      int sum = 0;
      int max;
      int min;
      bool maxInit = false;
      bool minInit = false;
      for(int i=1; i<argc; i++){
         int val = atoi(argv[i]);
         sum = sum + val;
         if(maxInit==false){
            max = val;
            maxInit = true;
         }
         if(minInit==false){
            min = val;
            minInit = true;
         }
         if(val>max){
            max = val;
            }
         if(val<min){
            min = val;
         }
      }
      printf("sum: %i\n", sum);
      printf("max: %i\n", max);
      printf("min: %i\n", min);
   }
}