Class {
	#name : #GameOfLifeLiveOrDieRule,
	#superclass : #GameOfLifeRule,
	#category : 'KataGameOfLife'
}

{ #category : #'as yet unclassified' }
GameOfLifeLiveOrDieRule >> applyRule: aBoard [
	aBoard
		cellsDo: [ :aCell | 
			aCell announcer
				when:
					GoLNeighbourChangeAnnouncement , GameOfLifeCellDies
						, GameOfLifeCellGotBorn
				do: [ aCell isAlive
						ifTrue: [ (aCell aliveNeighbours = 2 or: aCell aliveNeighbours = 3)
								ifTrue: [ aBoard announcer unsubscribe: aCell ]
								ifFalse: [ aBoard announcer
										when: GameOfLifeStepAnnouncement
										do: [ aCell die ]
										for: aCell ] ]
						ifFalse: [ aCell aliveNeighbours = 3
								ifTrue: [ aBoard announcer
										when: GameOfLifeStepAnnouncement
										do: [ aCell getBorn ]
										for: aCell ]
								ifFalse: [ aBoard announcer unsubscribe: aCell ] ] ] ]
]

{ #category : #'as yet unclassified' }
GameOfLifeLiveOrDieRule >> requiredTalents [
	^ super requiredTalents , { GameOfLifeNeighbourTalent }
]
