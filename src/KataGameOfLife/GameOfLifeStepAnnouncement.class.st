Class {
	#name : #GameOfLifeStepAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'game'
	],
	#category : 'KataGameOfLife'
}

{ #category : #accessing }
GameOfLifeStepAnnouncement >> game: aGameOfLife [ 
	game := aGameOfLife
]
