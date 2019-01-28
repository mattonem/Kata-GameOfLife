"
A GameOfLifeCellTest is a test class for testing the behavior of GameOfLifeCell
"
Class {
	#name : #GameOfLifeCellTest,
	#superclass : #TestCase,
	#category : 'KataGameOfLife-Tests'
}

{ #category : #tests }
GameOfLifeCellTest >> testCellAnnouncementBorn [
	| cell triggerred |
	cell := GameOfLifeCell newFromString: '1'.
	triggerred := false.
	cell announcer when: GameOfLifeCellGotBorn do: [ triggerred := true ]. 
	cell getBorn.
	self assert: triggerred	
]

{ #category : #tests }
GameOfLifeCellTest >> testCellAnnouncementDies [
	| cell triggerred |
	cell := GameOfLifeCell newFromString: '1'.
	triggerred := false.
	cell announcer when: GameOfLifeCellDies do: [ triggerred := true ]. 
	cell die.
	self assert: triggerred	
]
