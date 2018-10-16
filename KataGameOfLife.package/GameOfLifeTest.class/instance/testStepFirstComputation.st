tests
testStepFirstComputation
	| gameOfLife |
	
	gameOfLife := GameOfLife newFromString: '|1|'.
	gameOfLife step.
	"self assert: gameOfLife nbRows equals: 1.
	self assert: gameOfLife nbColumns equals: 1.
	self assert: gameOfLife nbCells equals: 1.
	self assert: gameOfLife asString trim equals: '|0|'"