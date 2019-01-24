"
A GameOfLifeNeighourTalentTest is a test class for testing the behavior of GameOfLifeNeighourTalent
"
Class {
	#name : #GameOfLifeNeighourTalentTest,
	#superclass : #TestCase,
	#category : 'KataGameOfLife-Tests'
}

{ #category : #tests }
GameOfLifeNeighourTalentTest >> testInitialization [
| cell |
cell := GameOfLifeCell new.
cell addTalent: GameOfLifeNeighbourTalent.
self assert: cell nbNeighbour equals: 0
]

{ #category : #tests }
GameOfLifeNeighourTalentTest >> testNeighbourCount [
	| gameOfLife |
	gameOfLife := GameOfLife
		newFromString:
			'
	|0|0|'.
	gameOfLife cellsDo: [ :aCell | self assert: aCell nbNeighbour equals: 1 ].
]
