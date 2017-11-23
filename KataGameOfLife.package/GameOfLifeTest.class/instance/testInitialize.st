tests
testInitialize
	| gameOfLife |
	gameOfLife := GameOfLife newFromString: 
	'
	|1|1|1|
	|1|1|1|
	|1|1|1|
	'.
	self assert: gameOfLife nbRows equals: 3.
	self assert: gameOfLife nbColumns equals: 3.
	self assert: gameOfLife nbCells equals: 9