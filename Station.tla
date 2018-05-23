---------- MODULE Station ----------

EXTENDS Naturals

(* ---------------------------------------- VARIABLES ---------------------------------------- *)

VARIABLES busyA, busyB, busyC, busyD, busyF, busyG, busyH, reservedP1, reservedP2,reservedP3,reservedP4,
          targetPlatformA, targetPlatformB,targetPlatformC, targetPlatformD, targetPlatformF, targetPlatformG,
          targetDestinationA, targetDestinationB,targetDestinationC, targetDestinationD, targetDestinationF, targetDestinationG,
          targetPlatformP1, targetPlatformP2, targetPlatformP3, targetPlatformP4,
          targetDestinationP1, targetDestinationP2, targetDestinationP3, targetDestinationP4,
          colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E,colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W,
          stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3,stateSD1,stateSD2, stateSF1, stateSG1, stateSH1,
          countA, countB,countC, countD, countF, countG, countP1, countP2, countP3, countP4

LAW == INSTANCE Light WITH color <- colorLAW
LBW == INSTANCE Light WITH color <- colorLBW
LCW == INSTANCE Light WITH color <- colorLCW
LDW == INSTANCE Light WITH color <- colorLDW
LFE == INSTANCE Light WITH color <- colorLFE
LGE == INSTANCE Light WITH color <- colorLGE
L1E == INSTANCE Light WITH color <- colorL1E
L2E == INSTANCE Light WITH color <- colorL2E
L3E == INSTANCE Light WITH color <- colorL3E
L4E == INSTANCE Light WITH color <- colorL4E
L1W == INSTANCE Light WITH color <- colorL1W
L2W == INSTANCE Light WITH color <- colorL2W
L3W == INSTANCE Light WITH color <- colorL3W
L4W == INSTANCE Light WITH color <- colorL4W

SA1 == INSTANCE Switch WITH state <- stateSA1
SA2 == INSTANCE Switch WITH state <- stateSA2
SB1 == INSTANCE Switch WITH state <- stateSB1
SB2 == INSTANCE Switch WITH state <- stateSB2
SC1 == INSTANCE Switch WITH state <- stateSC1
SC2 == INSTANCE Switch WITH state <- stateSC2
SC3 == INSTANCE Switch WITH state <- stateSC3
SD1 == INSTANCE Switch WITH state <- stateSD1
SD2 == INSTANCE Switch WITH state <- stateSD2
SF1 == INSTANCE Switch WITH state <- stateSF1 
SG1 == INSTANCE Switch WITH state <- stateSG1
SH1 == INSTANCE Switch WITH state <- stateSH1

(* Tracks and platforms *)
A == INSTANCE Track WITH targetPlatform <- targetPlatformA, targetDestination <- targetDestinationA, count <- countA
B == INSTANCE Track WITH targetPlatform <- targetPlatformB, targetDestination <- targetDestinationB, count <- countB
C == INSTANCE Track WITH targetPlatform <- targetPlatformC, targetDestination <- targetDestinationC, count <- countC
D == INSTANCE Track WITH targetPlatform <- targetPlatformD, targetDestination <- targetDestinationD, count <- countD
F == INSTANCE Track WITH targetPlatform <- targetPlatformF, targetDestination <- targetDestinationF, count <- countF
G == INSTANCE Track WITH targetPlatform <- targetPlatformG, targetDestination <- targetDestinationG, count <- countG
P1 == INSTANCE Track WITH targetPlatform <- targetPlatformP1, targetDestination <- targetDestinationP1, count <- countP1
P2 == INSTANCE Track WITH targetPlatform <- targetPlatformP2, targetDestination <- targetDestinationP2, count <- countP2
P3 == INSTANCE Track WITH targetPlatform <- targetPlatformP3, targetDestination <- targetDestinationP3, count <- countP3
P4 == INSTANCE Track WITH targetPlatform <- targetPlatformP4, targetDestination <- targetDestinationP4, count <- countP4

(* Sequences of variables *)
colors == << colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E,colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W >>
statesSwitches == << stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3, stateSD1, stateSD2, stateSF1, stateSG1, stateSH1 >>
counts == << countA, countB,countC, countD, countF, countG, countP1, countP2, countP3, countP4 >>

targetPlatformsOfPlatforms == << targetPlatformP1, targetPlatformP2, targetPlatformP3, targetPlatformP4 >>
targetPlatformsOfTracks == << targetPlatformA, targetPlatformB,targetPlatformC, targetPlatformD, targetPlatformF, targetPlatformG >>
targetPlatforms == << targetPlatformA, targetPlatformB,targetPlatformC, targetPlatformD, targetPlatformF, targetPlatformG, targetPlatformP1, targetPlatformP2, targetPlatformP3, targetPlatformP4 >>

