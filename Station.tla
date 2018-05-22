---------- MODULE Station ----------

(* ---------------------------------------- VARIABLES ---------------------------------------- *)
VARIABLES
    (* Lights *)
        (* LAW == INSTANCE Light, *)
        (* LBW == INSTANCE Light, *)
        LCW == INSTANCE Light,
        (* LDW == INSTANCE Light, *)
        (* LFE == INSTANCE Light, *)
        LGE == INSTANCE Light,
        (* L1E == INSTANCE Light, *)
        L2E == INSTANCE Light,
        L3E == INSTANCE Light,
        L4E == INSTANCE Light,
        L1W == INSTANCE Light,
        L2W == INSTANCE Light,
        L3W == INSTANCE Light,
        L4W == INSTANCE Light,

    (* Switches *)
        (* SA1 == INTANCE Switch, *)
        SA2 == INSTANCE Switch,
        (* SB1 == INTANCE Switch, *)
        SB2 == INSTANCE Switch,
        (* SC1 == INTANCE Switch, *)
        SC2 == INSTANCE Switch,
        (* SC3 == INTANCE Switch, *)
        SD1 == INSTANCE Switch,
        (* SD1 == INTANCE Switch, *)
        SF1 == INSTANCE Switch,
        SG1 == INSTANCE Switch,
        SH1 == INSTANCE Switch,

    (* Tracks and platforms *)
        (* A == INSTANCE Track, *)
        (* B == INSTANCE Track, *)
        C == INSTANCE Track WITH targetPlatform <- targetPlatformC, targetDestination <- targetDestinationC
        D == INSTANCE Track WITH targetPlatform <- targetPlatformD, targetDestination <- targetDestinationD,
        F == INSTANCE Track WITH targetPlatform <- targetPlatformF, targetDestination <- targetDestinationF,
        G == INSTANCE Track WITH targetPlatform <- targetPlatformG, targetDestination <- targetDestinationG,
        P1 == INSTANCE Track WITH targetPlatform <- targetPlatformP1, targetDestination <- targetDestinationP1,
        P2 == INSTANCE Track WITH targetPlatform <- targetPlatformP2, targetDestination <- targetDestinationP2,
        P3 == INSTANCE Track WITH targetPlatform <- targetPlatformP3, targetDestination <- targetDestinationP3,
        P4 == INSTANCE Track WITH targetPlatform <- targetPlatformP4, targetDestination <- targetDestinationP4,

    (* Mutexes *)
        busyA, busyB, busyC, busyD, busyF, busyG, busyH

------------------------------------

(* Sequences of variables *)
lights == << LCW, LDW, LFE, LGE, L2E, L3E, L4E, L1W, L2W, L3W, L4W >>
switches == << SA2, SB2, SC2, SC3, SD1, SD2, SF1, SG1, SH1 >>
intracks == << C, F >>
outtracks == << D, G >>
platforms == << P1, P2, P3, P4 >>
vars ==	<< lights, switches, intracks, outtracks, platforms >>

(* ---------------------------------------- INITIALISATION ---------------------------------------- *)

Init ==	(* /\ LAW!Init *)
        /\ LCW!Init
        (* /\ LDW!Init *)
        (* /\ LFE!Init *)
        /\ LGE!Init
        (* /\ L1E!Init *)
        /\ L2E!Init
        /\ L3E!Init
        /\ L4E!Init
        /\ L1W!Init
        /\ L2W!Init
        /\ L3W!Init
        /\ L4W!Init
        (* /\ SA1!Init *)
        /\ SA2!Init
        (* /\ SB1!Init *)
        /\ SB2!Init
        (* /\ SC1!Init *)
        /\ SC2!Init
        /\ SC3!Init
        /\ SD1!Init
        /\ SD2!Init
        /\ SF1!Init
        /\ SG1!Init
        /\ SH1!Init
        (* /\ A!Init /\ A!SetPosition("A") *)
        (* /\ B!Init /\ B!SetPosition("B") *)
        /\ C!Init /\ C!SetPosition("C")
        /\ D!Init /\ D!SetPosition("D")
        /\ F!Init /\ F!SetPosition("F")
        /\ G!Init /\ G!SetPosition("G")
        /\ P1!Init /\ P1!SetPosition("P1")
        /\ P2!Init /\ P2!SetPosition("P2")
        /\ P3!Init /\ P3!SetPosition("P3")
        /\ P4!Init /\ P4!SetPosition("P4")
        /\ busyA = 0 /\ busyB = 0 /\ busyC = 0 /\ busyD = 0 /\ busyF = 0 /\ busyG = 0 /\ busyH = 0

