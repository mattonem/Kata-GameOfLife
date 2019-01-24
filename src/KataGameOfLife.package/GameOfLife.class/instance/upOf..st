accessing
upOf: aGameOfLifeCell 
	^ self cellAt: (self positionOf: aGameOfLifeCell) + (-1@0)