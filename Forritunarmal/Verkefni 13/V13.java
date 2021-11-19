
public class V13
{
  // Hvert tilvik af klasanum Container er �l�t fyrir
  // eina heilt�lu. Margir �r��ir geta samt�mis unni�
  // me� �l�ti�.
  static class Container
  {
    boolean isEmpty = true;
    int theValue;
    // Fastayr�ing gagna:
    //   �l�ti� er t�mt ��aa isEmpty s� true.
    //   Ef �l�ti� er ekki t�mt �� inniheldur
    //   theValue gildi� � �l�tinu.

    // Notkun: c.put(x);
    // Eftir:  B�i� er a� setja x � �l�ti� c.
    //         Ef til vill �urfti a� b��a eftir
    //         a� �l�ti� t�mdist ��ur en �a�
    //         t�kst.
    public synchronized void put( int x )
      throws InterruptedException
    {
      while( !isEmpty ) wait();
      isEmpty = false;
      theValue = x;
      notifyAll();
    }

    // Notkun: x = c.get();
    // Eftir:  B�i� er a� s�kja x �r �l�tinu c.
    //         Ef til vill �urfti a� b��a eftir
    //         a� �l�ti� fylltist ��ur en �a�
    //         t�kst.
    public synchronized int get()
      throws InterruptedException
    {
      while( isEmpty ) wait();
      int x = theValue;
      isEmpty = true;
      notifyAll();
      return x;
    }
  }

  // Tilvik af klasanum Producer eru �r��ir sem senda t�lurnar
  // 1,2,...,10000 � �l�t (Container) sem �eir hafa tilv�sun �
  // og deyja svo drottni s�num.
  static class Producer extends Thread
  {
    final Container c;
    // Fastayr�ing gagna:
    //   c er �l�ti� sem �essi Producer sendir t�lur �.

    // Notkun: Producer prod = new Producer(c);
    // Fyrir:  c er Container.
    // Eftir:  prod er Producer sem setur t�lur � c.
    public Producer( Container c )
    {
      this.c = c;
    }

    // Notkun: prod.run();
    // Fyrir:  Ekkert.
    // Eftir:  prod er b�inn a� senda 1 til 10000 � sinn
    //         Container.
    public void run()
    {
      try
      {
        for(int i=1; i<10001; i++){
          // Fj�ldi gilda sem hafa veri� sett � containerinn c
          // er � bilinu 0 - 10000.
          c.put(i);
      }
      }
      catch( InterruptedException e )
      {
		e.printStackTrace();
      }
    }
  }

  // Tilvik af klasanum Consumer eru �r��ir sem taka
  // 10000 t�lur �r �l�ti (Container) sem �eir
  // hafa tilv�sun �, skrifa svo summu talnanna, og
  // deyja svo drottni s�num.
  static class Consumer extends Thread
  {
    final Container c;
    // Fastayr�ing gagna:
    //   c er �l�ti� sem �essi Consumer s�kir t�lur �r.

    // Notkun: Consumer cons = new Consumer(c);
    // Fyrir:  c er Container.
    // Eftir:  cons er Consumer sem s�kir t�lur �r c.
    public Consumer( Container c )
    {
      this.c = c;
    }

    // Notkun: cons.run();
    // Fyrir:  Ekkert.
    // Eftir:  cons er b�inn a� s�kja 10000 t�lur
    //         �r s�num Container og skrifa summuna.
    public void run()
    {
      try
      {
        long sum = 0;
      for(int i = 1; i<10001; i++){
        // Fj�ldi gilda sem hafa veri� tekin �r container c
        // er � bilinu 0 - 10000.
        sum = sum + c.get();
      }
        
        System.out.println(sum);
      }
      catch( InterruptedException e )
      {
		e.printStackTrace();
      }
    }
  }

  // Notkun: (� skipanal�nu) java V13
  // Fyrir:  Ekkert.
  // Eftir:  B�i� er a� skrifa tv�r t�lur sem samanlagt
  //         eru tv�falt 1+2+...+10000
  public static void main( String[] args )
  {
    Container c = new Container();
    Producer prod1 = new Producer(c);
    Producer prod2 = new Producer(c);
    Consumer cons1 = new Consumer(c);
    Consumer cons2 = new Consumer(c);
    prod1.start();
    cons1.start();
    prod2.start();
    cons2.start();
  }
}
