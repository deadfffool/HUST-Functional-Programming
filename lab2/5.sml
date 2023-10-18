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
fun PrefixSum [] = []
  | PrefixSum (x::xs) =
    let
      fun prefixSumHelper [] _ acc = rev acc
        | prefixSumHelper (y::ys) prev acc =
          let
            val curr = y + prev
          in
            prefixSumHelper ys curr (curr::acc)
          end
    in
      prefixSumHelper xs x [x]
    end;

fun fastPrefixSum xs =
    let
        fun prefixSumHelper [] _ acc = rev acc
          | prefixSumHelper (x::xs) prev acc =
            let
                val curr = x + prev
            in
                prefixSumHelper xs curr (curr::acc)
            end
    in
        prefixSumHelper xs 0 []
    end; 
  
(*****End*****)

val L = getIntList(3);
printIntList (PrefixSum L);
printIntList (fastPrefixSum L);
