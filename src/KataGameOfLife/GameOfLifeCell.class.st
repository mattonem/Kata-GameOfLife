Class {
	#name : 'GameOfLifeCell',
	#superclass : 'Object',
	#traits : 'GoLAnnouncerTrait + GoLPositionnableTrait + GameOfLifeNeighbourTrait',
	#classTraits : 'GoLAnnouncerTrait classTrait + GoLPositionnableTrait classTrait + GameOfLifeNeighbourTrait classTrait',
	#instVars : [
		'status',
		'iDieAnnouncement',
		'iGetBornAnnouncement'
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
	announcer announce: self iDieAnnouncement
]

{ #category : 'initialize' }
GameOfLifeCell >> fromString: aString [
	status := GameOfLifeStatus fromString: aString.
	^ self
]

{ #category : 'as yet unclassified' }
GameOfLifeCell >> getBorn [

	status := GameOfLifeStatusAlive new.
	announcer announce: self iGetBornAnnouncement
]

{ #category : 'as yet unclassified' }
GameOfLifeCell >> iDieAnnouncement [

	^ iDieAnnouncement
]

{ #category : 'as yet unclassified' }
GameOfLifeCell >> iGetBornAnnouncement [

	^ iGetBornAnnouncement
]

{ #category : 'acessing' }
GameOfLifeCell >> initialize [

	super initialize.
	self initializeGoLNeighbourTrait.
	iGetBornAnnouncement := GameOfLifeCellGotBorn new
		                        cell: self;
		                        yourself.
	iDieAnnouncement := GameOfLifeCellDies new
		                    cell: self;
		                    yourself
]

{ #category : 'testing' }
GameOfLifeCell >> isAlive [
	^ status isAlive
]

{ #category : 'initialize' }
GameOfLifeCell >> printOn: aStream [
	status printOn: aStream .

]
