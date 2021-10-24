// Author: Snorri Agnarsson.

// Dafny analogues of common and classic
// list processing primitives and functions.

// Permalink: https://rise4fun.com/Dafny/xR7n

// Usage: cons(x,y)
// Pre:   x is a value of type T,
//        y is a sequence of type seq<T>.
// Value: A sequence of type seq<T> that
//        is constructed by prepending x
//        to y.
function method cons<T>( x: T, y: seq<T> ): seq<T>
{
  [x]+y
}

// Usage: car(z)
// Pre:   z is a non-empty sequence of type seq<T>.
// Value: The first value in the sequence.
function method car<T>( z: seq<T> ): T
  requires z != [];
  ensures car(z) == z[0];
{
  z[0]
}

// Usage: cdr(z)
// Pre:   z is a non-empty sequence of type seq<T>.
// Value: The tail of the sequence.
function method cdr<T>( z: seq<T> ): seq<T>
  requires z != [];
  ensures cdr(z) == z[1..];
{
  z[1..]
}

// Usage: IsReverse(a,b)
// Pre:   a and b are sequences of the same type.
// Value: True iff a is the reverse of b (and vice
//        versa).
predicate IsReverse<T>( a: seq<T>, b: seq<T> )
{
  |a| == |b| &&
  forall i | 0 <= i < |a| :: a[i] == b[|a|-i-1]
}

// Usage: Main();
// Pre:   Nothing.
// Post:  A line containing "OK" has been written.
method Main()
{
  assert IsReverse([1,2,3],[3,2,1]);
  assert !IsReverse([],[1]);
  print "OK";
}

// Usage: Reverse_loop(x)
// Pre:   x is a sequence.
// Value: A sequence containing the same values as x,
//        but in reversed order.
method Reverse_loop<T>( x: seq<T> ) returns ( r: seq<T> )
  ensures IsReverse(x,r);
{
  r := [];
  var rest := x;
  ghost var done := [];
  while rest != []
    decreases |rest|;
    invariant IsReverse(done,r);
    invariant x == done+rest;
  {
    r := cons(car(rest),r);
    done := done+[car(rest)];
    rest := cdr(rest);
  }
}

// Usage: Append(x,y)
// Pre:   x and y are sequences of the same type.
// Value: A sequence containing the values of x and y appended.
method Append<T>( x: seq<T>, y: seq<T> ) returns ( r: seq<T> )
  ensures r == x+y;
  decreases |x|;
{
  if x == []
  {
    r := y;
    return;
  }
  r := Append(cdr(x),y);
  r := cons(car(x),r);
}

// Usage: Map(f,x)
// Pre:   x=[x1,...,xN] is a sequence, f is a function that
//        can take each element of x as argument.
// Value: The sequence [f(x1),...,f(xN)].
function Map<T,U>( f: T->U, x: seq<T> ): seq<U>
  ensures |x| == |Map(f,x)|;
  ensures forall i | 0 <= i < |x| :: Map(f,x)[i] == f(x[i]);
{
  if x == [] then
    []
  else
    cons(f(car(x)),Map(f,cdr(x)))
}

// Usage: RevMap(f,x)
// Pre:   x=[x1,...,xN] is a sequence, f is a function that
//        can take each element of x as argument.
// Value: The sequence [f(xN),...,f(x2),f(x1)].
method RevMap<T,U>( f: T->U, x: seq<T> ) returns ( r: seq<U> )
  ensures IsReverse(r,Map(f,x));
{
  r := [];
  var rest := x;
  ghost var done := [];
  while rest != []
    invariant done+rest == x;
    invariant IsReverse(r,Map(f,done));
    decreases |rest|;
  {
    r := cons(f(car(rest)),r);
    done := done+[car(rest)];
    rest := cdr(rest);
  }
}

// Usage: Map_loop(f,x)
// Pre:   x=[x1,...,xN] is a sequence, f is a function that
//        can take each element of x as argument.
// Value: The sequence [f(x1),...,f(xN)].
method Map_loop<T,U>( f: T->U, x: seq<T> ) returns ( r: seq<U> )
  ensures r == Map(f,x);
{
  var z := Reverse_loop(x);
  r := RevMap(f,z);
}

// Usage: FoldL(f,u,x)
// Pre:   f is a function f:UxT->U for some types U and T,
//        u is of type U, x=[x1,...,xN] is a sequence of values
//        of type T.
// Value: Where $ is the binary operation a$b = f(a,b), the value
//        is the result of computing u$x1$...$xN, computing from
//        left to right.
function method FoldL<U,T>( f: (U,T)->U, u: U, x: seq<T> ): U
{
  if x == [] then
    u
  else
    FoldL(f,f(u,car(x)),cdr(x))
}

// Usage: FoldR(f,x,u)
// Pre:   f is a function f:TxU->U for some types U and T,
//        u is of type U, x=[x1,...,xN] is a sequence of values
//        of type T.
// Value: Where $ is the binary operation a$b = f(a,b), the value
//        is the result of computing x1$...$xN$u, computing from
//        right to left.
function method FoldR<T,U>( f: (T,U)->U, x: seq<T>, u: U ): U
{
  if x == [] then
    u
  else
    f(car(x),FoldR(f,cdr(x),u))
}

// The following two obvious lemmas are put as axioms here.
// For automatic verification knurds (nerds) the proofs can
// be found here: https://rise4fun.com/Dafny/VmGh

lemma {:axiom} FoldL_lemma<U,T>(  f: (U,T)->U, u: U, x: seq<T> )
  requires x != [];
  ensures FoldL(f,u,x) == f(FoldL(f,u,x[..|x|-1]),x[|x|-1]);

lemma {:axiom} FoldR_lemma<T,U>( f: (T,U)->U, x: seq<T>, u: U, y: seq<T> )
  requires IsReverse(x,y);
  ensures FoldR(f,x,u) == FoldL((a,b)=>f(b,a),u,y);

// Usage: FoldL_loop(f,u,x)
// Pre:   f is a function f:UxT->U for some types U and T,
//        u is of type U, x=[x1,...,xN] is a sequence of values
//        of type T.
// Value: Where $ is the binary operation a$b = f(a,b), the value
//        is the result of computing u$x1$...$xN, computing from
//        left to right.
method FoldL_loop<U,T>( f: (U,T)->U, u: U, x: seq<T> ) returns ( r: U )
  ensures r == FoldL(f,u,x);
{
  r := u;
  var rest := x;
  ghost var done := [];
  while rest != []
    invariant r == FoldL(f,u,done);
    invariant x == done+rest;
    decreases rest;
  {
    FoldL_lemma(f,u,done+[car(rest)]);
    r := f(r,car(rest));
    done := done+[car(rest)];
    rest := cdr(rest);
  }
  assert x == done;
}

// Usage: FoldR_loop(f,x,u)
// Pre:   f is a function f:TxU->U for some types U and T,
//        u is of type U, x=[x1,...,xN] is a sequence of values
//        of type T.
// Value: Where $ is the binary operation a$b = f(a,b), the value
//        is the result of computing x1$...$xN$u, computing from
//        right to left.
method FoldR_loop<T,U>( f: (T,U)->U, x: seq<T>, u: U ) returns ( r: U )
  ensures r == FoldR(f,x,u);
{
  var rev := Reverse_loop(x);
  FoldR_lemma(f,x,u,rev);
  r := FoldL_loop((a,b)=>f(b,a),u,rev);
}