Class {
	#name : 'GameOfLifeStatusChanged',
	#superclass : 'GoLAnnouncement',
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
