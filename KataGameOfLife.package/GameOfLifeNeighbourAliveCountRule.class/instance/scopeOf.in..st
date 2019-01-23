as yet unclassified
scopeOf: aGameOfLifeCell in: aGameOfLife
	^ {(aGameOfLife rightOf: aGameOfLifeCell).
	(aGameOfLife rightUpOf: aGameOfLifeCell).
	(aGameOfLife upOf: aGameOfLifeCell).
	(aGameOfLife downOf: aGameOfLifeCell).
	(aGameOfLife leftOf: aGameOfLifeCell).
	(aGameOfLife rightUpOf: aGameOfLifeCell).
	(aGameOfLife rightDownOf: aGameOfLifeCell).
	(aGameOfLife leftUpOf: aGameOfLifeCell).
	(aGameOfLife leftDownOf: aGameOfLifeCell)}