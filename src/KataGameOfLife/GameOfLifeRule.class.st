Class {
	#name : #GameOfLifeRule,
	#superclass : #Object,
	#category : 'KataGameOfLife'
}

{ #category : #'as yet unclassified' }
GameOfLifeRule >> requiredTalents [
	^ {  }
]

{ #category : #accessing }
GameOfLifeRule >> requiredValues [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
GameOfLifeRule >> scopeOf: aGameOfLifeCell in: aGameOfLife [ 
	self subclassResponsibility

]

{ #category : #'as yet unclassified' }
GameOfLifeRule >> triggerOn [
	self subclassResponsibility

]

{ #category : #'as yet unclassified' }
GameOfLifeRule >> triggerOn: aGameOfLifeCellGotBorn in: anAnnouncer [ 
	self subclassResponsibility
]
