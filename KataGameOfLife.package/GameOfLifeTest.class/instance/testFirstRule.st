tests
testFirstRule
	| gameOfLife |
	gameOfLife := GameOfLife
		newFromString:
			'
	|1|	'.
	GameOfLifeRuleDummy triggered: false.
	GameOfLifeRuleDummy applyOn: gameOfLife.
	gameOfLife cellsDo: [ :aCell | aCell getBorn ].
	self assert: GameOfLifeRuleDummy triggered.