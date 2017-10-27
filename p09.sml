(*
Write a function that takes a list of real numbers and returns the second maximum 20pt
element of the list and raise an exception if there is no such element. For example,
max([1.0, 4.4, 4.5, 6.2, 2.3, 2.2, 2.2]) should return 4.5
*)

exception WrongInput;

fun selmax(nil: real list) = nil
	| selmax(a::nil) = a::nil
	| selmax(a::b::t) = if a>b then b::selmax(a::t) else a::selmax(b::t);

fun remlast(nil) = raise WrongInput
	| remlast(l) = rev(tl(rev(l)));

fun max(nil) = raise WrongInput
	| max(h::nil) = raise WrongInput
	| max(l) = hd(rev(selmax(remlast(selmax(l)))));