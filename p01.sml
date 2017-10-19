(*
Consider integer sets in SML as lists of integers. Implement three functions: one that
returns the union of two sets of integers, one that returns the intersection of two sets and
another one which returns the set difference between them. The functions should have the
following signature:

val union = fn : int list ∗ int list −> int list
val intersect = fn : int list ∗ int list −> int list
val setdifference = fn : int list ∗ int list −> int list

Example:

− union([1,2,3],[2,3,4]);
val it = [1,2,3,4] : int list
− intersect([2,3,1],[4,1,7,6]);
val it = [1] : int list
− setdifference([3,1,7,8],[2,1,5,3]);
val it = [7,8] : int list
*)

fun member (a, []) = false
  | member (a, x::xls) = if a=x then true
                          else member(a, xls);

fun union ([], x) = x
  | union (x::ls, y) = if member(x,y) then union(ls, y)
                        else x::union(ls, y);

fun intersect ([], _) = []
  | intersect (a::lsa, lsb) = if member(a, lsb) then a::intersect(lsa, lsb)
                              else intersect(lsa, lsb);
fun setdifference ([]:int list, _) = []
  | setdifference (a::lsa, lsb) = if member(a, lsb) then setdifference(lsa, lsb)
                                  else a::setdifference(lsa, lsb);
