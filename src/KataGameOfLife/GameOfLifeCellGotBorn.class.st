Class {
	#name : #GameOfLifeCellGotBorn,
	#superclass : #Announcement,
	#instVars : [
		'cell'
	],
	#category : 'KataGameOfLife'
}

{ #category : #accessing }
GameOfLifeCellGotBorn >> cell: aGameOfLifeCell [ 
	cell := aGameOfLifeCell
]
