accessing
downOf: aGameOfLifeCell 
	^ self cellAt: (self positionOf: aGameOfLifeCell) + (1@0)