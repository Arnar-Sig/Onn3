#ifndef _QUEUEBASE_H
#define _QUEUEBASE_H

// �essi klasi er bi�r�� gilda af tagi T.
// Tagi� T ver�ur a� vera:
//   1) DefaultConstructible,
//      �.e. h�gt er a� skrifa:
//        T x;
//      og
//        T x();
//      Sj� <http://www.sgi.com/tech/stl/DefaultConstructible.html>.
//   2) Assignable, 
//      �.e. h�gt er a� skrifa:
//        T x = y;
//      og
//        T x(y);
//      og
//        T x;
//        x = y;
//      og
//        x = y;
//      Sj� <http://www.sgi.com/tech/stl/Assignable.html>.
template<class T>
class queuebase {

public:

    // Notkun: delete q;
    // Fyrir:  *q er bi�r��.
    // Eftir:  *q hefur veri� eytt, og �llu minni og ��rum g��um
    //         sem *q nota�i hefur veri� skila�.
    virtual ~queuebase() {}

    // Notkun: x = q.Get();
    // Fyrir:  q er ekki t�m.
    // Eftir:  x er fremsta gildi, sem var � q fyrir a�ger�ina.
    //         x hefur veri� fjarl�gt �r q.
    virtual T Get()=0;

    // Notkun: q.Put(x);
    // Fyrir:  q er ekki full.
    // Eftir:  x hefur veri� b�tt aftast � q.
    virtual void Put( const T& )=0;

    // Notkun: n = q.Count();
    // Eftir:  n inniheldur fj�lda gilda � q.
    virtual long Count() const=0;

    // Notkun: b = q.IsFull();
    // Eftir:  b er satt �� og �v� a�eins a� q s� full.
    virtual int IsFull() const=0;
};

#endif
