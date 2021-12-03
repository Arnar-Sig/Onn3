import java.math.BigInteger;
import java.util.TreeMap;

// Hlutir af tagi V12pq eru forgangsbiðraðir þar sem forgangsröð
// gilda af tagi V er táknuð með gildum af tagi K.  Gildin af
// tagi K verða að vera samanburðarhæf hvort við annað með
// hinu hefðbundna compareTo boði.
public class V12pq<K extends Comparable<? super K>, V>
{
    TreeMap<K,V12Bag<V>> tree;
    
    // Fastayrðing gagna: Forgangsbiðröð sem inniheldur pörin
    //   (k1,v1), (k2,v2), ... , (kN,vN) af lyklum og samsvarandi
    //   gildum, er táknuð með hlut af tagi V12pq sem hefur tree
    //   sem inniheldur eins mörg gildi af tagi V12Bag<V> eins
    //   og fjöldi mismunandi lykla.  Hver af pokunum inniheldur
    //   öll þau gildi sem samsvara lyklinum. Enginn pokanna er
    //   tómur.

    // Notkun: V12pq<K,V> pq = new V12pq<K,V>();
    // Fyrir:  Ekkert.
    // Eftir:  pq er ný tóm forgangsbiðröð.
    public V12pq()
    {
        tree = new TreeMap<K,V12Bag<V>>();
    }    

    // Notkun: pq.put(k,v);
    // Fyrir:  pq er forgangsbiðröð.
    // Eftir:  Búið er að bæta parinu (k,v) í pq.
    public void put( K k, V v )
    {
        V12Bag<V> p = tree.get(k);
        if( p==null )
        {
            p = new V12Bag<V>();
            tree.put(k,p);
        }
        p.add(v);
    }

    // Notkun: v = pq.get();
    // Fyrir:  pq er forgangsbiðröð, ekki tóm.
    // Eftir:  v er gildið sem hafði minnsta lykil k í
    //         pq.  Parið (k,v) hefur verið fjarlægt úr
    //         pq.
    public V get()
    {
        K k = tree.firstKey();
        V12Bag<V> p = tree.get(k);
        V v = p.remove();
        if( p.isEmpty() ) tree.remove(k);
        return v;
    }

    // Notkun: boolean b = pq.isEmpty();
    // Fyrir:  pq er forgangsbiðröð.
    // Eftir:  b er satt þþaa pq sé tóm.
    public boolean isEmpty()
    {
        return tree.size()==0;
    }
    
    /* Hér er önnur útfærsla:
    TreeMap<V12ComparablePair<K,BigInteger>,V> tree;
    BigInteger count;
    
    // Fastayrðing gagna: Forgangsbiðröð sem inniheldur pörin
    //   (k1,v1), (k2,v2), ... , (kN,vN) af lyklum og samsvarandi
    //   gildum, er táknuð með hlut af tagi V12pq sem hefur
    //   count >= 0 og hefur tree sem inniheldur N pör ((kI,xI),vI)
    //   þar sem öll (kI,vI) koma fyrir og um öll xI gildir að
    //   0<xI<=count.  Öll xI gildin eru mismunandi, sem gerir
    //   kleift að tveir lyklar kI og kJ séu jafnir.

    // Notkun: V12pq<K,V> pq = new V12pq();
    // Fyrir:  Ekkert.
    // Eftir:  pq er ný tóm forgangsbiðröð.
    public V12pq()
    {
        tree = new TreeMap<V12ComparablePair<K,BigInteger>,V>();
        count = BigInteger.ZERO;
    }    

    // Notkun: pq.put(k,v);
    // Fyrir:  pq er forgangsbiðröð.
    // Eftir:  Búið er að bæta parinu (k,v) í pq.
    public void put( K k, V v )
    {
        count = count.add(BigInteger.ONE);
        tree.put(new V12ComparablePair<K,BigInteger>(k,count),v);
    }

    // Notkun: v = pq.get();
    // Fyrir:  pq er forgangsbiðröð, ekki tóm.
    // Eftir:  v er gildið sem hafði minnsta lykil k í
    //         pq.  Parið (k,v) hefur verið fjarlægt úr
    //         pq.
    public V get()
    {
        V12ComparablePair<K,BigInteger> k = tree.firstKey();
        V v = tree.get(k);
        tree.remove(k);
        return v;
    }

    // Notkun: boolean b = pq.isEmpty();
    // Fyrir:  pq er forgangsbiðröð.
    // Eftir:  b er satt þþaa pq sé tóm.
    public boolean isEmpty()
    {
        return tree.size()==0;
    }
    */

    // Notkun: V12pq.main(args);
    // Fyrir:  Ekkert
    // Eftir:  Búið er að prófa V12pq klasann með því að prófa
    //         allar aðgerðir í klasanum og með því að raða
    //         fylki af String og öðru fylki af Double.
    //         Ef röðunin kom rétt út í báðum tilvikum og engin
    //         önnur villa fannst var skrifuð ein lína á aðalúttak
    //         (stdout):
    //           Allt í fína
    //         Annars, ef önnur röðunin gaf ranga niðurstöðu eða
    //         önnur villa fannst, þá skrifaðist
    //           Villa í V12pq<String,String>
    //         eða
    //           Villa í V12pq<Double,Double>
    public static void main( String[] args )
    {
        V12pq<String,String> pqs = new V12pq<String,String>();
        V12pq<Double,Double> pqd = new V12pq<Double,Double>();
        String[] as = {"a","x","b","y","c","z","z","z","z","a","a","a"};
        Double[] ad = {1.0,9.0,2.0,8.0,3.0,7.0,4.0,6.0,5.0,1.0,1.0,1.0,9.0,9.0,9.0};
        // Röðum strengjum:
        for( int i=0 ; i!=as.length ; i++ )
            // pqs inniheldur pörin (as[0],as[0]),...,(as[i-1],as[i-1]).
            pqs.put(as[i],as[i]);
        for( int i=0 ; i!=as.length ; i++ )
            // as[0..i-1] inniheldur i minnstu gildin úr upphaflega as,
            // hin gildin eru í pqs.
        {
            as[i] = pqs.get();
        }
        for( int i=1 ; i<as.length ; i++ )
            // Búið er að staðfesta að as[0..i-1] er í vaxandi röð.
        {
            if( as[i].compareTo(as[i-1])<0 )
            {
                System.out.println("Villa í V12pq<String,String>");
                return;
            }
        }
        // Röðum fleytitölum:
        for( int i=0 ; i!=ad.length ; i++ )
            // pqd inniheldur pörin (ad[0],ad[0]),...,(ad[i-1],ad[i-1]).
            pqd.put(ad[i],ad[i]);
        for( int i=0 ; i!=ad.length ; i++ )
            // ad[0..i-1] inniheldur i minnstu gildin úr upphaflega ad,
            // hin gildin eru í pqd.
        {
            ad[i] = pqd.get();
        }
        for( int i=1 ; i<ad.length ; i++ )
            // Búið er að staðfesta að ad[0..i-1] er í vaxandi röð.
        {
            if( ad[i].compareTo(ad[i-1])<0 )
            {
                System.out.println("Villa í V12pq<Double,Double>");
                return;
            }
        }
        System.out.println("Allt í fína");
    }
}
