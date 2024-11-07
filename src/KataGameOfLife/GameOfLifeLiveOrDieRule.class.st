Class {
	#name : 'GameOfLifeLiveOrDieRule',
	#superclass : 'GameOfLifeRule',
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'as yet unclassified' }
GameOfLifeLiveOrDieRule >> applyRule: aBoard [

	aBoard cellsDo: [ :aCell |
		aCell announcer
			when: GoLNeighbourChangeAnnouncement , GameOfLifeCellDies
				, GameOfLifeCellGotBorn
			do: [
				aBoard announcer unsubscribe: aCell.
				aCell isAlive
					ifTrue: [
						({ 2. 3 } includes: aCell aliveNeighbours) ifFalse: [
							aBoard announcer
								when: GameOfLifeStepAnnouncement
								do: [ aCell die ]
								for: aCell ] ]
					ifFalse: [
						aCell aliveNeighbours = 3 ifTrue: [
							aBoard announcer
								when: GameOfLifeStepAnnouncement
								do: [ aCell getBorn ]
								for: aCell ] ] ]
			for: self ]
]