targetDestinationsOfPlatforms == << targetDestinationP1, targetDestinationP2, targetDestinationP3, targetDestinationP4 >>
targetDestinationsOfTracks == << targetDestinationA, targetDestinationB,targetDestinationC, targetDestinationD, targetDestinationF, targetDestinationG >>
targetDestinations == << targetDestinationA, targetDestinationB,targetDestinationC, targetDestinationD, targetDestinationF, targetDestinationG, targetDestinationP1, targetDestinationP2, targetDestinationP3, targetDestinationP4 >>

busys == << busyA, busyB, busyC, busyD, busyF, busyG, busyH >>
reserveds == << reservedP1, reservedP2,reservedP3,reservedP4 >>

vars ==	<< busyA, busyB, busyC, busyD, busyF, busyG, busyH,
           targetPlatformA, targetPlatformB,targetPlatformC, targetPlatformD, targetPlatformF, targetPlatformG,
           targetDestinationA, targetDestinationB,targetDestinationC, targetDestinationD, targetDestinationF, targetDestinationG,
           targetPlatformP1, targetPlatformP2, targetPlatformP3, targetPlatformP4,
           targetDestinationP1, targetDestinationP2, targetDestinationP3, targetDestinationP4,
           colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E,colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W,
           stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3,stateSD1,stateSD2, stateSF1, stateSG1, stateSH1,
           countA, countB,countC, countD, countF, countG, countP1, countP2, countP3, countP4,
           reservedP1, reservedP2,reservedP3,reservedP4 >>

(* ---------------------------------------- INITIALISATION ---------------------------------------- *)

Init == /\ LAW!Init /\ LBW!Init /\ LCW!Init /\ LDW!Init /\ LFE!Init /\ LGE!Init /\ L1E!Init /\ L2E!Init /\ L3E!Init /\ L4E!Init /\ L1W!Init /\ L2W!Init /\ L3W!Init /\ L4W!Init
        /\ SA1!Init /\ SA2!Init /\ SB1!Init /\ SB2!Init /\ SC1!Init /\ SC2!Init /\ SC3!Init /\ SD1!Init /\ SD2!Init /\ SF1!Init /\ SG1!Init /\ SH1!Init
        /\ A!Init /\ B!Init /\ C!Init /\ D!Init /\ F!Init /\ G!Init
        /\ P1!Init /\ P2!Init /\ P3!Init /\ P4!Init
        /\ busyA = 0 /\ busyB = 0 /\ busyC = 0 /\ busyD = 0 /\ busyF = 0 /\ busyG = 0 /\ busyH = 0
        /\ reservedP1 = 0 /\ reservedP2=0 /\ reservedP3 = 0 /\ reservedP4 = 0

(* ---------------------------------------- ACTIONS ---------------------------------------- *)
 
(* ---------------------------------------- SET PATH FROM C ---------------------------------------- *)

SetPathCtoP1 == /\ busyA = 0 /\ busyB = 0 /\ busyC = 0 /\ reservedP1 = 0
                /\ busyA' = busyA + 1 /\ busyB' = busyB + 1 /\ busyC' = busyC + 1 /\ reservedP1' = reservedP1 + 1
                /\ SC2!SwitchSecond /\ SB2!SwitchFirst /\ SA2!SwitchSecond
                /\ LCW!SetGreen
                /\ UNCHANGED << busyD, busyF, busyG, busyH, reservedP2, reservedP3, reservedP4,
                                stateSA1, stateSB1, stateSC1, stateSC3, stateSD1, stateSD2, stateSF1, stateSG1, stateSH1,
                                colorLAW, colorLBW, colorLDW ,colorLFE, colorLGE, colorL1E, colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W >>

SetPathCtoP2 == /\ busyB = 0 /\ busyC = 0 /\ reservedP2 = 0
                /\ busyB' = busyB + 1 /\ busyC' = busyC + 1 /\ reservedP2' = reservedP2 + 1
                /\ SC2!SwitchSecond /\ SB2!SwitchSecond
                /\ LCW!SetGreen
                /\ UNCHANGED << busyA, busyD, busyF, busyG, busyH, reservedP1, reservedP3, reservedP4,
                                stateSA1, stateSA2, stateSB1, stateSC1, stateSC3, stateSD1, stateSD2, stateSF1, stateSG1, stateSH1,
                                colorLAW, colorLBW, colorLDW ,colorLFE, colorLGE, colorL1E, colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W >> 

SetPathCtoP3 == /\ busyC = 0 /\ reservedP3 = 0
                /\ busyC'= busyC + 1 /\ reservedP3' = reservedP3 + 1
                /\ SC2!SwitchFirst /\ SC3!SwitchFirst
                /\ LCW!SetGreen
                /\ UNCHANGED << busyA, busyB, busyD, busyF, busyG, busyH, reservedP1, reservedP2, reservedP4,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSD1, stateSD2, stateSF1, stateSG1, stateSH1,
                                colorLAW, colorLBW, colorLDW ,colorLFE, colorLGE, colorL1E, colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W >>

