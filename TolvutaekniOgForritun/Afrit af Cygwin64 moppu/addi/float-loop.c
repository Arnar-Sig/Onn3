/************************************************************
   Forrit sem ítrar frá 0.0 til lokagildis með upphækkun 0.1
   Dæmi 1 í heimadæmum 5 í Tölvutækni og forritun, 2021
*************************************************************/
#include <stdio.h>

int main ()
{
    float val;
    float end = 1.0;
    float sum = 0.0;

    printf ("Ítra með fleytitölum frá %.2f til %.2f, upphækkun %.2f\n", val, end, 0.1);

    for (val=0.0; val!=end; val+=0.1) {
        sum += val;
        printf ("val = %.15f;  sum = %.15f\n", val, sum);
    }

    printf ("Lykkju lokið með val = %.2f;  sum = %.2f\n", val, sum);

}
