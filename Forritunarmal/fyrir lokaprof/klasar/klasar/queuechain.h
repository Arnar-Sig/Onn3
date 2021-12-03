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
    // Fastayr�ing gagna:
    //   Fj�ldi gilda � bi�r��inni er n.
    //   St�k bi�ra�arinnar eru � hringke�junni chain.
    //   chain v�sar � aftasta hlekk � hringtengdri ke�ju,
    //   sem inniheldur gildi bi�ra�arinnar.  Fremsti 
    //   hlekkurinn inniheldur �a� gildi sem n�st fer �t,
    //   og svo koll af kolli fram a� aftasta hlekk (sem
    //   chain bendir �), sem inniheldur �a� gildi sem
    //   s��ast fer �t.
    //   Ef bi�r��in er t�m �� er chain==0.

public:
    // Notkun: queuechain<T> q;
    // Fyrir:  T er tag me� gildisveitingu, sj�lfgefnum smi�
    //         og afritssmi�.
    // Eftir:  q er n� t�m bi�r�� me� �takmarka� pl�ss.
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
