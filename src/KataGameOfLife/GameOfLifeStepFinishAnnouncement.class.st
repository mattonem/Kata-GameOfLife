Class {
	#name : 'GameOfLifeStepFinishAnnouncement',
	#superclass : 'Announcement',
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
