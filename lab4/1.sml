 fun printInt (a:int) =
    print(Int.toString(a)^"\n");

fun getInt () =
    Option.valOf (TextIO.scanStream (Int.scan StringCvt.DEC) TextIO.stdIn);

fun printIntList ( [] ) = ()
  | printIntList ( x::xs ) = 
    let
	val tmp = printInt(x)
    in
	printIntList(xs)
    end;

fun getIntList ( 0 ) = []
  | getIntList ( N:int) = getInt()::getIntList(N-1);
    
(*  完成Begin和End间代码的编写  *)
(***   Begin    ***)

(* thenAddOne :((int ->int) * int) -> int 	*)
(* REQUIRES: n>=0				*)
(* ENSURES: 将一个整数通过函数变换(如翻倍、求平方或求阶乘)后再加1 *)

fun thenAddOne(f, i) = f(i) + 1;

fun testDouble(x) = 2 * x;
fun testSquare(x) = x*x;
fun testFactorial(0) = 1
    | testFactorial(x) = x * testFactorial(x-1);

val x = getInt ();

printInt(thenAddOne(testDouble, x) + thenAddOne(testFactorial,x));