as yet unclassified
leftUpOf: aGameOfLifeCell 
	^ self upOf: ((self leftOf: aGameOfLifeCell) ifNil: [ ^ nil ])