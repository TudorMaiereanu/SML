(*
Your new favorite game is Angry Birds, and, after a lazy afternoon when you have played 25pt
the game, you observed the following rules for deducing the score:
the red bird will always add 5000 points to your score (no matter what it hits)
• the blue bird always is split into 3 smaller birds, and every bird adds 1000 points if
it hits an object
• the yellow bird will add 2500 birds only if it hits a green pig
• the white bird is considered peaceful and will add no points to your score
Your version of Angry Birds permits you to choose K from a list of birds which you
will fire. Therefore, you design the following SML datatype:

datatype angrybird = white | red | blue of int | yellow of bool;

The int parameter of the blue bird tells you how many birds hit an object, and the bool
parameter of the yellow bird tells you if the bird hits a pig or not.
You are required to write an SML function getScore which takes a list of Angry Birds
and the number K of birds you can fire and returns the maximum score you can get by
firing your choice of K birds:

val getScore = fn : angrybird list * int −> int;
− getScore( [white, white, red, blue(3)], 3 );
val it = 8000 : int; (∗ red, blue and one of the whites are chosen ∗)
− getScore( [red, yellow(false), yellow(true), blue(2)], 2);
val it = 7500 : int; (∗ red and yellow(true) are chosen ∗)

*)

datatype angrybird = white | red | blue of int | yellow of bool;

fun convert(white) = 0
	| convert(red) = 5000
	| convert(blue(x)) = x*1000
	| convert(yellow(x)) = if x then 2500 else 0;

fun getScore(l,k)= let 
	val l1 = map convert l
	val l2 = ListMergeSort.sort (op<) l1
	in foldl (op+) 0 (List.take(l2, k))
	end;
