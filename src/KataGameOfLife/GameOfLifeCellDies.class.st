Class {
	#name : #GameOfLifeCellDies,
	#superclass : #Announcement,
	#instVars : [
		'cell'
	],
	#category : 'KataGameOfLife'
}

{ #category : #accessing }
GameOfLifeCellDies >> cell: aGameOfLifeCell [ 
	cell := aGameOfLifeCell
]
