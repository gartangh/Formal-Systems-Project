---------- MODULE Switch ----------
(* Variables *)
VARIABLES state

------------------------------------

(* Sequence of variables *)
vars == << state >>
States == {"first", "second"}

(* Initialization *)
Init ==	/\ state = "first"

(* Actions *)
Switch == state = "first" ? state' = "second" | state' = "first"

InFirstState == /\ state = "first"
                /\ UNCHANGED state

InSecondState == /\ state = "second"
                 /\ UNCHANGED state

Next == Switch

------------------------------------

(* Liveness *)
Live == TRUE

(* Specification *)
Spec ==	/\ Init
        /\ [][Next]_vars
		/\ Live

------------------------------------

(* Invariants / Temporal properties to verify *)
TypeInvariant == state \in States

(* Properties *)


------------------------------------

(* Theorems *)
THEOREM Spec => []TypeInvariant

====================================
