Class {
	#name : 'GoLAnnouncer',
	#superclass : 'Object',
	#instVars : [
		'subscriptions'
	],
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'announcer' }
GoLAnnouncer >> announce: aGoLNeighbourChangeAnnouncement [

	| eventSubscriptions |
	eventSubscriptions := subscriptions
		                      at: aGoLNeighbourChangeAnnouncement class
		                      ifAbsent: [ ^ self ].
	eventSubscriptions do: [ :coll |
		coll do: [ :ablock | ablock cull: aGoLNeighbourChangeAnnouncement ] ]
]

{ #category : 'announcer' }
GoLAnnouncer >> initialize [ 
	super initialize.
	subscriptions := Dictionary new
]

{ #category : 'subscription' }
GoLAnnouncer >> unsubscribe: aGameOfLifeCell [

	subscriptions do: [ :aDic |
		aDic removeKey: aGameOfLifeCell ifAbsent: nil ]
]

{ #category : 'announcer' }
GoLAnnouncer >> when: aClass do: aFullBlockClosure for: aGameOfLifeCell [

	aClass asSequence do: [ :anAnnouncement |
		((subscriptions at: anAnnouncement ifAbsentPut: Dictionary new)
			 at: aGameOfLifeCell
			 ifAbsentPut: OrderedCollection new) add: aFullBlockClosure ]
]
