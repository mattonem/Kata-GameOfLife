Class {
	#name : 'GameOfLifeRuleDummy',
	#superclass : 'GameOfLifeRule',
	#instVars : [
		'triggered'
	],
	#classInstVars : [
		'triggered'
	],
	#category : 'KataGameOfLife-Tests',
	#package : 'KataGameOfLife-Tests'
}

{ #category : 'accessing' }
GameOfLifeRuleDummy >> requiredValues [
	^ {#testvalue -> 0} asDictionary
]

{ #category : 'accessing' }
GameOfLifeRuleDummy >> scopeOf: aGameOfLifeCell in: aGameOfLife [ 
	^ {aGameOfLifeCell}
]

{ #category : 'as yet unclassified' }
GameOfLifeRuleDummy >> triggerOn [
	^ GameOfLifeCellGotBorn
]

{ #category : 'as yet unclassified' }
GameOfLifeRuleDummy >> triggerOn: aGameOfLifeCellGotBorn in: anAnnouncer [ 
	triggered := true
]

{ #category : 'accessing' }
GameOfLifeRuleDummy >> triggered [
	^ triggered
]

{ #category : 'accessing' }
GameOfLifeRuleDummy >> triggered: aBoolean [ 
	triggered := aBoolean
]

{ #category : 'as yet unclassified' }
GameOfLifeRuleDummy >> unsubscribeFrom: aGameOfLifeCell [ 
	aGameOfLifeCell announcer unsubscribe: self
]
