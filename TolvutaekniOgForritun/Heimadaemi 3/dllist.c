/*************************************************************
  Beinagrind fyrir dæmi 3 í heimadæmum 3 í Tölvutækni og forritun,
  haust 2021
  
  Sjá lýsingu verkefnis á dæmablaði 
**************************************************************/
#include <stdio.h>
#include <stdlib.h>

struct dNode {
   int data;
   struct dNode *prev;
   struct dNode *next;
};

/* Prentar út stök í tvítengdum list */
void printlist(struct dNode *h) {
	printf("Listi: ");
	while (h != NULL) {
		printf("%d ", h->data);
		h = h->next;
	}
	printf("\n");
}

/* Setur inn hnút með gildinu v á eftir hnúti númer k í
   víðværum tvítengdum lista */
void insAfter(struct dNode **h, struct dNode **t, int k, int v) {
    struct dNode *q, *p, *temp;
    struct dNode *nyr = (struct dNode *)malloc(sizeof(struct dNode));
    nyr->data = v;
    nyr->next = 0;
    nyr->prev = 0;

    int skip = 0;
    //setja hnút fremst
    if(k==0 && *h!=0){
        temp = *h;
        nyr->next = temp;
        temp->prev = nyr;
        *h = nyr;
        skip = 1;
    }
    if(*h==0){
        *h = nyr;
        skip = 1;
        *t = nyr;
    }
    p = *h;
    q = *h;

    //telja fjölda hnúta
    int counter = 1;
    while(p->next!=0){
        p=p->next;
        counter++;
    }

    //stinga inn hnút
    if(k<counter && skip != 1){
        if(k==1){
            temp = p->next;
            p->next = nyr;
            nyr->prev = p;
            nyr->next = temp;
            temp->prev = nyr;
        }else{
            counter = 1;
            while(counter!=k){
                q = q->next;
                counter++;
            }
            temp = q->next;
            q->next = nyr;
            nyr->prev = q;
            nyr->next = temp;
            temp->prev = nyr;
        }
    }

    //setja aftast
    else if(skip != 1){
        p->next = nyr;
        nyr->prev = p;
        *t = nyr;
    }  
}

int main() {
    int i;
    
    struct dNode *h = NULL;
    struct dNode *tail = NULL;
	// Búa til tvítengdan lista með fallinu insAfter //
    for (i=0; i<10; i++)
        insAfter(&h, &tail, i, 100+i);
    
    printlist(h);

    // Setjum inn gildi á nokkrum stöðum í listann //
    insAfter(&h, &tail, 0, 777);
    insAfter(&h, &tail, 3, 888);
    insAfter(&h, &tail, 20, 999);

    printlist(h);
   return 0;
}
