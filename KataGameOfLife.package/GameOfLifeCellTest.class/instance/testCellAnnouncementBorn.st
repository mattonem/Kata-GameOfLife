tests
testCellAnnouncementBorn
	| cell triggerred |
	cell := GameOfLifeCell newFromString: '1'.
	triggerred := false.
	cell announcer when: GameOfLifeCellGotBorn do: [ triggerred := true ]. 
	cell getBorn.
	self assert: triggerred	