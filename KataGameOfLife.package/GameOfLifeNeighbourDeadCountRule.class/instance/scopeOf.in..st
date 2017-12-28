as yet unclassified
scopeOf: aGameOfLifeCell in: aGameOfLife
	^ {(aGameOfLife rightOf: aGameOfLifeCell).
	(aGameOfLife upOf: aGameOfLifeCell).
	(aGameOfLife downOf: aGameOfLifeCell).
	(aGameOfLife leftOf: aGameOfLifeCell)}