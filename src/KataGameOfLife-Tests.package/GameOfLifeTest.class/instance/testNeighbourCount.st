tests
testNeighbourCount
	| gameOfLife |
	gameOfLife := GameOfLife
		newFromString:
			'
	|0|0|'.
	gameOfLife
		cellsDo: [ :aCell | self assert: aCell nbNeighbour equals: 1 ].
	gameOfLife
		cellsDo: [ :aCell | self assert: aCell aliveNeighbours equals: 0 ].
	gameOfLife cellsDo: [ :aCell | aCell getBorn ].
	"commenting for now as it should be next iteration
	gameOfLife
		cellsDo: [ :aCell | self assert: aCell aliveNeighbours equals: 1 ]."
	gameOfLife cellsDo: [ :aCell | aCell die ].
	gameOfLife
		cellsDo: [ :aCell | self assert: aCell aliveNeighbours equals: 0 ]