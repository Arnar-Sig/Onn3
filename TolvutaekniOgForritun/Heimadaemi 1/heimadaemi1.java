import edu.princeton.cs.algs4.*;

public class heimadaemi1 {
  public static void main(String[] args) {
    int a = 50000;
    float b = 1e20f;
    float bUt = b + (-b+3.14f);
    long c = Long.MAX_VALUE;
    double d = 5000000000000000000.0;
    double dUt = d + (-d+3.14);

    System.out.println("int: 50000*50000 = " + a*a);
    System.out.println("float: 1e20 + (-1e20 + 3.14) = " + bUt);
    System.out.println("Haesta long talan = " + c + " og " + c + " * 2 = " + c*2);
    System.out.println("double: 5000000000000000000.0 + (-5000000000000000000.0+3.14) = " + dUt);
  }
}
