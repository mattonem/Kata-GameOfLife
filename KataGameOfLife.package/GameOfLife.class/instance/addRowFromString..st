initialize
addRowFromString: aString 

	| aRow |
	aRow := rows add: GameOfLifeRow new.
	(aString findTokens: $|) do: [ :aCell | aCell trim ifNotEmpty: [ aRow addCellFromString: aCell ] ]