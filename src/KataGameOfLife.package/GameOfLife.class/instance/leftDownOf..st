accessign
leftDownOf: aGameOfLifeCell 
	^ self downOf: ((self rightOf: aGameOfLifeCell) ifNil: [ ^ nil ])