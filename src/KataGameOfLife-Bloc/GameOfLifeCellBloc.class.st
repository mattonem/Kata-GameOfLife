Class {
	#name : #GameOfLifeCellBloc,
	#superclass : #BlElement,
	#instVars : [
		'cell'
	],
	#category : #'KataGameOfLife-Bloc'
}

{ #category : #'as yet unclassified' }
GameOfLifeCellBloc >> backgroundPaint [
	cell ifNil: [ Color red ].
	cell isAlive
		ifTrue: [ ^ Color yellow ]
		ifFalse: [ ^ Color lightGray ]
]

{ #category : #'as yet unclassified' }
GameOfLifeCellBloc >> cell [
^ cell
]

{ #category : #'as yet unclassified' }
GameOfLifeCellBloc >> cell: aCell [
	aCell announcer
		when: GameOfLifeStatusChanged 
		do: [ self invalidate ].
	^ cell := aCell
]

{ #category : #'as yet unclassified' }
GameOfLifeCellBloc >> drawOnSpartaCanvas: aCanvas [
	| roundedRectangle |
	roundedRectangle := aCanvas shape
		roundedRectangle: self boundsInLocal
		radii: (BlCornerRadii radius: 3).
	aCanvas clip
		by: roundedRectangle
		during: [ aCanvas fill
				paint: self backgroundPaint;
				path: self boundsInLocal;
				draw ]
]

{ #category : #'as yet unclassified' }
GameOfLifeCellBloc >> initialize [
super initialize.
self size: 10 @ 10.
]