SetPathCtoP4 == /\ busyC = 0 /\ busyD = 0 /\ reservedP4 = 0
                /\ busyC' = busyC + 1 /\ busyD'= busyD + 1 /\ reservedP4' = reservedP4 + 1
                /\ SC2!SwitchFirst /\ SC3!SwitchSecond /\ SD2!SwitchSecond
                /\ LCW!SetGreen
                /\ UNCHANGED << busyA, busyB, busyF, busyG, busyH, reservedP1, reservedP2, reservedP3,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSD1, stateSF1, stateSG1, stateSH1,
                                colorLAW, colorLBW, colorLDW ,colorLFE, colorLGE, colorL1E, colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W>>

SetPathC == /\ targetDestinationC # "empty"
            /\ \/ (targetPlatformC = "P1" /\ targetDestinationP1="empty" /\ SetPathCtoP1) 
               \/ (targetPlatformC = "P2" /\ targetDestinationP2="empty" /\ SetPathCtoP2)
               \/ (targetPlatformC = "P3" /\ targetDestinationP3="empty" /\ SetPathCtoP3) 
               \/ (targetPlatformC = "P4" /\ targetDestinationP4="empty" /\ SetPathCtoP4)
            /\ UNCHANGED << targetPlatforms, targetDestinations, counts >>   

(* ---------------------------------------- SET PATH FROM G ---------------------------------------- *)

SetPathGtoP2 == /\ busyG = 0 /\ reservedP2 = 0
                /\ busyG' = busyG + 1 /\ reservedP2'= reservedP2 + 1
                /\ SG1!SwitchFirst
                /\ LGE!SetGreen
                /\ UNCHANGED << busyA, busyB, busyC, busyD, busyF, busyH, reservedP1, reservedP3, reservedP4,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3, stateSD1, stateSD2, stateSF1, stateSH1,
                                colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorL1E, colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W >>
        
SetPathGtoP3 == /\ busyG = 0 /\ busyH = 0 /\ reservedP3 = 0
                /\ busyG'= busyG + 1 /\ busyH' = busyH + 1 /\ reservedP3' = reservedP3 + 1
                /\ SG1!SwitchSecond /\ SH1!SwitchSecond
                /\ LGE!SetGreen
                /\ UNCHANGED << busyA, busyB, busyC, busyD, busyF, reservedP1, reservedP2, reservedP4,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3, stateSD1, stateSD2, stateSF1,
                                colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorL1E, colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W >>
    
SetPathGtoP4 == /\ busyG = 0 /\ busyH = 0 /\ reservedP4 = 0
                /\ busyG' = busyG + 1 /\ busyH'= busyH + 1 /\ reservedP4' = reservedP4 + 1        
                /\ SG1!SwitchSecond /\ SH1!SwitchFirst
                /\ LGE!SetGreen
                /\ UNCHANGED << busyA, busyB, busyC, busyD, busyF, reservedP1, reservedP2, reservedP3,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3, stateSD1, stateSD2, stateSF1,
                                colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorL1E, colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W >>

SetPathG == /\ targetDestinationG # "empty"
            /\  \/ (targetPlatformG = "P2" /\ targetDestinationP2="empty" /\ SetPathGtoP2)
                \/ (targetPlatformG = "P3" /\ targetDestinationP3="empty" /\ SetPathGtoP3) 
                \/ (targetPlatformG = "P4" /\ targetDestinationP4="empty" /\ SetPathGtoP4)
            /\ UNCHANGED << targetPlatforms, targetDestinations, counts >>  

(* ---------------------------------------- SET PATH FROM PLATFORMS FROM EAST ---------------------------------------- *)

SetPathP1toD == /\ busyA = 0 /\ busyB = 0 /\ busyC = 0 /\ busyD = 0
                /\ busyA' = busyA + 1 /\ busyB' = busyB + 1 /\ busyC' = busyC + 1 /\ busyD' = busyD + 1
                /\ SA2!SwitchSecond /\ SB2!SwitchFirst /\ SC2!SwitchFirst /\ SD2!SwitchSecond
                /\ L1E!SetGreen
                /\ UNCHANGED << busyF, busyG, busyH,
                                stateSA1, stateSB1, stateSC1, stateSC3, stateSD1, stateSF1, stateSG1, stateSH1,
                                colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W >>

SetPathP2toD == /\ busyB = 0 /\ busyC = 0 /\ busyD = 0
                /\ busyB' = busyB + 1 /\ busyC' = busyC + 1 /\ busyD' = busyD + 1
                /\ SB2!SwitchSecond /\ SC2!SwitchFirst /\ SD2!SwitchSecond
                /\ L2E!SetGreen
                /\ UNCHANGED << busyA, busyF, busyG, busyH,
                                stateSA1, stateSA2, stateSB1, stateSC1, stateSC3, stateSD1, stateSF1, stateSG1, stateSH1,
                                colorLAW, colorLBW, colorLCW, colorLDW, colorLFE, colorLGE, colorL1E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W >>

