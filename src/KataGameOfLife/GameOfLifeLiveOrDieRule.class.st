Class {
	#name : #GameOfLifeLiveOrDieRule,
	#superclass : #GameOfLifeRule,
	#category : 'KataGameOfLife'
}

{ #category : #'as yet unclassified' }
GameOfLifeLiveOrDieRule >> requiredTalents [
	^ super requiredTalents , { GameOfLifeNeighbourTalent }
]