(* ---------------------------------------- ACTIONS ---------------------------------------- *)
          
TrainLeavesP1W ==   /\ L1W!IsGreen \/ L1W!IsYellow
                    /\ F!TrainEnters(targetPlatformP1, targetDestinationP1))
                    /\ P1!TrainLeaves
                    /\ L1W!SetRed

TrainLeavesP2W ==	/\ L2W!IsGreen \/ L2W!IsYellow
                    /\ F!TrainEnters(targetPlatformP2, targetDestinationP2))
                    /\ P2!TrainLeaves
                    /\ L2W!SetRed

TrainLeavesP3W ==	/\ L3W!IsGreen \/ L3W!IsYellow
                    /\ F!TrainEnters(targetPlatformP3, targetDestinationP3))
                    /\ P3!TrainLeaves
                    /\ L3W!SetRed
                    
TrainLeavesP4W ==	/\ L4W!IsGreen \/ L4W!IsYellow
                    /\ F!TrainEnters(targetPlatformP4, targetDestinationP4))
                    /\ P4!TrainLeaves
                    /\ L4W!SetRed

TrainLeavesP2E ==	/\ L2E!IsGreen \/ L2E!IsYellow
                    /\  \/ (targetDestinationP2 = "D" /\ D!TrainEnters(targetPlatformP2, targetDestinationP2))
                        \/ (targetDestinationP2 = "B" /\ B!TrainEnters(targetPlatformP2, targetDestinationP2))
                    /\ P2!TrainLeaves
                    /\ L2E!SetRed

TrainLeavesP3E ==	/\ L3E!IsGreen \/ L3E!IsYellow
                    /\  \/ (targetDestinationP3 = "D" /\ D!TrainEnters(targetPlatformP3, targetDestinationP3))
                        \/ (targetDestinationP3 = "B" /\ B!TrainEnters(targetPlatformP3, targetDestinationP3))
                    /\ P3!TrainLeaves
                    /\ L3E!SetRed

TrainLeavesP4E ==	/\ L4E!IsGreen \/ L4E!IsYellow
                    /\  \/ (targetDestinationP4 = "D" /\ D!TrainEnters(targetPlatformP4, targetDestinationP4))
                        \/ (targetDestinationP4 = "B" /\ B!TrainEnters(targetPlatformP4, targetDestinationP4))
                    /\ P4!TrainLeaves
                    /\ L4E!SetRed

TrainLeavesC == /\ LCW!IsGreen \/ LCW!IsYellow
                /\  \/ (targetPlatformC = "P1" /\ P1!TrainEnters(targetPlatformC, targetDestinationC))
                    \/ (targetPlatformC = "P2" /\ P2!TrainEnters(targetPlatformC, targetDestinationC)) 
                    \/ (targetPlatformC = "P3" /\ P3!TrainEnters(targetPlatformC, targetDestinationC)) 
                    \/ (targetPlatformC = "P4" /\ P4!TrainEnters(targetPlatformC, targetDestinationC))
                /\ C!TrainLeaves
                /\ LCW!SetRed

TrainLeavesG == /\ LGE!IsGreen \/ LGE!IsYellow
                /\  \/ (targetPlatformG = "P2" /\ P2!TrainEnters(targetPlatformG, targetDestinationG)) 
                    \/ (targetPlatformG = "P3" /\ P3!TrainEnters(targetPlatformG, targetDestinationG)) 
                    \/ (targetPlatformG = "P4" /\ P4!TrainEnters(targetPlatformG, targetDestinationG))
                /\ G!TrainLeaves
                /\ LGE!SetRed
            
(* ---------------------------------------- SET PATH FROM C ---------------------------------------- *)

SetPathC == /\ targetDestinationC # "empty"
            /\ \/ (targetPlatformC = "P1" /\ targetDestinationP1="empty" /\ SetPathCtoP1) 
               \/ (targetPlatformC = "P2" /\ targetDestinationP2="empty" /\ SetPathCtoP2)
               \/ (targetPlatformC = "P3" /\ targetDestinationP3="empty" /\ SetPathCtoP3) 
               \/ (targetPlatformC = "P4" /\ targetDestinationP4="empty" /\ SetPathCtoP4)

