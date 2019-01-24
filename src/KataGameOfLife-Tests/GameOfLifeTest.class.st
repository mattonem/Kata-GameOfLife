"
A GameOfLifeTest is a test class for testing the behavior of GameOfLife
"
Class {
	#name : #GameOfLifeTest,
	#superclass : #TestCase,
	#category : 'KataGameOfLife-Tests'
}

{ #category : #tests }
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

{ #category : #tests }
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
	"commenting for now as it should be next iteration
	gameOfLife
		cellsDo: [ :aCell | self assert: aCell aliveNeighbours equals: 1 ]."
	gameOfLife cellsDo: [ :aCell | aCell die ].
	gameOfLife
		cellsDo: [ :aCell | self assert: aCell aliveNeighbours equals: 0 ]
]

{ #category : #tests }
GameOfLifeTest >> testStepEasy [
	| gameOfLife |
	gameOfLife := GameOfLife newFromString: '|0|'.
	gameOfLife step.
	self assert: gameOfLife nbRows equals: 1.
	self assert: gameOfLife nbColumns equals: 1.
	self assert: gameOfLife nbCells equals: 1.
	self assert: gameOfLife asString trim equals: '|0|'
]