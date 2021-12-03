// Notkun: queuetest < INN > UT
// Fyrir:  INN inniheldur allt að 1000 fleytitölur á textasniði
// Eftir:  UT inniheldur sömu tölur í sömu röð

// Höfundur: Snorri Agnarsson

// Þetta forrit þýðist á minni vél undir Cygwin, með skipuninni
//    g++ -o queuetest.exe queuetest.C

#include "queuearray.h"
#include "queuechain.h"
#include <iostream>

using namespace std;

// Notkun: main();
// Fyrir:  Aðalinntak inniheldur allt að 1000 fleytitölur.
// Eftir:  Búið er að lesa tölurnar og skrifa þær í lesröð
//         á aðalúttak.
int main() {
    queuearray<double,1000> q;
    while(1) {
        // Búið er að lesa núll eða fleiri fleytitölur, 
        // og q inniheldur þær í lestrarröð.
        double x;
        if( cin >> x )
            q.Put(x);
        else
            break;
    }
    queuechain<double> q2;
    while( q.Count()!=0 ) q2.Put(q.Get());
    while( q2.Count()!=0 ) q.Put(q2.Get());
    while( q.Count() != 0 ) {
        // Búið er að skrifa núll eða fleiri fremstu lesnu
        // tölurnar, hinar eru í lestrarröð í q.
        cout << q.Get() << endl;
    }
}
