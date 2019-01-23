accessing
rightUpOf: aGameOfLifeCell 
	^ self upOf: ((self rightOf: aGameOfLifeCell) ifNil: [ ^ nil ])