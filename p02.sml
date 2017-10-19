(*
Given a sequence an we call a0 − a1 + a2 − a3 + . . . the alternating sum of 
the sequence. Write an SML function alternating with type int list −> int that calculates
the alternating sum of the list.
*)

fun alternating(nil) = 0
  | alternating(a::b) = a − alternating(b);
