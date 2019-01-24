initialize
addRowFromString: aString
	| aRow |
	aRow := rows add: GameOfLifeRow new.
	(aString findTokens: $|)
		doWithIndex: [ :aCell :index| aCell trim ifNotEmpty: [ (aRow addCellFromString: aCell) initializeValue: (#x -> index) ] ].
		