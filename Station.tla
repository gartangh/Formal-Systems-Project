---------- MODULE Station ----------

(* ---------------------------------------- VARIABLES ---------------------------------------- *)
VARIABLES busyA, busyB, busyC, busyD, busyF, busyG, busyH, targetPlatformC, targetPlatformD, targetPlatformF, targetPlatformG, targetDestinationC, targetDestinationD, targetDestinationF, targetDestinationG, targetPlatformP1, targetPlatformP2, targetPlatformP3, targetPlatformP4, targetDestinationP1, targetDestinationP2, targetDestinationP3, targetDestinationP4,
          colorLAW, colorLBW,colorLCW,colorLDW,colorLFE, colorLGE, colorL1E,colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W,
          stateSA1,stateSA2, stateSB1,stateSB2, stateSC2, stateSC3,stateSD1,stateSD2, stateSF1, stateSG1, stateSH1,
          countC, countD, countF, countG, countP1, countP2, countP3, countP4

(* LAW == INSTANCE Light WITH color <- colorLAW *)
(* LBW == INSTANCE Light WITH color <- colorLBW *)
LCW == INSTANCE Light WITH color <- colorLCW
(* LDW == INSTANCE Light WITH color <- colorLDW *)
(* LFE == INSTANCE Light WITH color <- colorLFE *)
LGE == INSTANCE Light WITH color <- colorLGE
(* L1E == INSTANCE Light WITH color <- colorL1E *)
L2E == INSTANCE Light WITH color <- colorL2E
L3E == INSTANCE Light WITH color <- colorL3E
L4E == INSTANCE Light WITH color <- colorL4E
L1W == INSTANCE Light WITH color <- colorL1W
L2W == INSTANCE Light WITH color <- colorL2W
L3W == INSTANCE Light WITH color <- colorL3W
L4W == INSTANCE Light WITH color <- colorL4W

(* Switches *)
(* SA1 == INTANCE Switch WITH state <- stateSA1 *)
SA2 == INSTANCE Switch WITH state <- stateSA2
(* SB1 == INTANCE Switch WITH state <- stateSB1 *)
SB2 == INSTANCE Switch WITH state <- stateSB2
(* SC1 == INTANCE Switch WITH state <- stateSC1 *)
SC2 == INSTANCE Switch WITH state <- stateSC2
(* SC3 == INTANCE Switch WITH state <- stateSC3 *)
SD1 == INSTANCE Switch WITH state <- stateSD1
(* SD2 == INTANCE Switch WITH state <- stateSD2 *)
SF1 == INSTANCE Switch WITH state <- stateSF1
SG1 == INSTANCE Switch WITH state <- stateSG1
SH1 == INSTANCE Switch WITH state <- stateSH1

(* Tracks and platforms *)
(* A == INSTANCE Track *)
(* B == INSTANCE Track *)
C == INSTANCE Track WITH targetPlatform <- targetPlatformC, targetDestination <- targetDestinationC, count <- countC
D == INSTANCE Track WITH targetPlatform <- targetPlatformD, targetDestination <- targetDestinationD, count <- countD
F == INSTANCE Track WITH targetPlatform <- targetPlatformF, targetDestination <- targetDestinationF, count <- countF
G == INSTANCE Track WITH targetPlatform <- targetPlatformG, targetDestination <- targetDestinationG, count <- countG
P1 == INSTANCE Track WITH targetPlatform <- targetPlatformP1, targetDestination <- targetDestinationP1, count <- countP1
P2 == INSTANCE Track WITH targetPlatform <- targetPlatformP2, targetDestination <- targetDestinationP2, count <- countP2
P3 == INSTANCE Track WITH targetPlatform <- targetPlatformP3, targetDestination <- targetDestinationP3, count <- countP3
P4 == INSTANCE Track WITH targetPlatform <- targetPlatformP4, targetDestination <- targetDestinationP4, count <- countP4

------------------------------------

