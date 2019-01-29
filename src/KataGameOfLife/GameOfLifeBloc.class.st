"
gameOfLife := GameOfLife
		col: 200 row: 200.
view := GameOfLifeBloc new game: gameOfLife.
[100 timesRepeat: [gameOfLife step. 10 milliSecond wait] .view invalidate] fork.


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
