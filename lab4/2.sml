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

(* mapList :((‘a -> ‘b) * ‘a list) -> ‘b list	*)
(* REQUIRES: n>=0				*)
(* ENSURES: 实现整数集的数学变换(如翻倍、求平方或求阶乘) *)

fun mapList(f, []) = []
    | mapList(f, x::L) = f(x)::mapList(f, L);


(***	End		***)
fun double i = 2 * i;
fun square 0 = 0
  | square n = square (n-1) + double n -1;

val x = getIntList (5);

printIntList(mapList(double, x) @ mapList(square,x));