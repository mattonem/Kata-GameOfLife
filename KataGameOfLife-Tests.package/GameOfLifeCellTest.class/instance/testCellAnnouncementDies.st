tests
testCellAnnouncementDies
	| cell triggerred |
	cell := GameOfLifeCell newFromString: '1'.
	triggerred := false.
	cell announcer when: GameOfLifeCellDies do: [ triggerred := true ]. 
	cell die.
	self assert: triggerred	