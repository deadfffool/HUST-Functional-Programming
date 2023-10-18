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

fun split [ ]  = ([ ], [ ]) 
  | split [x] = ([ ], [x])
  | split (x::y::L) =
	let val (A, B) =split L
	in (x::A, y::B) 	
	end;

datatype tree = Empty | Br of tree * int * tree; 

fun trav(Br(t1,a,t2)) = trav(t1)@(a::trav(t2))
  | trav empty = [];

fun listToTree ([] : int list) : tree = Empty
  | listToTree (x::l) = let val (l1, l2) = split l
    	in Br(listToTree l2, x, listToTree l1)
  end;


(*begin*)

fun treecompare(Empty : tree, Empty : tree) = EQUAL
  |treecompare(Empty : tree, _ : tree) = LESS
  |treecompare(_ : tree, Empty : tree) = GREATER
  |treecompare(Br(t1, a, t2), Br(t3, b, t4)) = Int.compare(a, b)

fun SwapDown (Empty: tree): tree = Empty
  | SwapDown (Br(Empty, a, Empty)) = Br(Empty, a, Empty)
  | SwapDown (Br(Br(t1, head1, t2), a, Empty)) = 
    if a <= head1 then
      Br(Br(t1, head1, t2), a, Empty)
    else
      Br(Br(t1, a, t2), head1, Empty)
  | SwapDown (Br(Empty, a, Br(t3, head2, t4))) = 
    if a <= head2 then
      Br(Empty, a, Br(t3, head2, t4))
    else
      Br(Empty, head2, Br(t3, a, t4))
  | SwapDown (Br(Br(t1, head1, t2), a, Br(t3, head2, t4))) = 
    if (a <= head1) andalso (a <= head2) then
      Br(Br(t1, head1, t2), a, Br(t3, head2, t4))
    else if (head1 <= a) andalso (head1 <= head2) then
      if a < head2 then
        Br(SwapDown(Br(t1, head2, t2)), head1, SwapDown(Br(t3, a, t4)))
      else
        Br(SwapDown(Br(t1, a, t2)), head1, SwapDown(Br(t3, head2, t4)))
    else
      if a < head1 then
        Br(SwapDown(Br(t1, head1, t2)), head2, SwapDown(Br(t3, a, t4)))
      else
        Br(SwapDown(Br(t1, a, t2)), head2, SwapDown(Br(t3, head1, t4)));

fun heapify (Empty: tree): tree = Empty
  | heapify (Br(left , a , right)) = SwapDown(Br(heapify(left) , a , heapify(right)));

(*end*)

val L = getIntList(7);
printIntList (trav(heapify(listToTree L)));