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
	| gameOfLife trigger |
	gameOfLife := GameOfLife
		newFromString:
			'
	|0|0|'.
	gameOfLife cellsDo: [ :aCell | self assert: aCell nbNeighbour equals: 1 ].
  trigger := false.
  gameOfLife cellsDo: [ :aCell | aCell announcer when: GoLNeighbourChangeAnnouncement do: [ trigger := true] ].
  gameOfLife cellsDo: [ :aCell | aCell getBorn ].
  self assert: trigger.
]