SetPathP3toD == /\ busyC = 0 /\ busyD = 0
                /\ busyC' = busyC + 1 /\ busyD' = busyD + 1
                /\ SC2!SwitchFirst /\ SD1!SwitchSecond /\ SC3!SwitchFirst
                /\ L3E!SetGreen
                /\ UNCHANGED << busyA, busyB, busyF, busyG, busyH,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSD2, stateSF1, stateSG1, stateSH1,
                                colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E, colorL2E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W >>

SetPathP4toD == /\ busyD = 0
                /\ busyD' = busyD + 1
                /\ SD1!SwitchFirst /\ SD2!SwitchFirst
                /\ L4E!SetGreen
                /\ UNCHANGED << busyA, busyB, busyC, busyF, busyG, busyH,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3, stateSF1, stateSG1, stateSH1,
                                colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E, colorL2E, colorL3E, colorL1W, colorL2W, colorL3W, colorL4W >>

SetPathP1E ==   /\ targetDestinationP1 # "empty"
                /\  \/ (targetDestinationP1 = "D" /\ targetDestinationD="empty" /\ SetPathP1toD)
                /\ UNCHANGED << targetPlatforms, targetDestinations, counts ,reserveds>>  

SetPathP2E ==   /\ targetDestinationP2 # "empty"
                /\  \/ (targetDestinationP2 = "D" /\ targetDestinationD="empty" /\ SetPathP2toD)
                /\ UNCHANGED << targetPlatforms, targetDestinations, counts ,reserveds >>  

SetPathP3E ==   /\ targetDestinationP3 # "empty"
                /\  \/ (targetDestinationP3 = "D" /\ targetDestinationD="empty" /\ SetPathP3toD)
                /\ UNCHANGED << targetPlatforms, targetDestinations, counts , reserveds>>  

SetPathP4E ==   /\ targetDestinationP4 # "empty"
                /\  \/ (targetDestinationP4 = "D" /\ targetDestinationD="empty" /\ SetPathP4toD)
                /\ UNCHANGED << targetPlatforms, targetDestinations, counts , reserveds>>  

(* ---------------------------------------- SET PATH FROM PLATFORMS FROM WEST ---------------------------------------- *)

SetPathP1toF == /\ busyF = 0
                /\ busyF' = busyF + 1 
                /\ SF1!SwitchFirst
                /\ L1W!SetGreen
                /\ UNCHANGED << busyA, busyB, busyC, busyD, busyG, busyH,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3, stateSD1, stateSD2, stateSG1, stateSH1,
                                colorLAW, colorLBW, colorLCW, colorLDW, colorLFE, colorLGE, colorL1E, colorL2E, colorL3E, colorL4E, colorL2W, colorL3W, colorL4W >>

SetPathP2toF == /\ busyG = 0 /\ busyF = 0
                /\ busyG' = busyG + 1 /\ busyF' = busyF + 1
                /\ SF1!SwitchSecond /\ SG1!SwitchSecond
                /\ L2W!SetGreen
                /\ UNCHANGED << busyA, busyB, busyC, busyD, busyH,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3, stateSD1, stateSD2, stateSH1,
                                colorLAW, colorLBW, colorLCW, colorLDW, colorLFE, colorLGE, colorL1E, colorL2E, colorL3E, colorL4E, colorL1W, colorL3W, colorL4W >>        

SetPathP3toF == /\ busyH = 0 /\ busyG = 0 /\ busyF = 0
                /\ busyH' = busyH + 1 /\ busyG' = busyG + 1 /\ busyF' = busyF + 1
                /\ SF1!SwitchSecond /\ SG1!SwitchFirst /\ SH1!SwitchSecond
                /\ L3W!SetGreen
                /\ UNCHANGED << busyA, busyB, busyC, busyD,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3, stateSD1, stateSD2,
                                colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E,colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL4W >>

SetPathP4toF == /\ busyH = 0 /\ busyG = 0 /\ busyF = 0
                /\ busyH' = busyH + 1 /\ busyG' = busyG + 1 /\ busyF' = busyF + 1 
                /\ SF1!SwitchSecond /\ SG1!SwitchFirst /\ SH1!SwitchSecond
                /\ L4W!SetGreen
                /\ UNCHANGED << busyA, busyB, busyC, busyD,
                                stateSA1, stateSA2, stateSB1, stateSB2, stateSC1, stateSC2, stateSC3, stateSD1, stateSD2,
                                colorLAW, colorLBW, colorLCW, colorLDW, colorLFE, colorLGE, colorL1E, colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W >>