(* Sequences of variables *)
lights == << LCW, LDW, LFE, LGE, L2E, L3E, L4E, L1W, L2W, L3W, L4W >>
switches == << SA2, SB2, SC2, SC3, SD1, SD2, SF1, SG1, SH1 >>
intracks == << C, F >>
outtracks == << D, G >>
platforms == << P1, P2, P3, P4 >>
busys == << busyA, busyB, busyC, busyD, busyF, busyG, busyH >>
vars ==	<< lights, switches, intracks, outtracks, platforms, busys >>

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
        (* /\ A!Init *)
        (* /\ B!Init *)
        /\ C!Init
        /\ D!Init
        /\ F!Init
        /\ G!Init
        /\ P1!Init
        /\ P2!Init
        /\ P3!Init
        /\ P4!Init
        /\ busyA = 0 /\ busyB = 0 /\ busyC = 0 /\ busyD = 0 /\ busyF = 0 /\ busyG = 0 /\ busyH = 0

(* ---------------------------------------- ACTIONS ---------------------------------------- *)
          
(* ---------------------------------------- SET PATH FROM C ---------------------------------------- *)

SetPathCtoP1 == /\ busyA = 0 /\ busyB = 0 /\ busyC = 0
                /\ busyA' = 1 /\ busyB' = 1 /\ busyC' = 1 /\ UNCHANGED << busyA, busyF, busyG, busyH >>
                /\ SC2!SwitchSecond /\ SB1!SwitchFirst /\ SA1!SwitchSecond
                /\ LCW!SetGreen
                
SetPathCtoP2 == /\ busyB = 0 /\ busyC = 0
                /\ busyB' = 1 /\ busyC' = 1 /\ UNCHANGED << busyA, busyD, busyF, busyG, busyH >> 
                /\ SC2!SwitchSecond /\ SB1!SwitchSecond
                /\ LCW!SetGreen

SetPathCtoP3 == /\ busyC = 0 
                /\ busyC'= 1 /\ UNCHANGED << busyA, busyB, busyC, busyF, busyG, busyH>>
                /\ SC2!SwitchFirst /\ SC3!SwitchFirst
                /\ LCW!SetGreen

setPathCtoP4 == /\ busyC = 0 /\ busyD = 0 
                /\ busyC' = 1 /\ busyD'=1 /\ UNCHANGED << busyA, busyB, busyF, busyG, busyH >>
                /\ SC2!SwitchFirst /\ SC3!SwitchSecond /\ SD2!SwitchSecond
                /\ LCW!SetGreen

SetPathC == /\ targetDestinationC # "empty"
            /\ \/ (targetPlatformC = "P1" /\ targetDestinationP1="empty" /\ SetPathCtoP1) 
               \/ (targetPlatformC = "P2" /\ targetDestinationP2="empty" /\ SetPathCtoP2)
               \/ (targetPlatformC = "P3" /\ targetDestinationP3="empty" /\ SetPathCtoP3) 
               \/ (targetPlatformC = "P4" /\ targetDestinationP4="empty" /\ SetPathCtoP4)
    
(* ---------------------------------------- SET PATH FROM G ---------------------------------------- *)

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
                
SetPathG == /\ targetDestinationG # "empty"
            /\ \/ (targetPlatformG = "P1" /\ targetDestinationP1="empty" /\ SetPathGtoP1) 
               \/ (targetPlatformG = "P2" /\ targetDestinationP2="empty" /\ SetPathGtoP2)
               \/ (targetPlatformG = "P3" /\ targetDestinationP3="empty" /\ SetPathGtoP3) 
               \/ (targetPlatformG = "P4" /\ targetDestinationP4="empty" /\ SetPathGtoP4)



(* ---------------------------------------- SET PATH FROM PLATFORMS FROM EAST ---------------------------------------- *)
                
