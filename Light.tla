---------- MODULE Light ----------

EXTENDS Naturals

(* Variables *)
VARIABLES color

------------------------------------

(* Sequence of variables *)
vars == << color >>
Colors == {"red", "green"}

(* Initialization *)
Init == color = "red"

(* Actions *)
SetGreen == color' = "green"

SetRed == color' = "red"

Next == \/ SetGreen
        \/ SetRed

------------------------------------

(* Specification *)
Spec == /\ Init
        /\ [][Next]_vars

------------------------------------

(* Invariants / Temporal properties to verify *)
TypeInvariant == color \in Colors

------------------------------------

(* Theorems *)
THEOREM Spec => []TypeInvariant

====================================
