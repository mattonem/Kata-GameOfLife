Class {
	#name : #GameOfLifeRow,
	#superclass : #Object,
	#instVars : [
		'cells'
	],
	#category : 'KataGameOfLife'
}

{ #category : #initialize }
GameOfLifeRow >> addCellFromString: aString [
	^ cells add: (GameOfLifeCell newFromString: aString)
]

{ #category : #accessing }
GameOfLifeRow >> cellAt: anInteger [
	^ cells at: anInteger ifAbsent: [ ^ nil ]
]

{ #category : #'as yet unclassified' }
GameOfLifeRow >> cellsDo: aBlockClosure [
	cells do: aBlockClosure
]

{ #category : #'' }
GameOfLifeRow >> cellsDoWithIndex: aBlockClosure [
  cells doWithIndex: aBlockClosure
]

{ #category : #initialize }
GameOfLifeRow >> initialize [
	super initialize.
	cells := OrderedCollection new
]

{ #category : #accessing }
GameOfLifeRow >> nbCells [
	^ cells size
]

{ #category : #initialize }
GameOfLifeRow >> printOn: aStream [
	aStream << $|.
	cells do: [:cell | cell printOn: aStream.
		aStream << $|.].

]
