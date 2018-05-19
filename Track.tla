---------- MODULE Track ----------
(* Variables *)
VARIABLES position, state

------------------------------------

(* Sequence of variables *)
vars == << position, state >>

EastOriginOutTracks == {"D"} (* TODO: "B" has to be added *)
WestOriginOutTracks == {"F"}
OutTracks == EastOriginOutTracks \UNION WestOriginOutTracks

EastOriginInTracks = {"G"}
WestOriginInTracks = {"C"} (* TODO: "A" has to be added *)
InTracks == EastOriginInTracks \UNION WestOriginInTracks

Platforms == {"P1", "P2", "P3", "P4"}
Tracks == InTracks \UNION OutTracks \UNION Platforms

TrackStates = {"empty"} \UNION Platforms \UNION OutTracks
TrackPositions = {"undefined"} \UNION 

(* Initialization *)
Init == /\ position = "undefined"
        /\ state = "empty"

(* Actions *)
SetPosition(value) == /\ position = "undefined"
                      /\ value \in Tracks
                      /\ position' = value
                      /\ UNCHANGED state

NewTrain == /\ position \in InTracks
            /\ state = "empty"
            /\ state' \in Platforms
            /\ UNCHANGED position

TrainLeaves == /\ position \in Tracks
               /\ state # "empty"
               /\ state' = "empty"
               /\ UNCHANGED position

TrainEntersPlatform(origin) == /\ position \in Platforms
                               /\ state = "empty"
                               /\ \/ origin \in EastOriginInTracks /\ state' \in EastOriginOutTracks
                                  \/ origin \in WestOriginInTracks /\ state' \in WestOriginOutTracks
                               /\ UNCHANGED position

HasTrain == /\ state # "empty"
            /\ UNCHANGED vars

TrainP1Bound == /\ position \in InTracks
                /\ state = "P1"
                /\ UNCHANGED vars

TrainP2Bound == /\ position \in InTracks
                /\ state = "P2"
                /\ UNCHANGED vars

TrainP3Bound == /\ position \in InTracks
                /\ state = "P3"
                /\ UNCHANGED vars

TrainP4Bound == /\ position \in InTracks
                /\ state = "P4"
                /\ UNCHANGED vars

TrainFBound == /\ position \in OutTracks
               /\ state = "F"
               /\ UNCHANGED vars

TrainDBound == /\ position \in OutTracks
               /\ state = "D"
               /\ UNCHANGED vars

(* TODO: add TrainBBound *)

Next = \/ E\ value \in Tracks : SetPosition(value)
       \/ NewTrain
       \/ TrainLeaves
       \/ \E origin \in InTracks : TrainEntersPlatform(origin)

------------------------------------

(* Liveness *)
Live ==	TRUE

(* Specification *)
Spec == /\ Init
        /\ [][Next]_vars
        /\ Live


------------------------------------

(* Invariants / Temporal properties to verify *)
TypeInvariant == /\ position \in Tracks \/ position = "undefined"
                 /\ state \in TrackStates

(* Properties *)

------------------------------------

(* Theorems *)
THEOREM Spec => []TypeInvariant	

====================================
