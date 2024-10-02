Class {
	#name : 'GameOfLifeStepFinishAnnouncement',
	#superclass : 'GoLAnnouncement',
	#instVars : [
		'game'
	],
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'accessing' }
GameOfLifeStepFinishAnnouncement >> game: aGameOfLife [ 
	game := aGameOfLife
]
