/** A generic array class for comparable values.
 * <P></P>
 * @author         Snorri Agnarsson
 */
public class MyArray<T extends Comparable<? super T>> {

    /* The internal array */
    private Object[] theArray;

    // Data Invariant:
    //   theArray is an array of T objects that contains the contents
    //   of this array.  Each position in theArray corresponds to the
    //   same position in this array.

    /*
     * Creates a new array.
     * 
     * Usage:  a = new MyArray<T>(n);
     * Pre:    n is a non-negative integer.
     * Post:   a contains a new array of T values of size n.
     */
    public MyArray( int n ) {
        // Þetta er ekki hægt:
        //theArray = new T[n];
        // Í staðinn gerum við:
        theArray = new Object[n];
    }

    /*
     * Puts a value into a position in the array.
     *
     * Usage: a.put(i,t);
     * Pre:   0 <= i < a.size().
     * Post:  Position i in a contains t.
     */
    public void put(int i, T x ) {
        theArray[i] = x;
    }

    /*
     * Gets the value from a position in the array.
     *
     * Usage: t = a.get(i);
     * Pre:   0 <= i < a.size().
     * Post:  t contains the value in position i in a.
     */
    public T get( int i ) {
        return (T)theArray[i];
    }

    /*
     * Gets the size of the array.
     * 
     * Usage: n = a.size();
     * Post:  n contains the size of a.
     */
    public int size() {
        return theArray.length;
    }

    /*
     * Copy into this array from another array.
     * 
     * Usage: a.copyFrom(from);</DD>
     * Pre:   from is an array of T or a subclass of T of same size or less than a.
     * Post:  The contents of from have been copied into corresponding positions in a.
     */
    public void copyFrom( MyArray<? extends T> from ) {
        for( int i=0 ; i!=from.size() ; i++ )
            put(i,from.get(i));
    }

    /*
     * Copy from this array into another array.
     * 
     * Usage: a.copyTo(to);
     * Pre:   to is an array of T or a superclass of T of same size or greater than a.
     * Post:  The contents of a have been copied into corresponding positions in to.
     */
    public void copyTo( MyArray<? super T> to ) {
        for( int i=0 ; i!=to.size() ; i++ )
            to.put(i,get(i));
    }

    /*
     * Find maximum value in this array.
     * 
     * Usage: t = a.max();
     * Post:  t contains the maximum value in a according to
     * the compareTo member function of T,
     *        or null if the array only contains nulls.
     */
    public T max() {
        T maxSoFar = null;
        for( int i=0 ; i!=theArray.length ; i++ ) {
            T curr = get(i);
            if( curr==null )
                continue;
            else if( maxSoFar==null )
                maxSoFar = curr;
            else if( maxSoFar.compareTo(curr)<0 )
                maxSoFar = curr;
        }
        return maxSoFar;
    }
    
    public static void main( String[] args ) {
        MyArray<String> sa = new MyArray<String>(100);
        MyArray<Integer> ia = new MyArray<Integer>(100);
        sa.put(0,"zero");
        sa.put(50,"fifty");
        ia.put(0,0);
        ia.put(50,50);
        System.out.println("max string="+sa.max());
        System.out.println("max int="+ia.max());
    }
}
