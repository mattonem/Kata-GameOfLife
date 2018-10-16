tests
testLiveOrDie
	| cell test |
	test := false.
	cell := GameOfLifeCell newFromString: '1'.
	GameOfLifeRule ruleLiveOrDie on: cell.
	cell announcer when: GameOfLifeCellDieAnnouncement do: [ test := true ].
	cell nbNeighbors: 0.
	cell announcer announce: (GameOfLifeStepAnnouncement new cell: cell).
	self assert: test