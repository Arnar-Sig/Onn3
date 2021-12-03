#ifndef _QUEUECHAIN_H
#define _QUEUECHAIN_H
#include "queuebase.h"
#include <assert.h>


template<class T>
class queuechain: public queuebase<T> {
private:
    long n;
    class link {
    public:
        T      val;
        link*  next;
    } *chain;
    // Fastayrðing gagna:
    //   Fjöldi gilda í biðröðinni er n.
    //   Stök biðraðarinnar eru í hringkeðjunni chain.
    //   chain vísar á aftasta hlekk í hringtengdri keðju,
    //   sem inniheldur gildi biðraðarinnar.  Fremsti 
    //   hlekkurinn inniheldur það gildi sem næst fer út,
    //   og svo koll af kolli fram að aftasta hlekk (sem
    //   chain bendir á), sem inniheldur það gildi sem
    //   síðast fer út.
    //   Ef biðröðin er tóm þá er chain==0.

public:
    // Notkun: queuechain<T> q;
    // Fyrir:  T er tag með gildisveitingu, sjálfgefnum smið
    //         og afritssmið.
    // Eftir:  q er ný tóm biðröð með ótakmarkað pláss.
    queuechain() {
        n=0;
        chain=0;
    }
	
    virtual ~queuechain() { while( Count()!=0 ) Get(); }
    virtual T Get();
    virtual void Put(const T&);
    virtual long Count() const { return n; }
    virtual int IsFull() const { return (0); }
};

template<class T>
T queuechain<T>::Get() {
    assert( chain!=0 );
    n--;
    link *first = chain->next;
    T result=first->val;
    if( chain==first )
        chain = 0;
    else
        chain->next = first->next;
    delete first;
    return result;
}

template<class T>
void queuechain<T>::Put( const T& x ) {
    link *last = new link;
    n++;
    last->val = x;
    if( chain==0 ) {
        chain = last;
        last->next = last;
    }
    else {
        last->next = chain->next;
        chain->next = last;
        chain = last;
    }
}

#endif
