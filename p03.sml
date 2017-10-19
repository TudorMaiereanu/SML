(*
Create an SML function that given a list of strings groups all strings that are anagrams of
each other together. Two words are called anagrams if they use the same letters the same
amount of times.

Example and function signature:
val listAnagrams = fn : string list −> string list list
− listAnagrams ["algorithm", "listen", "logarithm", "something", "silent", "Silent", "lentis"];
val it = [["algorithm","logarithm"],["listen","silent","lentis"],["something"],["Silent"]] : string list list
*)

fun min [a] = a:char
  | min (a::b::c) = if a < b then min(a::c) else min (b::c);

fun sub (a,[]) = []
  | sub (a, b::c) = if a = b then c else b::(sub (a,c));

fun sublist ([],a) = a
  | sublist (a::b, c) = sublist(b,sub(a,c));

fun sort [] = []
  | sort list = min(list)::sort(sub(min(list),list));

fun anagram a b = sort(explode(a))= sort(explode(b));

fun find (a,[]) = nil
| find (a, b::c) = if anagram a b then b::(find(a,c)) else find(a,c);

fun listAnagrams [] = nil
  | listAnagrams (a::c) = let val list = a::(find(a,c))
                        in list::(listAnagrams(sublist(list,a::c)))
                        end;
