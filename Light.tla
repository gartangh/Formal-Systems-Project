---------- MODULE Light ----------

(* Constants *)
CONSTANTS const1, const1, ...

(* Variables *)
VARIABLES color, var2, ...

------------------------------------

(* Sequence of variables *)
vars == << color, var2, ... >>

(* Initialization *)
Init ==	/\ color = "red"
		/\ var2 = ...
		/\ ...

(* Actions *)
Action1(vars) ==	/\ ...
					/\ ...
					/\ ...

Action2(vars) ==	/\ ...
					/\ ...
					/\ ...

...

(* Next state *)
Next ==	\/ Action1(vars)
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
TypeInvariant == color \in {"red", "yellow", "green"}
	(*
		"red":		the train must stop
		"yellow":	the train can continue, but the next light will be red
		"green":		the train cna continue and the nixt light will be yellow or green
	*)

(* Properties *)
...

------------------------------------

(* Theorems *)
THEOREM Spec => ...	

====================================
