#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <assert.h>
#include <math.h>
#include <limits.h>
#include <string.h>
#include <errno.h>
#include <stdbool.h>


struct Cache {
    int valid;
    int tag;
    long lru;
};

typedef unsigned long long int mem_addr_t;

int s = 6; 
int b = 6; 
int E = 8;
int S = 64;
int B = 64;

int miss_count = 0;
int hit_count = 0;
int eviction_count = 0;
unsigned long long int lru_counter = 0;

struct Cache** skyndiminni;
//Stærsti counter í hverju "mengi" eða hverju hólfi í fylkinu skyndiminni
int* counter;

/* 
 * initCache - Allocate memory, write 0's for valid and tag and LRU
 */
void initCache()
{
    skyndiminni = malloc(S * sizeof(struct Cache*));
    counter = malloc(S* sizeof(int));
    for(int i =0; i<S; i++){
        counter[i] = 0;
        skyndiminni[i] = malloc(E * sizeof(struct Cache));
        for(int l = 0; l<E; l++){
            skyndiminni[i][l].lru = 0;
            skyndiminni[i][l].tag = l;
            skyndiminni[i][l].valid = 0;
        }
    }
}

void printSummary(int hits, int misses, int evictions)
{
    printf("hits: %d  misses: %d  evictions: %d\n", hits, misses, evictions);
    printf("miss ratio: %.2f%%\n", 100.0*misses/(hits+misses));
}

void accessData(mem_addr_t addr)
{
    /* Þið þurfið að útfæra þetta fall sem útfærir minnisaðgang
      printf("  linux>  %s -s 8 -E 2 -b 4 -t traces/yi.trace\n", argv[0]);
     */
    mem_addr_t bbits = (((1 << b)-1)& (addr >> (1-1))); //blokkarhliðrun
    mem_addr_t sbits = (((1 << s)-1)& (addr >> b));     //mengi
    mem_addr_t tbits = addr >> (b+s);                   //tag
    //printf("bbiti: %d\n", bbits);
    //printf("sbiti: %d\n", sbits);
    //printf("tbits: %d\n", tbits);

    /* Af netinu
    mem_addr_t sBit = addr >> b;
    int set = sBit & ((int)pow(2,s) -1);
    printf("set (af neti): %d\n", set);
    */
    //printf("mem_addr_t: %llx\n", addr);
    //printf("bbits: %d\n", bbits);
    //printf("sbits: %d\n", sbits);
    //printf("tbits: %u\n", tbits);

    
    
    int success = 0;
    for(int i = 0; i<E; i++){
        if(skyndiminni[sbits][i].tag == tbits && skyndiminni[sbits][i].valid == 1){
            //printf("i skyndiminni[%d][%d] er tag: %u\n", sbits, i, tbits);
            success = 1;
            skyndiminni[sbits][i].lru = counter[sbits];
            lru_counter++;
            hit_count++;
            if(counter[sbits]<skyndiminni[sbits][i].lru){
                counter[sbits] = skyndiminni[sbits][i].lru;
            }
            break;
        }
    }
    if(success==0){
        int min_lru_line = 0;;
        for(int i = 0; i<E; i++){
            if(skyndiminni[sbits][i].lru < skyndiminni[sbits][min_lru_line].lru){
                min_lru_line = i;
            }
            if(skyndiminni[sbits][i].valid == 0){
                //printf("kaldur skellur, set i skyndiminni[%d][%d] tagid: %u\n", sbits, i, tbits);
                skyndiminni[sbits][i].valid = 1;
                skyndiminni[sbits][i].tag = tbits;
                skyndiminni[sbits][i].lru = lru_counter;
                lru_counter++;
                miss_count++;
                if(counter[sbits] > skyndiminni[sbits][i].lru){
                    counter[sbits] = skyndiminni[sbits][i].lru;
                }
                success = 1;
                break;
            }
        }
        if(success==0){
            skyndiminni[sbits][min_lru_line].valid = 1;
            skyndiminni[sbits][min_lru_line].tag = tbits;
            skyndiminni[sbits][min_lru_line].lru = lru_counter;
            lru_counter++;
            miss_count++;
            success = 1;
        }
    }  
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
   initCache();
   //printf("  linux>  %s -s 8 -E 2 -b 4 -t traces/yi.trace\n", argv[0]);
   replayTrace("traces/gauss.trace");
   printSummary(hit_count, miss_count, eviction_count);

   //printf("%d\n",skyndiminni[S-1][E-1].tag);
   return 0;
}

