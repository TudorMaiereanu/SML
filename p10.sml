(*
Your task is to implement a function that works similarly to the grep functionality in Linux. 30pt
The input contains three strings: a pattern string, an input file name, and an output file
name. You have to implement a function grep(pattern,infile,outfile), which writes to the
output file those lines from the input file, which contain the pattern string.
For example: Given pattern substring:we have

input 								output
This line contains a substring. 	This line contains a substring.
This line contains strings. 	Strings contain substrings.
Strings contain substrings.
Substrings are strings.

*)
fun readFile(filename) =
	let
		val fin = TextIO.openIn(filename)
		fun read() =
			let
				val x = TextIO.inputLine(fin)
			in
				if x = NONE then [] else (valOf x) :: read()
			end
	in
		read()
	end;

fun writeFile(filename,data) =
	let
		val fout = TextIO.openOut(filename)
		fun write([]) = (TextIO.flushOut(fout); true)
			| write(l::ls) = (TextIO.output(fout,l); write(ls))
	in
		write(data)
	end;

fun grepList(_,nil) = nil
	| grepList(pattern,l::ls) = if (String.isSubstring pattern l)
		then l::grepList(pattern,ls)
		else grepList(pattern,ls);

fun grep(pattern,infile,outfile) = writeFile(outfile,grepList(pattern,readFile(infile)));