SetPathP1W ==   /\ targetDestinationP1 # "empty"
                /\   \/ (targetDestinationP1 = "F" /\ targetDestinationF="empty" /\ SetPathP1toF)
                /\ UNCHANGED << targetPlatforms, targetDestinations, counts, reserveds>>

SetPathP2W ==   /\ targetDestinationP2 # "empty"
                /\   \/ (targetDestinationP2 = "F" /\ targetDestinationF="empty" /\ SetPathP2toF)
                /\ UNCHANGED << targetPlatforms, targetDestinations, counts, reserveds>>

SetPathP3W ==   /\ targetDestinationP3 # "empty"
                /\ \/ (targetDestinationP3 = "F" /\ targetDestinationF="empty" /\ SetPathP3toF)
                /\ UNCHANGED << targetPlatforms, targetDestinations, counts , reserveds>>

SetPathP4W ==   /\ targetDestinationP4 # "empty"
                /\ \/ (targetDestinationP4 = "F" /\ targetDestinationF="empty" /\ SetPathP4toF)
                /\ UNCHANGED << targetPlatforms, targetDestinations, counts, reserveds>>

(* ---------------------------------------- LEAVING TRAINS ---------------------------------------- *)

TrainLeavesP1W ==   /\ colorL1W = "green"
                    /\ F!TrainEnters(targetPlatformP1, targetDestinationP1)
                    /\ P1!TrainLeaves
                    /\ L1W!SetRed
                    /\ busyF' = busyF - 1
                    /\ UNCHANGED << busyA, busyB, busyC, busyD, busyG, busyH,
                                    statesSwitches, reserveds,
                                    targetPlatformA, targetPlatformB, targetPlatformC, targetPlatformD, targetPlatformG,
                                    targetDestinationA, targetDestinationB, targetDestinationC, targetDestinationD, targetDestinationG,
                                    targetPlatformP2, targetPlatformP3, targetPlatformP4,
                                    targetDestinationP2, targetDestinationP3, targetDestinationP4,
                                    colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E,colorL2E, colorL3E, colorL4E, colorL2W, colorL3W, colorL4W,
                                    countA, countB, countC, countD, countG, countP2, countP3, countP4
                                    >>

TrainLeavesP2W ==   /\ colorL2W = "green"
                    /\ F!TrainEnters(targetPlatformP2, targetDestinationP2)
                    /\ P2!TrainLeaves
                    /\ L2W!SetRed
                    /\ busyF' = busyF -1 /\ busyG' = busyG -1
                    /\ UNCHANGED << busyA, busyB, busyC, busyD, busyH,
                                    statesSwitches, reserveds,
                                    targetPlatformA, targetPlatformB, targetPlatformC, targetPlatformD, targetPlatformG,
                                    targetDestinationA, targetDestinationB, targetDestinationC, targetDestinationD, targetDestinationG,
                                    targetPlatformP1, targetPlatformP3, targetPlatformP4,
                                    targetDestinationP1, targetDestinationP3, targetDestinationP4,
                                    colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E,colorL2E, colorL3E, colorL4E, colorL1W, colorL3W, colorL4W,
                                    countA, countB, countC, countD, countG, countP1, countP3, countP4
                                    >>

TrainLeavesP3W ==   /\ colorL3W= "green" 
                    /\ F!TrainEnters(targetPlatformP3, targetDestinationP3)
                    /\ P3!TrainLeaves
                    /\ L3W!SetRed
                    /\ busyF' = busyF - 1 /\ busyG' = busyG - 1 /\ busyH' = busyH - 1
                    /\ UNCHANGED << busyA, busyB, busyC, busyD,
                                    statesSwitches, reserveds,
                                    targetPlatformA, targetPlatformB, targetPlatformC, targetPlatformD, targetPlatformG,
                                    targetDestinationA, targetDestinationB, targetDestinationC, targetDestinationD, targetDestinationG,
                                    targetPlatformP1, targetPlatformP2, targetPlatformP4,
                                    targetDestinationP1, targetDestinationP2, targetDestinationP4,
                                    colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E,colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL4W,
                                    countA, countB, countC, countD, countG, countP1, countP2, countP4
                                    >>

TrainLeavesP4W ==   /\ colorL4W = "green"
                    /\ F!TrainEnters(targetPlatformP4, targetDestinationP4)
                    /\ P4!TrainLeaves
                    /\ L4W!SetRed
                    /\ busyF' = busyF -1 /\ busyG' = busyG - 1 /\ busyH' = busyH - 1
                    /\ UNCHANGED << busyA, busyB, busyC, busyD,
                                    statesSwitches, reserveds,
                                    targetPlatformA, targetPlatformB, targetPlatformC, targetPlatformD, targetPlatformG,
                                    targetDestinationA, targetDestinationB, targetDestinationC, targetDestinationD, targetDestinationG,
                                    targetPlatformP1, targetPlatformP2, targetPlatformP3,
                                    targetDestinationP1, targetDestinationP2, targetDestinationP3,
                                    colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E,colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W,
                                    countA, countB, countC, countD, countG, countP1, countP2, countP3
                                    >>

