---------- MODULE Track ----------

(* Variables *)
VARIABLES targetPlatform, targetDestination

------------------------------------

(* Sequence of variables *)
vars == << targetPlatform, targetDestination >>

EastOriginOutTracks == {"D"} (* TODO: "B" has to be added *)
WestOriginOutTracks == {"F"}
OutTracks == EastOriginOutTracks \union WestOriginOutTracks

EastOriginInTracks = {"G"}
WestOriginInTracks = {"C"} (* TODO: "A" has to be added *)
InTracks == EastOriginInTracks \union WestOriginInTracks

Platforms == {"P1", "P2", "P3", "P4"}
GPlatforms == {"P2", "P3", "P4"}
CPlatforms == {"P1", "P2", "P3"}
Tracks == InTracks \union OutTracks \union Platforms

TargetPlatforms = {"empty"} \union Platforms
TargetDestinations = {"empty"} \union  OutTracks

(* Initialization *)
Init == /\ targetPlatform = "empty"
        /\ targetDestination = "empty"

(* Actions *)
NewTrain(track) ==  /\ targetDestination = "empty"
                    /\  \/ track # "G" /\ track # "C" /\ LET s == CHOOSE x \in Platforms : TRUE
                                                          IN targetPlatform' = s
                        \/ track = "G" /\ LET s == CHOOSE x \in GPlatforms : TRUE
                                           IN targetPlatform' = s
                        \/ track = "C" /\ LET s == CHOOSE x \in CPlatforms : TRUE
                                           IN targetPlatform' = s
                    /\  \/ track \in EastOriginInTracks : LET s == CHOOSE x \in EastOriginOutTracks : TRUE
                                                           IN targetDestination' = s
                        \/ track \in WestOriginInTracks : LET s == CHOOSE x \in WestOriginOutTracks : TRUE
                                                           IN targetDestination' = s

TrainLeaves == /\ targetDestination # "empty"
               /\ targetPlatform' = "empty"
               /\ targetDestination' = "empty"

TrainEnters(platform, destination) ==   /\ targetDestination = "empty"
                                        /\ targetPlatform' = platform
                                        /\ targetDestination' = destination
            
Next =  \/ NewTrain
        \/ TrainLeaves
        \/ \E platform \in Platforms : \E destination \in OutTracks : TrainEnters(platform, destination)

------------------------------------

(* Liveness *)
Live ==	TRUE

(* Specification *)
Spec == /\ Init
        /\ [][Next]_vars
        /\ Live

------------------------------------

(* Invariants / Temporal properties to verify *)
TypeInvariant == /\ targetPlatform \in TargetPlatforms
                 /\ targetDestination \in TargetDestinations

(* Properties *)

------------------------------------

(* Theorems *)
THEOREM Spec => []TypeInvariant	

====================================
