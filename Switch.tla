---------- MODULE Switch ----------

(* Variables *)
VARIABLES state

------------------------------------

(* Sequence of variables *)
vars == << state >>
States == {"first", "second"}

(* Initialization *)
Init ==	state = "first"

(* Actions *)
SwitchFirst == state' = "first" 

SwitchSecond == state' = "second" 

InFirstState == /\ state = "first"
                /\ UNCHANGED state

InSecondState == /\ state = "second"
                 /\ UNCHANGED state

Next == \/ SwitchFirst
        \/ SwitchSecond

------------------------------------

(* Specification *)
Spec ==	/\ Init
        /\ [][Next]_vars

------------------------------------

(* Invariants / Temporal properties to verify *)
TypeInvariant == state \in States

------------------------------------

(* Theorems *)
THEOREM Spec => []TypeInvariant

====================================
