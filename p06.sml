(*
Ariel, the Little Mermaid, was asked by Ursula to give all her beautiful colored pearls in 25pt
exchange for getting transformed into a real girl. Ariel wanted very much to meet prince
Eric in person, but wouldn’t give away all her pearls, so she made a deal with Ursula: she
were to keep the k most shiny pearls and give away all the others.
We know that Ariel’s pearls were of four types: the carved pearls are not shiny at all
and have a “shininess” multiplier of 0; opal-pearls have a multiplier of 2; the faceted pearls
have a multiplier of 4; the akoya pearls have the highest multiplier, namely 10. Each pearl
also has an intrinsic “shininess” that gets multiplied by the multiplier.
You are given the following SML datatype and function signature and you are asked to
return the total value of the “shininess” that Ariel can get:

datatype pearl = carved of int | opal of int | faceted of int | akoya of int;
val shiny = fn : pearl list ∗ int −> int;
For instance to compute
− shiny([carved(2), opal(3), faceted(1), faceted(5), akoya(2), opal(20)], 3);
val it = 80 : int;
we first compute the shininess of the five pearls: [0,6,4,20,20,40], and then add up the
shininess of the k = 3 shiniest ones
*)

fun len([]) = 0 | len (x::L) = 1+len(L);

fun take(L, 0) = [] | take([], _) = [] | take(x::L, n) = x::take(L,n−1);

fun drop(L, 0) = L | drop([], _) = [] | drop(x::L, n) = drop(L, n−1);

datatype pearl=carved of int | opal of int | faceted of int | akoya of int;

fun value(carved(X)) = 0
	| value(opal(X)) = 2*X
	| value(faceted(X)) = 4*X
	| value(akoya(X)) = 10*X;

fun cmp(A, B) = value(A) > value(B);

fun merge([],p,_) = p
	| merge(p,[],_) = p
	| merge(a::p1, b::p2, compare) = if compare(a,b) then a::merge(p1,b::p2,compare) else b::merge(a::p1,p2,compare);

fun sort([], _) = []
	| sort([a], _) = [a]
	| sort(L,cmp) = let val l1 = len(L) val p1 = sort(take(L,l1 div 2),cmp) val p2 = sort(drop(L,l1 div 2),cmp)
					in merge(p1,p2,cmp) 
					end;

fun sum([]) = 0
	| sum(a::L) = value(a) + sum(L);

fun shiny(X,k) = sum(take(sort(X,cmp),k));

(*
ALTERNATIVE FOR SHINY:

fun shiny(X,k) = foldl op+ 0 (take(intsort(map value X),k));
*)

(*
Second option:
datatype pearl=carved of int | opal of int | faceted of int | akoya of int;

fun value(carved(X)) = 0
	| value(opal(X)) = 2*X
	| value(faceted(X)) = 4*X
	| value(akoya(X)) = 10*X;

fun max(a, b) = if a>b then a else b;

fun shiny([], _) = 0
	| shiny(_, 0) = 0
	| shiny(a::L, k) = max( value(a)+shiny(L,k−1), shiny(L,k) );
*)