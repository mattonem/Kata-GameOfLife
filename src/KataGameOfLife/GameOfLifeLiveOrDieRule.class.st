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
			when: (AnnouncementSet new addAll:
					 GoLNeighbourChangeAnnouncement , GameOfLifeCellDies
					 , GameOfLifeCellGotBorn)
			do: [
				aBoard announcer unsubscribe: aCell.
				aCell isAlive
					ifTrue: [
						(aCell aliveNeighbours = 2 or: [ aCell aliveNeighbours = 3 ])
							ifFalse: [
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
