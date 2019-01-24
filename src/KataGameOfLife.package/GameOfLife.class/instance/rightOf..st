accessing
rightOf: aGameOfLifeCell 
	^ self cellAt: (self positionOf: aGameOfLifeCell) + (0@1)