SetPathCtoP1 == /\ busyA = 0 /\ busyB = 0 /\ busyC = 0
                /\ busyA' = 1 /\ busyB' = 1 /\ busyC' = 1 /\ UNCHANGED << busyA, busyF, busyG, busyH >>
                /\ SC2!SWitchSecond /\ SB1!SwitchFirst /\ SA1!SwitchSecond
                /\ LCW!SetGreen
                
SetPathCtoP2 == /\ busyB = 0 /\ busyC = 0
                /\ busyB' = 1 /\ busyC' = 1 /\ UNCHANGED << busyA, busyD, busyF, busyG, busyH >> 
                /\ SC2!SWitchSecond /\ SB1!SwitchSecond
                /\ LCW!SetGreen

SetPathCtoP3 == /\ busyC = 0 
                /\ busyC'= 1 /\ UNCHANGED << busyA, busyB, busyC, busyF, busyG, busyH>>
                /\ SC2!SWitchFirst 
                /\ LCW!SetGreen

setPathCtoP4 == /\ busyC = 0 /\ busyD = 0 
                /\ busyC' = 1 /\ busyD'=1 /\ UNCHANGED << busyA, busyB, busyF, busyG, busyH >>
                /\ SC2!SWitchFirst 
                /\ LCW!SetGreen
                
(* ---------------------------------------- SET PATH FROM G ---------------------------------------- *)
                
SetPathG == /\ targetDestinationG # "empty"
            /\ \/ (targetPlatformG = "P1" /\ targetDestinationP1="empty" /\ SetPathGtoP1) 
               \/ (targetPlatformG = "P2" /\ targetDestinationP2="empty" /\ SetPathGtoP2)
               \/ (targetPlatformG = "P3" /\ targetDestinationP3="empty" /\ SetPathGtoP3) 
               \/ (targetPlatformG = "P4" /\ targetDestinationP4="empty" /\ SetPathGtoP4)

SetPathGtoP2 == /\ busyG = 0
                /\ busyG' = 1 /\ UNCHANGED << busyA, busyB, busyC, busyD, busyF, busyH >>
                /\ SG1!SwitchFirst
                /\ LGE!SetGreen
                
SetPathGtoP3 == /\ busyG = 0 /\ busyH = 0
                /\ busyG'= 1 /\ busyH' = 1 /\ UNCHANGED << busyA, busyB, busyC, busyD, busyF>>
                /\ SG1!SwitchSecond /\ SH1!SwitchSecond
                /\ LGE!SetGreen
                
SetPathGtoP4 == /\ busyG = 0 /\ busyH = 0 
                /\ busyG' = 1 /\ busyH'=1 /\ UNCHANGED << busyA, busyB >>               
                /\ SG1!SwitchSecond /\ SH1!SwitchFirst
                /\ LGE!SetGreen

(* ---------------------------------------- SET PATH FROM PLATFORMS TO W ---------------------------------------- *)

SetPathP1W ==	/\ targetDestinationP1 # "empty"
                /\	\/ (destinationPlatformP1 = "D" /\ targetDestinationD="empty" /\ SetPathP1toD)

SetPathP2W ==	/\ targetDestinationP2 # "empty"
              	/\	\/ (destinationPlatformP2 = "D" /\ targetDestinationD="empty" /\ SetPathP2toD)

SetPathP3W ==   /\ targetDestinationP3 # "empty"
                /\ \/ (destinationPlatformP3 = "D" /\ targetDestinationD="empty" /\ SetPathP3toD)

SetPathP4W ==   /\ targetDestinationP4 # "empty"
                /\ \/ (destinationPlatformP4 = "D" /\ targetDestinationD="empty" /\ SetPathP4toD)
                
