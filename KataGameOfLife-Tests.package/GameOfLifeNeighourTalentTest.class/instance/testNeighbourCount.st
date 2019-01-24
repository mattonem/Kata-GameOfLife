tests
testNeighbourCount
	| gameOfLife |
	gameOfLife := GameOfLife
		newFromString:
			'
	|0|0|'.
	gameOfLife cellsDo: [ :aCell | self assert: aCell nbNeighbour equals: 1 ].