TrainLeavesP2E ==   /\ colorL2E = "green"
                    /\  \/  /\ targetDestinationP2 = "D"
                            /\ D!TrainEnters(targetPlatformP2, targetDestinationP2)
                            /\ busyB' = busyB - 1 /\ busyC' = busyC - 1 /\ busyD' = busyD - 1
                            /\ UNCHANGED << busyA, busyF, busyG, busyH,
                                            countA, countB, countC, countF, countG,
                                            targetPlatformA, targetPlatformB, targetPlatformC, targetPlatformF, targetPlatformG,
                                            targetDestinationA, targetDestinationB, targetDestinationC, targetDestinationF, targetDestinationG  >>
                        \/  /\ targetDestinationP2 = "B"
                            /\ B!TrainEnters(targetPlatformP2, targetDestinationP2)
                            /\ busyB' = busyB - 1 
                            /\ UNCHANGED << busyA, busyC, busyD, busyF, busyG, busyH,
                                            countA, countC, countD, countF, countG,
                                            targetPlatformA, targetPlatformC, targetPlatformD, targetPlatformF, targetPlatformG,
                                            targetDestinationA, targetDestinationC, targetDestinationD, targetDestinationF, targetDestinationG  >>
                    /\ P2!TrainLeaves
                    /\ L2E!SetRed
                    /\ UNCHANGED << statesSwitches, reserveds,
                                    targetPlatformP1, targetPlatformP3, targetPlatformP4,
                                    targetDestinationP1, targetDestinationP3, targetDestinationP4,
                                    colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W,
                                    countP1, countP3, countP4
                                    >>

TrainLeavesP3E ==   /\ colorL3E = "green"
                    /\  \/  /\ targetDestinationP3 = "D" 
                            /\ D!TrainEnters(targetPlatformP3, targetDestinationP3) 
                            /\ busyC' = busyC - 1 /\ busyD' = busyD - 1
                            /\ UNCHANGED << busyA, busyB, busyF, busyG, busyH,
                                            countA, countB, countC, countF, countG,
                                            targetPlatformA, targetPlatformB, targetPlatformC, targetPlatformF, targetPlatformG,
                                            targetDestinationA, targetDestinationB, targetDestinationC, targetDestinationF, targetDestinationG  >>
                        \/  /\ targetDestinationP3 = "B" 
                            /\ B!TrainEnters(targetPlatformP3, targetDestinationP3) 
                            /\ busyB'= busyB - 1 /\ busyC'= busyC - 1
                            /\ UNCHANGED << busyA, busyD, busyF, busyG, busyH,
                                            countA, countC, countD, countF, countG,
                                            targetPlatformA, targetPlatformC, targetPlatformD, targetPlatformF, targetPlatformG,
                                            targetDestinationA, targetDestinationC, targetDestinationD, targetDestinationF, targetDestinationG >>
                    /\ P3!TrainLeaves
                    /\ L3E!SetRed
                    /\ UNCHANGED << statesSwitches, reserveds,
                                    targetPlatformP1, targetPlatformP2, targetPlatformP4,
                                    targetDestinationP1, targetDestinationP2, targetDestinationP4,
                                    colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E, colorL2E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W,
                                    countP1, countP2, countP4
                                    >>

TrainLeavesP4E ==   /\ colorL4E = "green" 
                    /\  \/  /\ targetDestinationP4 = "D" 
                            /\ D!TrainEnters(targetPlatformP4, targetDestinationP4) 
                            /\ busyD' = busyD -1 
                            /\ UNCHANGED << busyA, busyB, busyC, busyF, busyG, busyH,
                                            countA, countB, countC, countF, countG,
                                            targetPlatformA, targetPlatformB, targetPlatformC, targetPlatformF, targetPlatformG,
                                            targetDestinationA, targetDestinationB, targetDestinationC, targetDestinationF, targetDestinationG >>
                        \/  /\ targetDestinationP4 = "B"
                            /\ B!TrainEnters(targetPlatformP4, targetDestinationP4) 
                            /\ busyD' = busyD -1 /\ busyC' = busyC -1 /\ busyB' = busyB -1 
                            /\ UNCHANGED << busyA, busyF, busyG, busyH,
                                            countA, countC, countD, countF, countG,
                                            targetPlatformA, targetPlatformC, targetPlatformD, targetPlatformF, targetPlatformG,
                                            targetDestinationA, targetDestinationC, targetDestinationD, targetDestinationF, targetDestinationG  >>
                    /\ P4!TrainLeaves
                    /\ L4E!SetRed
                    /\ UNCHANGED << statesSwitches, reserveds,
                                    targetPlatformP1, targetPlatformP2, targetPlatformP3,
                                    targetDestinationP1, targetDestinationP2, targetDestinationP3,
                                    colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorLGE, colorL1E, colorL2E, colorL3E, colorL1W, colorL2W, colorL3W, colorL4W,
                                    countP1, countP2, countP3
                                    >>