(* doesn't appear in simple version *)
SetPathP1toD == /\ busyA = 0 /\ busyB = 0 /\ busyC = 0 /\ busyD = 0
                /\ busyA' = 1 /\ busyB' = 1 /\ busyC' = 1 /\ busyD' = 0 /\ UNCHANGED << busyF, busyG, busyH >>
                /\ SA1!SwitchSecond /\ SB2!SWitchFirst /\ SC2!SwitchFirst /\ SD2!SwitchSecond
                /\ L1E!SetGreen

SetPathP2toD == /\ busyB = 0 /\ busyC = 0 /\ busyD = 0
                /\ busyB' = 1 /\ busyC' = 1 /\ busyD' = 1 /\ UNCHANGED << busyA,busyF, busyG, busyH >>
                /\ SB2!SWitchSecond /\ SC2!SwitchFirst /\ SD2!SwitchSecond
                /\ L2E!SetGreen

SetPathP3toD == /\ busyC = 0 /\ busyD = 0
                /\ busyC' = 1 /\ busyD' = 1 /\ UNCHANGED << busyA, busyB, busyF, busyG, busyH >>
                /\ SC2!SwitchFirst /\ SD2!SwitchSecond
                /\ L3E!SetGreen

SetPathP1toD == /\ busyD = 0
                /\ busyD' = 1 /\ UNCHANGED << busyA,busyB,busyC,busyF, busyG, busyH >>
                /\ SD1!SwitchFirst /\ SD2!SwitchFirst
                /\ L4E!SetGreen
(* ---------------------------------------- SET PATH FROM PLATFORMS TO E ---------------------------------------- *)
                          
SetPathP1E ==   /\ targetDestinationP1 # "empty"
                /\	\/ (destinationPlatformP1 = "F" /\ targetDestinationF="empty" /\ SetPathP1toF)

SetPathP2E ==   /\ targetDestinationP2 # "empty"
              	/\	\/ (destinationPlatformP2 = "F" /\ targetDestinationF="empty" /\ SetPathP2toF)

SetPathP3E ==   /\ targetDestinationP3 # "empty"
                /\ \/ (destinationPlatformP3 = "F" /\ targetDestinationF="empty" /\ SetPathP3toF)

SetPathP4E ==   /\ targetDestinationP4 # "empty"
                /\ \/ (destinationPlatformP4 = "F" /\ targetDestinationF="empty" /\ SetPathP4toF)
                
SetPathP1ToF == /\ busyF = 0
                /\ busyF' = 1 /\ UNCHANGED << busyA, busyB, busyC, busyD, busyG, busyH >>
                /\ SF1!SwitchFirst
                /\ L1W!SetGreen

SetPathP2ToF == /\ busyG = 0 /\ busyF = 0
                /\ busyG' = 1 /\ busyF' = 1 /\ UNCHANGED << busyA, busyB, busyC, busyD, busyH >>
                /\ SF1!SwitchSecond /\ SG1!SwitchSecond
                /\ L2W!SetGreen                

SetPathP3ToF == /\ busyH = 0 /\ busyG = 0 /\ busyF = 0
                /\ busyH' = 1 /\ busyG' = 1 /\ busyF' = 1 /\ UNCHANGED << busyA, busyB, busyC, busyD >>
                /\ SF1!SwitchSecond /\ SG1!SwitchFirst /\ SH1!SwitchSecond
                /\ L3W!SetGreen

SetPathP4ToF == /\ busyH = 0 /\ busyG = 0 /\ busyF = 0
                /\ busyH' = 1 /\ busyG' = 1 /\ busyF' = 1 /\ UNCHANGED << busyA, busyB, busyC, busyD >>
                /\ SF1!SwitchSecond /\ SG1!SwitchFirst /\ SH1!SwitchSecond
                /\ L4W!SetGreen

                     
(* ---------------------------------------- NEXT STATE ---------------------------------------- *)

Next ==	\/ NewTrainC
        \/ NewTrainG
        \/ SetPathC
        \/ SetPathG
        \/ TrainLeavesC
        \/ TrainLeavesG
        \/ SetPathP1E
        \/ SetPathP2E
        \/ SetPathP3E
        \/ SetPathP4E
        \/ SetPathP1W
        \/ SetPathP2W
        \/ SetPathP3W
        \/ SetPathP4W
        \/ TrainLeavesP2E
        \/ TrainLeavesP3E
        \/ TrainLeavesP4E
        \/ TrainLeavesP1W
        \/ TrainLeavesP2W
        \/ TrainLeavesP3W
        \/ TrainLeavesP4W

------------------------------------

(* Liveness *)
Live ==	/\ \A light \in lights : (light!IsRed) ~> (light!IsGreen)
        /\ \A light \in lights : (light!IsYellow) ~> (light!IsGreen)

(* Specification *)
Spec ==	/\ Init
        /\ [][Next]_vars
        /\ Live

------------------------------------

(* Invariants / Temporal properties to verify *)
TypeInvariant ==	

...

(* Properties *)
...

------------------------------------

(* Theorems *)
THEOREM Spec => ...

====================================
