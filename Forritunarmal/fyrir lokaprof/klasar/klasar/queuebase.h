#ifndef _QUEUEBASE_H
#define _QUEUEBASE_H

// Þessi klasi er biðröð gilda af tagi T.
// Tagið T verður að vera:
//   1) DefaultConstructible,
//      þ.e. hægt er að skrifa:
//        T x;
//      og
//        T x();
//      Sjá <http://www.sgi.com/tech/stl/DefaultConstructible.html>.
//   2) Assignable, 
//      þ.e. hægt er að skrifa:
//        T x = y;
//      og
//        T x(y);
//      og
//        T x;
//        x = y;
//      og
//        x = y;
//      Sjá <http://www.sgi.com/tech/stl/Assignable.html>.
template<class T>
class queuebase {

public:

    // Notkun: delete q;
    // Fyrir:  *q er biðröð.
    // Eftir:  *q hefur verið eytt, og öllu minni og öðrum gæðum
    //         sem *q notaði hefur verið skilað.
    virtual ~queuebase() {}

    // Notkun: x = q.Get();
    // Fyrir:  q er ekki tóm.
    // Eftir:  x er fremsta gildi, sem var í q fyrir aðgerðina.
    //         x hefur verið fjarlægt úr q.
    virtual T Get()=0;

    // Notkun: q.Put(x);
    // Fyrir:  q er ekki full.
    // Eftir:  x hefur verið bætt aftast í q.
    virtual void Put( const T& )=0;

    // Notkun: n = q.Count();
    // Eftir:  n inniheldur fjölda gilda í q.
    virtual long Count() const=0;

    // Notkun: b = q.IsFull();
    // Eftir:  b er satt þá og því aðeins að q sé full.
    virtual int IsFull() const=0;
};

#endif
