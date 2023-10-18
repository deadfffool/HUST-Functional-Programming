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

fun printBool (a:bool) =
    print(Bool.toString(a)^"\n");

   
(*  完成Begin和End间代码的编写  *)
(***   Begin    ***)

(* exists: (‘a -> bool) -> ‘a list -> bool	*)
(* forall: (‘a -> bool) -> ‘a list -> bool  *)
(* REQUIRES: p: t -> bool, L: t list *)
(* ENSURES: 
   exist p L =>* true if there is an x in L such that p x=true;
	         exits p L =>* false otherwise.
	         forall p L =>* true if p x = true for every item x in L;
	         forall p L =>* false otherwise.
 *)
fun exists(p) = fn L => foldr (fn (a, b) => a orelse b) false (map p L)
fun forall(p) = fn L => foldr (fn (a, b) => a andalso b) true (map p L)




(***	End		***)
fun isOdd 0 = false
  | isOdd 1 = true
  | isOdd n = isOdd (n-2);
  
val x = getIntList (5);

printBool((exists isOdd x) andalso (forall isOdd x));
