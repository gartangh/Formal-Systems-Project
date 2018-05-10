---------- MODULE Switch ----------

(* Constants *)
CONSTANTS const1, const1, ...

(* Variables *)
VARIABLES state, var2, ...

------------------------------------

(* Sequence of variables *)
vars == << state, var2, ... >>

(* Initialization *)
Init ==	/\ state = "first"
		/\ var2 = ...
		/\ ...

(* Actions *)
Switch(state) ==	/\ ...
					/\ ...
					/\ state = "first" ? state' = "second" | state' = "first" /\ UNCHANGED var2

Action2(vars) ==	/\ ...
					/\ ...
					/\ ...

...

(* Next state *)
Next ==	\/ Switch(state)
		\/ Action2(vars)
		\/ ...

------------------------------------

(* Liveness *)
Live ==	/\ ...
		/\ ...

(* Specification *)
Spec ==	/\ Init
		/\ [][Next]_vars
		/\ Live

------------------------------------

(* Invariants / Temporal properties to verify *)
TypeInvariant == state \in {"first", "second"}

...

(* Properties *)
...

------------------------------------

(* Theorems *)
THEOREM Spec => ...	

====================================
