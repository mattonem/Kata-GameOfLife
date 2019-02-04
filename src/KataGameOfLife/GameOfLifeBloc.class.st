"
space := BlSpace new.
space extent: 420@420.
game := GameOfLife launcher.
grid := GameOfLifeBloc new.
grid game: game.
space root addChild: grid.
space show.
grid invalidate.
[1000 timesRepeat: [game step. 100 milliSecond wait]. ] fork.
game 
"
Class {
	#name : #GameOfLifeBloc,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #KataGameOfLife
}

{ #category : #accessing }
GameOfLifeBloc >> game: agame [
	game := agame.
	"game announcer when: GameOfLifeStepFinishAnnouncement do: [ self invalidate ]."
	game
		cellsDo: [ :aCell | 
			self
				addChild:
					(GameOfLifeCellBloc new
						cell: aCell;
						addEventHandler:
							(GameOfLifeCellEventListener new
								cell: aCell;
								yourself);
						yourself) ].
	self
		constraintsDo: [ :aLayoutConstraints | 
			aLayoutConstraints horizontal fitContent.
			aLayoutConstraints vertical fitContent ].
		self layout columnCount: game nbColumns 
]

{ #category : #accessing }
GameOfLifeBloc >> initialize [
	super initialize.
	self layout: BlGridLayout horizontal.
	self layout: (BlGridLayout horizontal cellSpacing: 2).

]
