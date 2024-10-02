Class {
	#name : 'GameOfLifeStatusAlive',
	#superclass : 'GameOfLifeStatus',
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'initialize' }
GameOfLifeStatusAlive class >> stringValue [
	^ '1'
]

{ #category : 'testing' }
GameOfLifeStatusAlive >> isAlive [
	^ true
]

{ #category : 'printing' }
GameOfLifeStatusAlive >> printOn: aStream [
	aStream << $1
]
