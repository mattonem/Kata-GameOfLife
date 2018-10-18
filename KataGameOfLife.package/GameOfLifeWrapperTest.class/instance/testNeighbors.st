tests
testNeighbors
	| cell1 cell2 wrap1 |
	cell1 := GameOfLifeCell new.
	cell2 := GameOfLifeCell new.
	wrap1 := GameOfLiveHasNeighbors wrap: cell1.
	self assert: wrap1 nbAliveNeighbors equals: 0.
	wrap1 addNeighBor: cell2.
	cell2 die.
	self assert: wrap1 nbAliveNeighbors equals: 0.
	cell2 born.
	self assert: wrap1 nbAliveNeighbors equals: 1.