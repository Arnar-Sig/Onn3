#include <stdio.h>
#include <stdlib.h>

int main() {
int n= 100;
int *a= (int *)malloc(n * sizeof(int));
for(int i=0; i<(n); i++){
    a[i] = i;
    if(a[i]%5==0){
        printf("gildi í a: %i\n", a[i]);
    }
}
int m = 200;
int *b = (int *)malloc(m * sizeof(int));
for(int i=0;i<m; i++){
    if(i<n){
        b[i] = a[i];
    }
    else{
        b[i]=0;
    }
}
for(int i=0; i<m; i++){
    printf("gildi í b: %i\n", b[i]);
}
free(a);
free(b);
return 0;
}
