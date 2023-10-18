fun printInt (a:int) =
    print(Int.toString(a)^" ");

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

 
(*** Begin ***)
fun interleave([],R):int list = R
| interleave(L,[]) = L
| interleave(x::L,y::R) = x::y::interleave(L,R);


(*****End*****)

val L = getIntList(2);
val R = getIntList(6);
val O = interleave (L, R);
printIntList(O); 