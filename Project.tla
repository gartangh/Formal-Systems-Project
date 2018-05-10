---------- MODULE Project ----------

(* Constants *)
CONSTANTS const1, const2, ...

(* Variables *)
VARIABLES
	p1, p2, p3, p4,
	lcw, ldw, lfe, fge, l1e, l2e, l3e, l4e, l1w, l2w, l3w, l4w,
		(* TODO Add lights law and lbw *)
	sw2, sw3, sw5, sw6, sw8, sw10, sw11
		(* TODO Add switches sw1, sw4, sw7, sw9, sw12*)


------------------------------------

(* Sequences of variables *)
platforms == << p1, p2, p3, p4 >>
lights == << lcw, ldw, lfe, fge, l1e, l2e, l3e, l4e, l1w, l2w, l3w, l4w >>
switches == << sw1, sw2, sw3, sw4, sw5, sw6, sw7, sw8, sw9, sw10, sw11, sw12 >>
vars == << platforms, lights, switches >>

(* Initialization *)
Init ==	/\ var1 = ...
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
TypeInvariant == \A 

...

(* Properties *)
...

------------------------------------

(* Theorems *)
THEOREM Spec => ...	

====================================
