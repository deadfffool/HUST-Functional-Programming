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
 (* zip : string list * int list -> (string * int) list *)
fun zip ([],[]) = []
  | zip ([], _) = []
  | zip (_, []) = []
  | zip (x::xs, y::ys) = (x, y) :: zip (xs, ys);
 
 (* unzip : (string * int) list -> string list * int list *)
fun unzip [] = ([], [])
  | unzip ((x, y)::rest) =
    let
      val (xs, ys) = unzip rest
    in
      (x::xs, y::ys)
    end;
  
 (*** End ***)

[("a",1), ("b",2)] = zip(["a","b"],[1,2]);
print (Bool.toString it ^ "\n");
[("a",1)]=zip(["a"],[1,2,3]);
print (Bool.toString it ^ "\n");
[("a",1), ("b",2)] = zip(["a","b","c","d"],[1,2]);
print (Bool.toString it ^ "\n");

(["a","b"],[1,2]) = unzip([("a",1), ("b",2)]);
print (Bool.toString it ^ "\n");
(["dragon","llama","muffin"],[42,54,76]) = unzip([("dragon",42),("llama",54),("muffin",76)]);
print (Bool.toString it ^ "\n");