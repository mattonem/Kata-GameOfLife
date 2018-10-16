tests
testDie
	| cell test |
	test := false.
	cell := GameOfLifeCell newFromString: '1'.
	cell announcer when: GameOfLifeCellDieAnnouncement do: [ test := true ].
	cell die.
	self assert: test