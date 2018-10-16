instance creation
newFromString: aString
	| inst |
	inst := self new initializeFromString: aString.
	inst cellDo: [ :aCell | GameOfLifeRule ruleLiveOrDie on: aCell ].
	^ inst