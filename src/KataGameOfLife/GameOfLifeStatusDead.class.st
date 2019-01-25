Class {
	#name : #GameOfLifeStatusDead,
	#superclass : #GameOfLifeStatus,
	#category : 'KataGameOfLife'
}

{ #category : #initialize }
GameOfLifeStatusDead class >> stringValue [
	^ '0'
]

{ #category : #testing }
GameOfLifeStatusDead >> isAlive [
	^ false
]

{ #category : #printing }
GameOfLifeStatusDead >> printOn: aStream [ 
	aStream << $0
]
