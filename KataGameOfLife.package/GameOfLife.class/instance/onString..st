initialization
onString: aString
	(aString findTokens: {Character cr. Character lf}) do: [:aLine | aLine trim ifNotEmpty: [ self addRowFromString: aLine ] ].	  
	^ self