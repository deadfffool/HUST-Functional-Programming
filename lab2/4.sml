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

(*  完成Begin和End间代码 *)    
(*****Begin*****)
fun reverse xs =
    let
        fun reverseHelper ([], acc) = acc
          | reverseHelper (x::xs, acc) = reverseHelper (xs, x::acc)
    in
        reverseHelper (xs, [])
    end;


fun reverse2 [] = []
  | reverse2 (x::xs) =
    let
      fun reverseHelper [] acc = acc
        | reverseHelper (y::ys) acc = reverseHelper ys (y::acc)
    in
      reverseHelper xs [x]
    end;


(*****End*****)

val R = getIntList(5);
printIntList (reverse R);
printIntList (reverse2 R); 