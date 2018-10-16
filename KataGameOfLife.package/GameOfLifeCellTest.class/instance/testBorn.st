tests
testBorn
	| cell test |
	test := false.
	cell := GameOfLifeCell newFromString: '0'.
	cell announcer when: GameOfLifeCellBirthAnnouncement do: [ test := true ].
	cell born.
	self assert: test