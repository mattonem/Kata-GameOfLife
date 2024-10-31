"
A GameOfLifeTest is a test class for testing the behavior of GameOfLife
"
Class {
	#name : 'GameOfLifeTest',
	#superclass : 'TestCase',
	#category : 'KataGameOfLife-Tests',
	#package : 'KataGameOfLife-Tests'
}

{ #category : 'tests' }
GameOfLifeTest >> testInitialize [
	| gameOfLife |
	gameOfLife := GameOfLife
		newFromString:
			'
	|1|1|1|
	|1|1|1|
	|1|1|1|
	'.
	self assert: gameOfLife nbRows equals: 3.
	self assert: gameOfLife nbColumns equals: 3.
	self assert: gameOfLife nbCells equals: 9.
	self
		assert: gameOfLife asString trim
		equals:
			'
|1|1|1|
|1|1|1|
|1|1|1|' trim.
]

{ #category : 'tests' }
GameOfLifeTest >> testLoop [
	| gameOfLife |
	gameOfLife := GameOfLife
		newFromString:
			'
	|0|1|0|
	|0|1|0|
	|0|1|0|
	'.
	gameOfLife step.
	self
		assert: gameOfLife asString trim
		equals:
			'
|0|0|0|
|1|1|1|
|0|0|0|' trim.
gameOfLife step.
	self
		assert: gameOfLife asString trim
		equals:
			'
|0|1|0|
|0|1|0|
|0|1|0|' trim.
]

{ #category : 'tests' }
GameOfLifeTest >> testNeighbourCount [
	| gameOfLife |
	gameOfLife := GameOfLife
		newFromString:
			'
	|0|0|'.
	gameOfLife
		cellsDo: [ :aCell | self assert: aCell nbNeighbour equals: 1 ].
	gameOfLife
		cellsDo: [ :aCell | self assert: aCell aliveNeighbours equals: 0 ].
	gameOfLife cellsDo: [ :aCell | aCell getBorn ].
	gameOfLife
		cellsDo: [ :aCell | self assert: aCell aliveNeighbours equals: 1 ].
	gameOfLife cellsDo: [ :aCell | aCell die ].
	gameOfLife
		cellsDo: [ :aCell | self assert: aCell aliveNeighbours equals: 0 ]
]

{ #category : 'tests' }
GameOfLifeTest >> testStepEasy [
	| gameOfLife |
	gameOfLife := GameOfLife newFromString: '|0|'.
	gameOfLife step.
	self assert: gameOfLife nbRows equals: 1.
	self assert: gameOfLife nbColumns equals: 1.
	self assert: gameOfLife nbCells equals: 1.
	self assert: gameOfLife asString trim equals: '|0|'
]