TrainLeavesC == /\ colorLCW = "green"
                /\  \/  /\ targetPlatformC = "P1"
                        /\ P1!TrainEnters(targetPlatformC, targetDestinationC)
                        /\ busyA' = busyA - 1 /\ busyB' = busyB - 1 /\ busyC' = busyC - 1
                        /\ reservedP1' = reservedP1 - 1
                        /\ UNCHANGED << busyD, busyF, busyG, busyH,
                                        countP2, countP3, countP4,
                                        targetDestinationP2, targetDestinationP3,targetDestinationP4,
                                        targetPlatformP2, targetPlatformP3, targetPlatformP4,
                                        reservedP2, reservedP3, reservedP4
                                        >>
                    \/  /\ targetPlatformC = "P2"
                        /\ P2!TrainEnters(targetPlatformC, targetDestinationC)
                        /\ busyB' = busyB - 1 /\ busyC' = busyC - 1
                        /\ reservedP2' = reservedP2 - 1
                        /\ UNCHANGED << busyA, busyD, busyF, busyG, busyH,
                                        countP1, countP3, countP4,
                                        targetDestinationP1, targetDestinationP3,targetDestinationP4,
                                        targetPlatformP1, targetPlatformP3, targetPlatformP4,
                                        reservedP1, reservedP3, reservedP4 
                                        >>
                    \/  /\ targetPlatformC = "P3"
                        /\ P3!TrainEnters(targetPlatformC, targetDestinationC)
                        /\ busyC' = busyC - 1
                        /\ reservedP3' = reservedP3 - 1
                        /\ UNCHANGED << busyA, busyB, busyD, busyF, busyG, busyH,
                                        countP1, countP2, countP4,
                                        targetDestinationP1, targetDestinationP2,targetDestinationP4,
                                        targetPlatformP1, targetPlatformP2, targetPlatformP4,
                                        reservedP1, reservedP2, reservedP4
                                        >>
                    \/  /\ targetPlatformC = "P4"
                        /\ P4!TrainEnters(targetPlatformC, targetDestinationC)
                        /\ busyC' = busyC - 1  /\ busyD' = busyC -1
                        /\ reservedP4' = reservedP4 - 1
                        /\ UNCHANGED << busyA, busyB, busyF, busyG, busyH,
                                        countP1, countP2, countP3,
                                        targetDestinationP1, targetDestinationP2,targetDestinationP3,
                                        targetPlatformP1, targetPlatformP2, targetPlatformP3,
                                        reservedP1, reservedP2, reservedP3
                                        >>
                /\ C!TrainLeaves
                /\ LCW!SetRed
                /\ UNCHANGED << statesSwitches, 
                                colorLAW, colorLBW, colorLDW ,colorLFE, colorLGE, colorL1E,colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W,
                                targetPlatformA, targetPlatformB, targetPlatformD, targetPlatformF, targetPlatformG,
                                targetDestinationA, targetDestinationB, targetDestinationD, targetDestinationF, targetDestinationG,
                                countA, countB, countD, countF, countG
                                >>

TrainLeavesG == /\ colorLGE = "green"
                /\  \/  /\ targetPlatformG = "P2"
                        /\ P2!TrainEnters(targetPlatformG, targetDestinationG)
                        /\ busyG' = busyG - 1
                        /\ reservedP2' = reservedP2 - 1
                        /\ UNCHANGED << busyA, busyB, busyC, busyD, busyF, busyH , 
                                        countP1, countP3, countP4 ,
                                        targetDestinationP1, targetDestinationP3,targetDestinationP4,
                                        targetPlatformP1, targetPlatformP3, targetPlatformP4,
                                        reservedP1, reservedP3, reservedP4 >>
                    \/  /\ targetPlatformG = "P3"
                        /\ P3!TrainEnters(targetPlatformG, targetDestinationG)
                        /\ busyG' = busyG - 1 /\ busyH' = busyH -1
                        /\ reservedP3' = reservedP3 - 1
                        /\ UNCHANGED << busyA, busyB, busyC, busyD, busyF, 
                                        countP1, countP2, countP4 ,targetDestinationP4,
                                        targetDestinationP1, targetDestinationP2,targetDestinationP4,
                                        targetPlatformP1, targetPlatformP2, targetPlatformP4,
                                        reservedP1, reservedP2, reservedP4 >>
                    \/  /\ targetPlatformG = "P4"
                        /\ P4!TrainEnters(targetPlatformG, targetDestinationG)
                        /\ busyG' = busyG - 1 /\ busyH' = busyH - 1
                        /\ reservedP4' = reservedP4 - 1
                        /\ UNCHANGED << busyA, busyB, busyC, busyD, busyF, 
                                        countP1, countP2, countP3,
                                        targetDestinationP1, targetDestinationP2,targetDestinationP3,
                                        targetPlatformP1, targetPlatformP2, targetPlatformP3,
                                        reservedP1, reservedP2, reservedP3 >>
                /\ G!TrainLeaves
                /\ LGE!SetRed
                /\ UNCHANGED << statesSwitches,
                                colorLAW, colorLBW, colorLCW, colorLDW ,colorLFE, colorL1E,colorL2E, colorL3E, colorL4E, colorL1W, colorL2W, colorL3W, colorL4W,
                                targetPlatformA, targetPlatformB, targetPlatformC, targetPlatformD, targetPlatformF,
                                targetDestinationA, targetDestinationB, targetDestinationC, targetDestinationD, targetDestinationF,
                                countA, countB, countC, countD, countF
                                >>

