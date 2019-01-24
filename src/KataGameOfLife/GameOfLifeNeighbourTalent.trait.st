Trait {
	#name : #GameOfLifeNeighbourTalent,
	#instVars : [
		'neighbours'
	],
	#category : 'KataGameOfLife'
}

{ #category : #'as yet unclassified' }
GameOfLifeNeighbourTalent >> aliveNeighbours [
	^ neighbours count: #isAlive
]

{ #category : #initialization }
GameOfLifeNeighbourTalent >> initializeOnCellGameOfLifeNeighbourTalent: aCell inBoard: inBoard [
	neighbours
		addAll:
			({(inBoard rightOf: aCell).
			(inBoard rightUpOf: aCell).
			(inBoard upOf: aCell).
			(inBoard downOf: aCell).
			(inBoard leftOf: aCell).
			(inBoard rightUpOf: aCell).
			(inBoard rightDownOf: aCell).
			(inBoard leftUpOf: aCell).
			(inBoard leftDownOf: aCell)} asSet
				remove: nil ifAbsent: [];
				yourself)
]

{ #category : #initialization }
GameOfLifeNeighbourTalent >> initializeTalent [
	neighbours := OrderedCollection new.
]

{ #category : #acessing }
GameOfLifeNeighbourTalent >> nbNeighbour [
	^ neighbours size
]
