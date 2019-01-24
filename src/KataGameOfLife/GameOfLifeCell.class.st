Class {
	#name : #GameOfLifeCell,
	#superclass : #Object,
	#instVars : [
		'status',
		'announcer',
		'values'
	],
	#category : 'KataGameOfLife'
}

{ #category : #'instance creation' }
GameOfLifeCell class >> newFromString: aString [ 
	^ self new fromString: aString
]

{ #category : #accessing }
GameOfLifeCell >> announcer [
	^ announcer
]

{ #category : #'as yet unclassified' }
GameOfLifeCell >> die [
	announcer
		announce:
			(GameOfLifeCellDies new
				cell: self;
				yourself)
]

{ #category : #initialize }
GameOfLifeCell >> fromString: aString [ 
	status := GameOfLifeStatus fromString: aString.
	^ self
]

{ #category : #'as yet unclassified' }
GameOfLifeCell >> getBorn [
		announcer
		announce:
			(GameOfLifeCellGotBorn new
				cell: self;
				yourself)
]

{ #category : #initialization }
GameOfLifeCell >> initialize [
	super initialize.
	announcer := Announcer new.
	values := Dictionary new
]

{ #category : #multivalues }
GameOfLifeCell >> initializeValue: anAssociation [ 
	values at: anAssociation key ifAbsentPut: anAssociation value
]

{ #category : #testing }
GameOfLifeCell >> isAlive [
	^ status isAlive
]

{ #category : #initialize }
GameOfLifeCell >> printOn: aStream [
	status printOn: aStream .

]

{ #category : #multivalues }
GameOfLifeCell >> valueAt: aString [ 
	^ values at: aString
]