Class {
	#name : #GameOfLifeCellEventListener,
	#superclass : #BlElementEventListener,
	#instVars : [
		'cell'
	],
	#category : #'KataGameOfLife-Bloc'
}

{ #category : #accessing }
GameOfLifeCellEventListener >> cell: aGameOfLifeCell [ 
	cell := aGameOfLifeCell
]

{ #category : #accessing }
GameOfLifeCellEventListener >> clickEvent: anEvent [
cell isAlive ifTrue: [ cell die ] ifFalse: [ cell getBorn ] 
]
