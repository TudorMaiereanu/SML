(*
We call the sequence of natural numbers with a0 = 0, a1 = 1, an = an−1 +
an−2 the Fibonacci sequence. Write an SML function fib = fn : int −> int that calculates
the nth Fibonacci number. Also, write an SML function is_fib = fn : int −> bool that,
given a number n, calculates whether n is a fibonacci number or not. You are allowed to
define additional functions to help you.
*)

fun fib(n) = if n<=0 then 0 else if n=1 then 1 else fib(n−1) + fib(n−2)

fun is_fib(x) = let
            fun helper(current, value) =
              if fib(current) < value then helper(current + 1, value)
                else if fib(current = value) then true else false;
    in
              helper(0,x)
    end;
