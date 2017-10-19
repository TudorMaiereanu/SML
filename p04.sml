(*
Write an SML function that removes all duplicate elements from a list. For instance
remove_duplicates([true, true, false]) = [true, false];
remove_duplicates([5,3,12,3,3,2]) = [5,3,12,2];
*)

fun member(a, h::t) = a=h orelse member(a, t)
  | member(_, nil) = false;

fun helper(found_already, h::t) = if member(h, found_already) then helper(found_already, t)
                                  else h::helper(h::found_already, t)
  | helper(_, nil) = nil;

fun remove_duplicates(l) = helper(nil, l);
