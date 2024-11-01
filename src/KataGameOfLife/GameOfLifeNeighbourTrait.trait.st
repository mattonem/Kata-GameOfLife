Trait {
	#name : 'GameOfLifeNeighbourTrait',
	#instVars : [
		'neighbours',
		'nbAliveCount',
		'neighbourChangedAnnouncement'
	],
	#traits : 'GoLAnnouncerTrait',
	#classTraits : 'GoLAnnouncerTrait classTrait',
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'as yet unclassified' }
GameOfLifeNeighbourTrait >> aliveNeighbours [
	^ nbAliveCount
]

{ #category : 'initialization' }
GameOfLifeNeighbourTrait >> initializeGoLNeighbourTrait [
	self initializeGoLAnnouncerTrait.
	neighbours := OrderedCollection new.
	neighbourChangedAnnouncement := GoLNeighbourChangeAnnouncement new
		  cell: self;
		  yourself
]

{ #category : 'initialization' }
GameOfLifeNeighbourTrait >> initializeOnCellGameOfLifeNeighbourTalent: aCell inBoard: inBoard [

	neighbours addAll: ({
			 (inBoard rightOf: aCell).
			 (inBoard rightUpOf: aCell).
			 (inBoard upOf: aCell).
			 (inBoard downOf: aCell).
			 (inBoard leftOf: aCell).
			 (inBoard rightUpOf: aCell).
			 (inBoard rightDownOf: aCell).
			 (inBoard leftUpOf: aCell).
			 (inBoard leftDownOf: aCell) } copyWithout: nil) asSet.
	nbAliveCount := neighbours count: #isAlive.
	neighbours do: [ :anotherCell |
		anotherCell announcer
			when: GameOfLifeCellGotBorn
			do: [
				nbAliveCount := nbAliveCount + 1.
				announcer announce: self neighbourChangedAnnouncement ]
			for: self ].
	neighbours do: [ :anotherCell |
		anotherCell announcer
			when: GameOfLifeCellDies
			do: [
				nbAliveCount := nbAliveCount - 1.
				announcer announce: self neighbourChangedAnnouncement ]
			for: self ]
]

{ #category : 'acessing' }
GameOfLifeNeighbourTrait >> nbNeighbour [
	^ neighbours size
]

{ #category : 'initialization' }
GameOfLifeNeighbourTrait >> neighbourChangedAnnouncement [

	^ neighbourChangedAnnouncement
]