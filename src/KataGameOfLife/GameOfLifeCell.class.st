Class {
	#name : 'GameOfLifeCell',
	#superclass : 'Object',
	#traits : 'GoLAnnouncerTrait + GoLPositionnableTrait + GameOfLifeNeighbourTalent',
	#classTraits : 'GoLAnnouncerTrait classTrait + GoLPositionnableTrait classTrait + GameOfLifeNeighbourTalent classTrait',
	#instVars : [
		'status'
	],
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'instance creation' }
GameOfLifeCell class >> newFromString: aString [
	^ self new fromString: aString
]

{ #category : 'accessing' }
GameOfLifeCell >> announcer [
	^ announcer
]

{ #category : 'as yet unclassified' }
GameOfLifeCell >> die [
	status := GameOfLifeStatusDead new.
	announcer
		announce:
			(GameOfLifeCellDies new
				cell: self;
				yourself)
]

{ #category : 'initialize' }
GameOfLifeCell >> fromString: aString [
	status := GameOfLifeStatus fromString: aString.
	^ self
]

{ #category : 'as yet unclassified' }
GameOfLifeCell >> getBorn [
	status := GameOfLifeStatusAlive new.
	announcer
		announce:
			(GameOfLifeCellGotBorn new
				cell: self;
				yourself)
]

{ #category : 'acessing' }
GameOfLifeCell >> initialize [ 
	super initialize.
	self initializeGoLNeighbourTrait
]

{ #category : 'testing' }
GameOfLifeCell >> isAlive [
	^ status isAlive
]

{ #category : 'initialize' }
GameOfLifeCell >> printOn: aStream [
	status printOn: aStream .

]