(* doesn't appear in simple version *)
SetPathP1toD == /\ busyA = 0 /\ busyB = 0 /\ busyC = 0 /\ busyD = 0
                /\ busyA' = 1 /\ busyB' = 1 /\ busyC' = 1 /\ busyD' = 0 /\ UNCHANGED << busyF, busyG, busyH >>
                /\ SA1!SwitchSecond /\ SB2!SwitchFirst /\ SC2!SwitchFirst /\ SD2!SwitchSecond
                /\ L1E!SetGreen

SetPathP2toD == /\ busyB = 0 /\ busyC = 0 /\ busyD = 0
                /\ busyB' = 1 /\ busyC' = 1 /\ busyD' = 1 /\ UNCHANGED << busyA,busyF, busyG, busyH >>
                /\ SB2!SwitchSecond /\ SC2!SwitchFirst /\ SD2!SwitchSecond
                /\ L2E!SetGreen

SetPathP3toD == /\ busyC = 0 /\ busyD = 0
                /\ busyC' = 1 /\ busyD' = 1 /\ UNCHANGED << busyA, busyB, busyF, busyG, busyH >>
                /\ SC2!SwitchFirst /\ SD1!SwitchSecond /\ SC3!SetFirst
                /\ L3E!SetGreen

SetPathP4toD == /\ busyD = 0
                /\ busyD' = 1 /\ UNCHANGED << busyA,busyB,busyC,busyF, busyG, busyH >>
                /\ SD1!SwitchFirst /\ SD2!SwitchFirst
                /\ L4E!SetGreen

SetPathP1E ==	/\ targetDestinationP1 # "empty"
                /\  \/ (destinationPlatformP1 = "D" /\ targetDestinationD="empty" /\ SetPathP1toD)

SetPathP2E ==	/\ targetDestinationP2 # "empty"
              	/\	\/ (destinationPlatformP2 = "D" /\ targetDestinationD="empty" /\ SetPathP2toD)

SetPathP3E ==   /\ targetDestinationP3 # "empty"
                /\  \/ (destinationPlatformP3 = "D" /\ targetDestinationD="empty" /\ SetPathP3toD)

SetPathP4 ==    /\ targetDestinationP4 # "empty"
                /\  \/ (destinationPlatformP4 = "D" /\ targetDestinationD="empty" /\ SetPathP4toD)



(* ---------------------------------------- SET PATH FROM PLATFORMS FROM WEST ---------------------------------------- *)
                               
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

SetPathP1W ==   /\ targetDestinationP1 # "empty"
                /\	\/ (destinationPlatformP1 = "F" /\ targetDestinationF="empty" /\ SetPathP1toF)

SetPathP2W ==   /\ targetDestinationP2 # "empty"
              	/\	\/ (destinationPlatformP2 = "F" /\ targetDestinationF="empty" /\ SetPathP2toF)

SetPathP3W ==   /\ targetDestinationP3 # "empty"
                /\ \/ (destinationPlatformP3 = "F" /\ targetDestinationF="empty" /\ SetPathP3toF)

SetPathP4W ==   /\ targetDestinationP4 # "empty"
                /\ \/ (destinationPlatformP4 = "F" /\ targetDestinationF="empty" /\ SetPathP4toF)

(* ---------------------------------------- LEAVING TRAINS ---------------------------------------- *)

TrainLeavesP1W ==   /\ L1W!IsGreen
                    /\ F!TrainEnters(targetPlatformP1, targetDestinationP1)
                    /\ P1!TrainLeaves
                    /\ L1W!SetRed

TrainLeavesP2W ==	/\ L2W!IsGreen
                    /\ F!TrainEnters(targetPlatformP2, targetDestinationP2)
                    /\ P2!TrainLeaves
                    /\ L2W!SetRed

TrainLeavesP3W ==	/\ L3W!IsGreen
                    /\ F!TrainEnters(targetPlatformP3, targetDestinationP3)
                    /\ P3!TrainLeaves
                    /\ L3W!SetRed
                    
TrainLeavesP4W ==	/\ L4W!IsGreen
                    /\ F!TrainEnters(targetPlatformP4, targetDestinationP4)
                    /\ P4!TrainLeaves
                    /\ L4W!SetRed

TrainLeavesP2E ==	/\ L2E!IsGreen
                    /\  \/ (targetDestinationP2 = "D" /\ D!TrainEnters(targetPlatformP2, targetDestinationP2))
                        \/ (targetDestinationP2 = "B" /\ B!TrainEnters(targetPlatformP2, targetDestinationP2))
                    /\ P2!TrainLeaves
                    /\ L2E!SetRed

TrainLeavesP3E ==	/\ L3E!IsGreen
                    /\  \/ (targetDestinationP3 = "D" /\ D!TrainEnters(targetPlatformP3, targetDestinationP3))
                        \/ (targetDestinationP3 = "B" /\ B!TrainEnters(targetPlatformP3, targetDestinationP3))
                    /\ P3!TrainLeaves
                    /\ L3E!SetRed

TrainLeavesP4E ==	/\ L4E!IsGreen
                    /\  \/ (targetDestinationP4 = "D" /\ D!TrainEnters(targetPlatformP4, targetDestinationP4))
                        \/ (targetDestinationP4 = "B" /\ B!TrainEnters(targetPlatformP4, targetDestinationP4))
                    /\ P4!TrainLeaves
                    /\ L4E!SetRed

TrainLeavesC == /\ LCW!IsGreen
                /\  \/ (targetPlatformC = "P1" /\ P1!TrainEnters(targetPlatformC, targetDestinationC))
                    \/ (targetPlatformC = "P2" /\ P2!TrainEnters(targetPlatformC, targetDestinationC)) 
                    \/ (targetPlatformC = "P3" /\ P3!TrainEnters(targetPlatformC, targetDestinationC)) 
                    \/ (targetPlatformC = "P4" /\ P4!TrainEnters(targetPlatformC, targetDestinationC))
                /\ C!TrainLeaves
                /\ LCW!SetRed

TrainLeavesG == /\ LGE!IsGreen
                /\  \/ (targetPlatformG = "P2" /\ P2!TrainEnters(targetPlatformG, targetDestinationG)) 
                    \/ (targetPlatformG = "P3" /\ P3!TrainEnters(targetPlatformG, targetDestinationG)) 
                    \/ (targetPlatformG = "P4" /\ P4!TrainEnters(targetPlatformG, targetDestinationG))
                /\ G!TrainLeaves
                /\ LGE!SetRed

(* ---------------------------------------- NEW train enters ---------------------------------------- *)

(* NewtrainA == A!NewTrain *)

NewTrainC == C!NewTrain("C")

NewTrainG == G!NewTrain("G")
(* ---------------------------------------- NEXT STATE ---------------------------------------- *)

Next ==	(* \/ NewTrainA *)
        \/ NewTrainC
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

(* Liveness 
Live ==	/\ \A light \in lights : (light!IsRed) ~> (light!IsGreen)
*)
Live == TRUE

(* Specification *)
Spec ==	/\ Init
        /\ [][Next]_vars
        /\ Live

------------------------------------

(* Invariants / Temporal properties to verify *)
TypeInvariant == /\ \A l \in lights: l!TypeInvariant
                 /\ \A l \in switches: l!TypeInvariant
                 /\ \A l \in intracks: l!TypeInvariant
                 /\ \A l \in outtracks: l!TypeInvariant
                 /\ \A l \in platforms: l!TypeInvariant
                 /\ \A l \in busys: l!TypeInvariant

(* Properties *)
(* Niet permanent alles op rood *)
(* NotPermanentEverythingRed == ~(<>[](LCW!IsRed /\ LGE!IsRed)) (* TODO Add LAW *) *)

------------------------------------

(* Theorems *)
THEOREM Spec => []TypeInvariant
(* THEOREM Spec => NotPermanentEverythingRed *)
====================================
