Class {
	#name : #GameOfLifeStatus,
	#superclass : #Object,
	#category : 'KataGameOfLife'
}

{ #category : #'instance creation' }
GameOfLifeStatus class >> fromString: aString [
	self subclasses ifEmpty: [ self error: 'status should have been implemented.' ].
	^ ((self subclasses collect: [ :subclass | subclass stringValue -> subclass ])
		asDictionary at: aString) new
]

{ #category : #initialize }
GameOfLifeStatus class >> stringValue [
	self subclassResponsibility
]

{ #category : #testing }
GameOfLifeStatus >> isAlive [
	self subclassResponsibility
]

{ #category : #printing }
GameOfLifeStatus >> printOn: aStream [
	self subclassResponsibility
]