(* ---------------------------------------- NEW train enters ---------------------------------------- *)

(* NewtrainA == A!NewTrain("A") *)

NewTrainC == /\ C!NewTrain("C")
             /\ UNCHANGED << colors, statesSwitches, busys, reserveds,
                             targetPlatformsOfPlatforms, targetDestinationsOfPlatforms, 
                             countA, countB, countD, countF, countG, countP1, countP2, countP3, countP4,
                             targetPlatformA, targetPlatformB, targetPlatformD, targetPlatformF,targetPlatformG,
                             targetDestinationA, targetDestinationB, targetDestinationD, targetDestinationF,targetDestinationG >>

NewTrainG == /\ G!NewTrain("G")
             /\ UNCHANGED << colors, statesSwitches, busys, reserveds,
                             targetPlatformsOfPlatforms, targetDestinationsOfPlatforms, 
                             countA, countB,countC, countD, countF, countP1, countP2, countP3, countP4,
                             targetPlatformA, targetPlatformB,targetPlatformC, targetPlatformD, targetPlatformF,
                             targetDestinationA, targetDestinationB,targetDestinationC, targetDestinationD, targetDestinationF >>

TrainLeavesD == /\ D!TrainLeaves
                /\ UNCHANGED << colors, statesSwitches, busys, reserveds,
                                targetPlatformsOfPlatforms, targetDestinationsOfPlatforms, 
                                countA, countB, countC, countF, countG, countP1, countP2, countP3, countP4,
                                targetPlatformA, targetPlatformB, targetPlatformC, targetPlatformF,targetPlatformG,
                                targetDestinationA, targetDestinationB, targetDestinationC, targetDestinationF,targetDestinationG >>

TrainLeavesF == /\ F!TrainLeaves
                /\ UNCHANGED << colors, statesSwitches, busys, reserveds,
                                targetPlatformsOfPlatforms, targetDestinationsOfPlatforms, 
                                countA, countB,countC, countD, countG, countP1, countP2, countP3, countP4,
                                targetPlatformA, targetPlatformB, targetPlatformC, targetPlatformD, targetPlatformG,
                                targetDestinationA, targetDestinationB, targetDestinationC, targetDestinationD, targetDestinationG >>

(* ---------------------------------------- NEXT STATE ---------------------------------------- *)

Next == (* \/ NewTrainA *)
        \/ NewTrainC
        \/ NewTrainG
        \/ TrainLeavesD
        \/ TrainLeavesF
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

Live == TRUE

(* Specification *)
Spec == /\ Init
        /\ [][Next]_vars
        /\ Live

------------------------------------

(* Invariants / Temporal properties to verify *)

TypeInvariant == /\ LCW!TypeInvariant /\ LGE!TypeInvariant /\ L2E!TypeInvariant /\ L3E!TypeInvariant /\ L1W!TypeInvariant /\ L2W!TypeInvariant /\ L3W!TypeInvariant /\ L4W!TypeInvariant
                 /\ SA2!TypeInvariant /\ SB2!TypeInvariant /\ SC2!TypeInvariant /\ SC3!TypeInvariant /\ SD1!TypeInvariant /\ SD2!TypeInvariant /\ SF1!TypeInvariant /\ SG1!TypeInvariant /\ SH1!TypeInvariant
                 /\ C!TypeInvariant /\ F!TypeInvariant
                 /\ D!TypeInvariant /\ G!TypeInvariant
                 /\ P1!TypeInvariant /\ P2!TypeInvariant /\ P3!TypeInvariant /\ P4!TypeInvariant
                 /\ \A x \in DOMAIN busys: busys[x] \in {0,1}
                 /\ \A x \in DOMAIN reserveds: reserveds[x] \in {0,1}

(* Properties *)

------------------------------------

(* Theorems *)
THEOREM Spec => []TypeInvariant

====================================
