accessing
cellAt: anInteger 
	^ cells at: anInteger ifAbsent: [ ^ nil ]