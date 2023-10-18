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

fun getsubL ([], i) = ([],[])
   | getsubL (xs, 0) = ([],xs)
   | getsubL (x::xs, i) = 
	 let 
		val (a,b) = getsubL(xs,i-1)
	 in ((x::a),b)
	end;
    
    
(*  完成Begin和End间代码的编写  *)

(*****Begin*****)

(* mult : int list -> int 		*)
(* REQUIRES: true		*)
(* ENSURES: mult(L) evaluates to the product of the integers in L. *)
fun mult [ ] = 	1	
  | mult (x ::L) = x * mult(L);

(* Mult : int list list -> int 	*)
(* REQUIRES: true		*)
(* ENSURES: Mult(R) evaluates to the product of all the integers in the lists of R. *)

fun Mult [ ] = 	1
  | Mult (r :: R) = mult(r) * Mult(R);
(*****end*****)


val L = getIntList(10);
val (L1,L2) = getsubL(L,3);
val (L3,L4) = getsubL(L2,2);
val L5 = L1::L3::L4::[];
printInt(Mult L5);