initialize
fromString: aString 
	status := GameOfLifeStatus fromString: aString.
	^ self