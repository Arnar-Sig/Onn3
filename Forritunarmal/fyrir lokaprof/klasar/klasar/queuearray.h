#ifndef _QUEUEARRAY_H
#define _QUEUEARRAY_H

#include "queuebase.h"
#include <assert.h>

template<class T,const long MAX>
class queuearray: public queuebase<T> {
private:
    T f[MAX];
    long n;
    long i;
    // Fastayrðing gagna:
    //  Gildin í biðröðinni eru í f[i..(i+n-1)%MAX] í
    //  tímaröð.  f[i] er því fremst og fer fyrst út.
    //  Í þessari runu fylgir f[0] á eftir f[MAX-1].
    //  Ljóst er að fjöldi gilda í biðröðinni er n og
    //  hámarksfjöldi er MAX.

public:
    // Notkun: queuearray<T,MAX> p;
    // Fyrir:  T er tag með gildisveitingu, sjálfgefnum smið
    //         og afritssmið.  MAX er jákvætt const long gildi.
    // Eftir:  p er ný tóm biðröð með pláss fyrir MAX T gildi.
    queuearray() { n=0; i=0; }

    virtual T Get();
    virtual void Put(const T&);
    virtual long Count() const { return n; }
    virtual int IsFull() const { return (n!=MAX); }
};

template<class T,const long MAX>
T queuearray<T,MAX>::Get() {
    assert( n>0 );
    T result=f[i];
    T temp;
    f[i] = temp;
    i = (i+1)%MAX;
    n--;
    return result;
}

template<class T,const long MAX>
void queuearray<T,MAX>::Put( const T& x ) {
    assert(n<MAX);
    long j=(i+n)%MAX;
    f[j]=x;
    n++;
}

#endif
