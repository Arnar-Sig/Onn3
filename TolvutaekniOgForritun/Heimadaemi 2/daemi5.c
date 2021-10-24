#include <stdio.h>
#include <stdlib.h>

struct Node{
    int val;
    struct Node *next;
};

struct Node* insAfter(struct Node* head, int k, int v){
    struct Node *p, *q, *temp;
    p = head;
    q = head;
    struct Node *nyr = (struct Node *)malloc(sizeof(struct Node));
    nyr->val = v;
    nyr->next = 0;
    
    //telja fjölda hnúta
    int counter = 1;
    while(p->next!=0){
        p=p->next;
        counter++;
    }

    //setja hnút fremst
    if(k==0){
        nyr->next = head;
        return nyr;
    }

    //stinga inn hnút
    else if(k<counter){
        if(k==1){
            temp = head->next;
            head->next = nyr;
            nyr->next = temp;
        }else{
            counter = 1;
            while(counter!=k){
                q = q->next;
                counter++;
            }
            temp = q->next;
            q->next = nyr;
            nyr->next = temp;
        }
    }

    //setja aftast
    else{
        p->next = nyr;
    }
    return head;
}

int main() {
    //setja inn 10 stök
    struct Node *x;
    struct Node *adal = (struct Node *)malloc(sizeof(struct Node));
    adal->val=0; 
    adal->next=0;
    x=adal;

    //bæta við 9 stökum í tengdan lista sem hefur gildin 0 í fyrsta hnút upp í 9 í hnút nr. 10
    for(int i = 1; i<10; i++){
        adal = insAfter(adal, i, i);
    }

    /*stinga inn gildum "000" í fyrsta hnút, 
    "333" á eftir þriðja hnút og "202020" á eftir tuttuguast hnút
    */
   
   adal = insAfter(adal, 0, 000);
   adal = insAfter(adal, 3, 333);
   adal = insAfter(adal, 20, 202020);

    //prenta út allan listann
    x = adal;
    for(x=adal; x!=0; x=x->next){
        printf("Nóða númer: %d \n", x->val);
    }
    return 0;
}

