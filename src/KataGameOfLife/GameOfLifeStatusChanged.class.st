Class {
	#name : 'GameOfLifeStatusChanged',
	#superclass : 'Announcement',
	#instVars : [
		'cell'
	],
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'accessing' }
GameOfLifeStatusChanged >> cell: aGameOfLifeCell [ 
	cell := aGameOfLifeCell
]
