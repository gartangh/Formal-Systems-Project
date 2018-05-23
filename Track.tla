---------- MODULE Track ----------

EXTENDS Naturals

(* Variables *)
VARIABLES targetPlatform, targetDestination, count

------------------------------------

(* Sequence of variables *)
vars == << targetPlatform, targetDestination, count >>

EastOriginOutTracks == {"D"} (* TODO: "B" has to be added *)
WestOriginOutTracks == {"F"}
OutTracks == EastOriginOutTracks \union WestOriginOutTracks

EastOriginInTracks == {"G"}
WestOriginInTracks == {"C"} (* TODO: "A" has to be added *)
InTracks == EastOriginInTracks \union WestOriginInTracks

Platforms == {"P1", "P2", "P3", "P4"}
GPlatforms == {"P2", "P3", "P4"}
Tracks == InTracks \union OutTracks \union Platforms

TargetPlatforms == {"empty"} \union Platforms
TargetDestinations == {"empty"} \union  OutTracks

(* Initialization *)
Init == /\ targetPlatform = "empty"
        /\ targetDestination = "empty"
        /\ count = 0

(* Actions *)
NewTrain(track) ==  /\ targetDestination = "empty" /\ targetPlatform = "empty"
                    /\  \/ track # "G" /\   \/  targetPlatform' = "P1"
                                            \/  targetPlatform' = "P2"
                                            \/  targetPlatform' = "P3"
                                            \/  targetPlatform' = "P4"
                        \/ track = "G" /\   \/  targetPlatform' = "P2"
                                            \/  targetPlatform' = "P3"
                                            \/  targetPlatform' = "P4"
                    /\  \/ track \in EastOriginInTracks /\  \/ targetDestination' = "D"
                                                        (*  \/ targetDestination' = "B" *)
                        \/ track \in WestOriginInTracks /\ targetDestination' = "F"
                    /\ count' = count+1

TrainLeaves ==  /\ targetDestination # "empty" /\ targetPlatform # "empty"
                /\ targetPlatform' = "empty"
                /\ targetDestination' = "empty"
                /\ count' = count-1

TrainEnters(platform, destination) ==   /\ targetDestination = "empty"
                                        /\ targetPlatform' = platform
                                        /\ targetDestination' = destination
                                        /\ count' = count+1
   
Next == \/ NewTrain("C")
        \/ NewTrain("G")
        \/ TrainLeaves
        \/ \E platform \in Platforms : \E destination \in OutTracks : TrainEnters(platform, destination)

------------------------------------

(* Specification *)
Spec == /\ Init
        /\ [][Next]_vars

------------------------------------

IsGoodCount ==  \/ count = 0
                \/ count = 1

(* Invariants / Temporal properties to verify *)
TypeInvariant == /\ targetPlatform \in TargetPlatforms
                 /\ targetDestination \in TargetDestinations
                 /\ IsGoodCount

------------------------------------

(* Theorems *)
THEOREM Spec => []IsGoodCount

====================================
