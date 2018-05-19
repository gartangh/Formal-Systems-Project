---------- MODULE Light ----------
(* Variables *)
VARIABLES color

------------------------------------

(* Sequence of variables *)
vars == << color >>
Colors = {"red", "yellow", "green"}

(* Initialization *)
Init == /\ color = "green"

(* Actions *)
SetGreen == color' = "green"

SetYellow == color' = "yellow"

SetRed == color' = "red"

IsGreen == /\ color = "green"
           /\ UNCHANGED vars

IsYellow == /\ color = "yellow"
            /\ UNCHANGED vars

IsRed == /\ color = "red"
         /\ UNCHANGED vars

Next == \/ SetGreen
        \/ SetYellow
        \/ SetRed

------------------------------------

(* Liveness *)
Live ==	TRUE

(* Specification *)
Spec == /\ Init
        /\ [][Next]_vars
        /\ Live


------------------------------------

(* Invariants / Temporal properties to verify *)
TypeInvariant == color \in Colors
	(*
		"red":		the train must stop
		"yellow":	the train can continue, but the next light will be red
		"green":	the train cna continue and the next light will be yellow or green
	*)  

(* Properties *)

------------------------------------

(* Theorems *)
THEOREM Spec => []TypeInvariant	

====================================
