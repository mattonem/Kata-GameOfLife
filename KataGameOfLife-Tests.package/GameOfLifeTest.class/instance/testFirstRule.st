tests
testFirstRule
	| gameOfLife rule |
	gameOfLife := GameOfLife
		newFromString:
			'
	|1|	'.
	rule := GameOfLifeRuleDummy new triggered: false; yourself.
	gameOfLife addRule: rule.
	gameOfLife cellsDo: [ :aCell | aCell getBorn ].
	self assert: rule triggered.
	rule triggered: false.
	gameOfLife removeRule: rule.
	gameOfLife cellsDo: [ :aCell | aCell getBorn ].
	self assert: rule triggered not.
	gameOfLife cellsDo: [ :aCell | self assert: (aCell valueAt:#testvalue) equals: 0 ].