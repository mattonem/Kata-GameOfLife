initialize
printOn: aStream
	aStream << $|.
	cells do: [:cell | cell printOn: aStream ].
	aStream << Character cr.