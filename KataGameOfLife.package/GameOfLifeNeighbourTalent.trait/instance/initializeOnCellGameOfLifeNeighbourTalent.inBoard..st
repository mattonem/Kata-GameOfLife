initialization
initializeOnCellGameOfLifeNeighbourTalent: aCell inBoard: inBoard
	neighbours
		addAll:
			({(inBoard rightOf: aCell).
			(inBoard rightUpOf: aCell).
			(inBoard upOf: aCell).
			(inBoard downOf: aCell).
			(inBoard leftOf: aCell).
			(inBoard rightUpOf: aCell).
			(inBoard rightDownOf: aCell).
			(inBoard leftUpOf: aCell).
			(inBoard leftDownOf: aCell)} asSet
				remove: nil;
				yourself)