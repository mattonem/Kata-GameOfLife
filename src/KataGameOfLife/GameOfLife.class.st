Class {
	#name : #GameOfLife,
	#superclass : #Object,
	#instVars : [
		'rows',
		'announcer'
	],
	#category : 'KataGameOfLife'
}

{ #category : #'instance creation' }
GameOfLife class >> newFromString: aString [
  | inst |
  inst := self new onString: aString.
  inst addRule: GameOfLifeLiveOrDieRule new.
  ^ inst
]

{ #category : #initialize }
GameOfLife >> addRowFromString: aString [
	| aRow |
	aRow := rows add: GameOfLifeRow new.
	(aString findTokens: $|)
		doWithIndex: [ :aCell :index| aCell trim ifNotEmpty: [ aRow addCellFromString: aCell ] ].

]

{ #category : #initialize }
GameOfLife >> addRule: aGameOfLifeRule [
	aGameOfLifeRule requiredTalents
		do: [ :aTalent |
			self
				cellsDo: [ :aCell |
					[ aCell addTalent: aTalent.
					aCell
						perform: ('initializeOnCell' , aTalent name , ':inBoard:') asSymbol
						with: aCell
						with: self ]
						on: Error
						do: [ :e |
							e messageText = 'Could not include the same traits twice'
								ifFalse: [ e signal ] ] ] ]
]

{ #category : #accessing }
GameOfLife >> cellAt: aPoint [
	^ (rows at: aPoint x ifAbsent: [^ nil]) cellAt: aPoint y
]

{ #category : #'as yet unclassified' }
GameOfLife >> cellsDo: aBlockClosure [
	rows do: [ :aRow | aRow cellsDo: aBlockClosure ]
]

{ #category : #accessing }
GameOfLife >> downOf: aGameOfLifeCell [
	^ self cellAt: (self positionOf: aGameOfLifeCell) + (1@0)
]

{ #category : #initialization }
GameOfLife >> initialize [
	super initialize.
	rows := OrderedCollection new.
	announcer := Announcer new

]

{ #category : #accessign }
GameOfLife >> leftDownOf: aGameOfLifeCell [
	^ self downOf: ((self rightOf: aGameOfLifeCell) ifNil: [ ^ nil ])
]

{ #category : #'as yet unclassified' }
GameOfLife >> leftOf: aGameOfLifeCell [
	^ self cellAt: (self positionOf: aGameOfLifeCell) + (0@(-1))
]

{ #category : #'as yet unclassified' }
GameOfLife >> leftUpOf: aGameOfLifeCell [
	^ self upOf: ((self leftOf: aGameOfLifeCell) ifNil: [ ^ nil ])
]

{ #category : #accessing }
GameOfLife >> nbCells [
	^ self nbRows * self nbColumns
]

{ #category : #accessing }
GameOfLife >> nbColumns [
	^ rows ifNotEmpty: [ rows first nbCells ] ifEmpty: 0
]

{ #category : #accessing }
GameOfLife >> nbRows [
	^ rows size
]

{ #category : #initialization }
GameOfLife >> onString: aString [
	(aString
		findTokens:
			{Character cr.
			Character lf}) do: [ :aLine | aLine trim ifNotEmpty: [ self addRowFromString: aLine ] ].
	rows
		doWithIndex: [ :aRow :rowIndex | aRow cellsDoWithIndex: [ :aCell :colIndex | aCell position: (rowIndex @ colIndex) ] ].
	^ self
]

{ #category : #accessing }
GameOfLife >> positionOf: aGameOfLifeCell [
	^ aGameOfLifeCell position
]

{ #category : #accessing }
GameOfLife >> printOn: aStream [
	rows do: [ :aRow |
		aRow printOn: aStream.
		aStream << Character cr.]

]

{ #category : #accessing }
GameOfLife >> rightDownOf: aGameOfLifeCell [
	^ self downOf: ((self rightOf: aGameOfLifeCell) ifNil: [ ^ nil ])
]

{ #category : #accessing }
GameOfLife >> rightOf: aGameOfLifeCell [
	^ self cellAt: (self positionOf: aGameOfLifeCell) + (0@1)
]

{ #category : #accessing }
GameOfLife >> rightUpOf: aGameOfLifeCell [
	^ self upOf: ((self rightOf: aGameOfLifeCell) ifNil: [ ^ nil ])
]

{ #category : #processing }
GameOfLife >> step [
	announcer announce: (GameOfLifeStepAnnouncement new game: self; yourself)
]

{ #category : #accessing }
GameOfLife >> upOf: aGameOfLifeCell [
	^ self cellAt: (self positionOf: aGameOfLifeCell) + (-1@0)
]
