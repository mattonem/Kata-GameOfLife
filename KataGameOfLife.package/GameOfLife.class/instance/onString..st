initialization
onString: aString
	(aString
		findTokens:
			{Character cr.
			Character lf}) do: [ :aLine | aLine trim ifNotEmpty: [ self addRowFromString: aLine ] ].
	rows
		doWithIndex: [ :aRow :index | aRow cellsDo: [ :aCell | aCell initializeValue: #y -> index ] ].
	self addRule: GameOfLifeNeighbourAliveCountRule new.
	self addRule: GameOfLifeNeighbourDeadCountRule new.
	^ self