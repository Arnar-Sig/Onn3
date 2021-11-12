#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <assert.h>
#include <math.h>
#include <limits.h>
#include <string.h>
#include <errno.h>


struct Node {
    int line;
    int valid;
    int tag;
    long lru;
    struct Node* next;
};

/* Type: Memory address */
typedef unsigned long long int mem_addr_t;

int s = 0; 
int b = 0; 
int E = 0;
int S = 3;
int B = 5;
struct Node *skyndiminni;

/* 
 * initCache - Allocate memory, write 0's for valid and tag and LRU
 */
void initCache()
{
    skyndiminni = malloc(S * sizeof(struct Node));
    struct Node *current;
    current = skyndiminni;
    
    for(int i =0; i<S; i++){
        struct Node *nytt;
        nytt = malloc(sizeof(struct Node));
        skyndiminni[i]= *nytt;
        current->line = 0;
        current->valid = 0;
        current->lru = 0;
        current->tag = 0;
        for(int lina = 1; lina<E; lina++){
            struct Node *newNode = (struct Node*)malloc(sizeof(struct Node));

            current->next = &newNode;
            current->line = lina;
            current->valid = 0;
            current->lru = 0;
            current->tag = 0;
        }
    }
}

void accessData(mem_addr_t addr)
{

    /* Þið þurfið að útfæra þetta fall sem útfærir minnisaðgang
      printf("  linux>  %s -s 8 -E 2 -b 4 -t traces/yi.trace\n", argv[0]);
     */
   mem_addr_t biti = (addr>>b);
   
    
    

}

void replayTrace(char* trace_fn)
{
    char buf[1000];
    mem_addr_t addr=0;
    unsigned int len=0;
    FILE* trace_fp = fopen(trace_fn, "r");

    if(!trace_fp){
        fprintf(stderr, "%s: %s\n", trace_fn, strerror(errno));
        exit(1);
    }

    while( fgets(buf, 1000, trace_fp) != NULL) {
        if(buf[1]=='S' || buf[1]=='L' || buf[1]=='M') {
            sscanf(buf+3, "%llx,%u", &addr, &len);
      
            accessData(addr);

            /* If the instruction is R/W then access again */
            if(buf[1]=='M')
                accessData(addr);
        }
    }

    fclose(trace_fp);
}


int main(int argc, char* argv[]){
    /*
    initCache();
    struct Node example = skyndiminni[5];
    printf("%ld\n", example.data);
    gamla main
    */
   s = 8;
   b = 4;
   initCache();
   //printf("  linux>  %s -s 8 -E 2 -b 4 -t traces/yi.trace\n", argv[0]);
   struct Node curr = skyndiminni[2];
   printf("lina: %d \n",curr.line);
   printf("next: %s\n", curr.next);
 
   //replayTrace("traces/transpose.trace");


    return 0;
}

