accessing
rightDownOf: aGameOfLifeCell 
	^ self downOf: ((self rightOf: aGameOfLifeCell) ifNil: [ ^ nil ])