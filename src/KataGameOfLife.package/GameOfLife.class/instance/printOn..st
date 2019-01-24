accessing
printOn: aStream
	rows do: [ :aRow | 
		aRow printOn: aStream.
		aStream << Character cr.]
