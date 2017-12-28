as yet unclassified
triggerOn: aGameOfLifeCell in: aBoard
	aGameOfLifeCell valueAt: #aliveNeighbours put: (aGameOfLifeCell valueAt: #aliveNeighbours) + 1