tests
testNeighbourCount
	| gameOfLife |
	gameOfLife := GameOfLife
		newFromString:
			'
	|0|0|'.
	gameOfLife addRule: GameOfLifeNeighbourAliveCountRule new.
	gameOfLife addRule: GameOfLifeNeighbourDeadCountRule new.
	gameOfLife cellsDo: [ :aCell | self assert: (aCell valueAt:#aliveNeighbours) equals: 0 ].
	gameOfLife cellsDo: [ :aCell | aCell getBorn ].
	gameOfLife cellsDo: [ :aCell | self assert: (aCell valueAt:#aliveNeighbours) equals: 1 ].
	gameOfLife cellsDo: [ :aCell | aCell die ].
	gameOfLife cellsDo: [ :aCell | self assert: (aCell valueAt:#aliveNeighbours) equals: 0 ].