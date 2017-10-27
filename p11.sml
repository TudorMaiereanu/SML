(*
Write an SML function prefix_code that tests whether a code is a prefix code. The code 20pt
is given as a list of pairs (SML type char∗string list).
Example:

prefix_code [(#"a","0"), (#"b","1")];
val it = true : bool
*)

Solution:
infix mem (* list membership *)

fun x mem nil = false | x mem (y::l) = (x=y) orelse (x mem l)

(* test for repeated elements in list *)
fun repeat nil = false
	| repeat (h::t) = h mem t orelse repeat(t)

fun function rel = not (repeat (map (fn (x,_) => x ) rel))

fun injective rel = not (repeat (map (fn (_,x) => x ) rel))
(*test whether a list is a prefix of another *)

fun prefix_list _ nil = false
	| prefix_list nil _ = true
	| prefix_list (h::t) (k::l) = if (h = k) then prefix_list t l else false;

(*testing if there is an element with property p in list *)
fun exists p nil = false | exists p (h::t) = p h orelse exists p t;

(*testing for the prefix property *)
fun prefix_prop code =
	exists (fn (_,c) =>
		exists (fn (_,d) =>
			prefix_list (explode c) (explode d))
			code)
		code;

fun prefix_code code = function code
	andalso injective code
	andalso prefix_prop code = false;

(*Test cases:*)
val test1 = prefix_code [(#"a","0"), (#"b","10")] = true;
val test2 = prefix_code [(#"a","0"), (#"b","1")] = true;
val test3 = prefix_code [(#"a","0"), (#"b","10"), (#"c", "110")]=true;
val test4 = prefix_code [(#"a","0"), (#"a","10")]=false;
val test5 = prefix_code [(#"a", "0"), (#"b", "01")]=false;