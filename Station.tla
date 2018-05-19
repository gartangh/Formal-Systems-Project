---------- MODULE Station ----------

(* Constants *)
CONSTANTS Tracks

(* Variables *)
VARIABLES
	
    (* Lights *)
        (* TODO: Add lights LAW and LBW *)
    LCW == INSTANCE Light,
    LDW == INSTANCE Light,
    LFE == INSTANCE Light,
    LGE == INSTANCE Light,
    L1E == INSTANCE Light,
    L2E == INSTANCE Light,
    L3E == INSTANCE Light,
    L4E == INSTANCE Light,
    L1W == INSTANCE Light,
    L2W == INSTANCE Light,
    L3W == INSTANCE Light,
    L4W == INSTANCE Light,

    (* Switches *)
        (* TODO: Add switches SA1, SB1, SC1, SC3, SD2 *)
    SA2 == INSTANCE Switch,
    SB2 == INSTANCE Switch,
    SC2 == INSTANCE Switch,
    SD1 == INSTANCE Switch,
    SF1 == INSTANCE Switch,
    SG1 == INSTANCE Switch,
    SH1 == INSTANCE Switch,

    (* Tracks and platforms*)
	    (* TODO: Add A, B *)
    C == INSTANCE Track,
    D == INSTANCE Track,
    F == INSTANCE Track,
    G == INSTANCE Track,
    P1 == INSTANCE Track,
    P2 == INSTANCE Track,
    P3 == INSTANCE Track,
    P4 == INSTANCE Track,

------------------------------------

(* Sequences of variables *)
platforms == << P1, P2, P3, P4 >>
lights == << LCW, LDW, LFE, LGE, L1E, L2E, L3E, L4E, L1W, L2W, L3W, L4W >>
switches == << sw1, sw2, sw3, sw4, sw5, sw6, sw7, sw8, sw9, sw10, sw11, sw12 >>
tracks == << C, D, F, G >>
vars == << platforms, lights, switches, tracks >>

(* Initialization *)
Init == /\ LCW!Init
        /\ LDW!Init
        /\ LFE!Init
        /\ LGE!Init
        /\ L1E!Init
        /\ L2E!Init
        /\ L3E!Init
        /\ L4E!Init
        /\ L1W!Init
        /\ L2W!Init
        /\ L3W!Init
        /\ L4W!Init
        /\ SA2!Init
        /\ SB2!Init
        /\ SC2!Init
        /\ SA2!Init
        /\ SA2!Init
        /\ SA2!Init
        /\ SA2!Init
        /\ C!Init /\ C!SetPosition("C")
        /\ D!Init /\ D!SetPosition("D")
        /\ F!Init /\ F!SetPosition("F")
        /\ G!Init /\ G!SetPosition("G")
        /\ P1!Init /\ P1!SetPosition("P1")
        /\ P2!Init /\ P2!SetPosition("P2")
        /\ P3!Init /\ P3!SetPosition("P3")
        /\ P4!Init /\ P4!SetPosition("P4")

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
