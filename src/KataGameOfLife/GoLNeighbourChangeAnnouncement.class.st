Class {
	#name : #GoLNeighbourChangeAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'cell'
	],
	#category : 'KataGameOfLife'
}

{ #category : #accessing }
GoLNeighbourChangeAnnouncement >> cell: aCell [
	cell := aCell
]
