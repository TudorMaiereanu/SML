(*
In music theory, notes are divided into groups of 12 semitones. Those groups are called 20pt
octaves. In each octave, we have the familiar 7 note classes - A, B, C, D, E, F and
G (ordered from lowest to highest). In order to denote all 12 semitones, we use the
special symbols operators: sharp (#) and flat (@), which mean 1 semitone higher and lower,
respectively. Now we only need to know the number of semitones between those classes:

A to B : 2 semitones 	B to C : 1 semitone
C to D : 2 semitones 	D to E : 2 semitones
E to F : 1 semitone 	F to G : 2 semitones
G to A : 2 semitones 		   :

This leads to many different representations of the same note. For example, C = #B =
@@D = #@C
For a computer program, representing each note with a unique integer is much more
convenient. To do that, we number all the notes by increasing pitch: A from octave 0
becomes 0, #A from octave 0 becomes 1, A from octave 1 becomes 12, B from octave 1
become 14, etc.
You are given an SML datatype for notes:
datatype noteclass = A | B | C | D | E | F | G |
	| sharp of noteclass
	| flat of noteclass;

datatype note = note of int * noteclass;  -> octave number and note class 

Write an SML function that converts a list of notes from the datatype to the integer
representation described above. Example and signature:

val convert = fn : note list −> int list
− convert([note(0,sharp(A)), note(1,flat(flat(B)))]);
val it = [1,12] : int list
*)

fun toneval(note(x,A)) = x*12
	| toneval(note(x,B)) = x*12+2
	| toneval(note(x,C)) = x*12+3
	| toneval(note(x,D)) = x*12+5
	| toneval(note(x,E)) = x*12+7
	| toneval(note(x,F)) = x*12+8
	| toneval(note(x,G)) = x12+10
	| toneval(note(x,sharp(n))) = toneval(note(x,n)) + 1
	| toneval(note(x,flat(n))) = toneval(note(x,n)) − 1;

fmiun convert(ls) = map toneval ls;
