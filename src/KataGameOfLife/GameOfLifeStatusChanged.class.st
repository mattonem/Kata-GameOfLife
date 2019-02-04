Class {
	#name : #GameOfLifeStatusChanged,
	#superclass : #Announcement,
	#instVars : [
		'cell'
	],
	#category : #KataGameOfLife
}

{ #category : #accessing }
GameOfLifeStatusChanged >> cell: aGameOfLifeCell [ 
	cell := aGameOfLifeCell
]
