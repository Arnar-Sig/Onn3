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
    // Fastayr�ing gagna:
    //  Gildin � bi�r��inni eru � f[i..(i+n-1)%MAX] �
    //  t�mar��.  f[i] er �v� fremst og fer fyrst �t.
    //  � �essari runu fylgir f[0] � eftir f[MAX-1].
    //  Lj�st er a� fj�ldi gilda � bi�r��inni er n og
    //  h�marksfj�ldi er MAX.

public:
    // Notkun: queuearray<T,MAX> p;
    // Fyrir:  T er tag me� gildisveitingu, sj�lfgefnum smi�
    //         og afritssmi�.  MAX er j�kv�tt const long gildi.
    // Eftir:  p er n� t�m bi�r�� me� pl�ss fyrir MAX T gildi.
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
