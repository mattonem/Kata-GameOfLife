Trait {
	#name : #GoLPositionnableTrait,
	#instVars : [
		'position'
	],
	#category : #KataGameOfLife
}

{ #category : #accessing }
GoLPositionnableTrait >> x [
	 ^ position x
]

{ #category : #accessing }
GoLPositionnableTrait >> y [
	 ^ position y
]

{ #category : #accessing }
GoLPositionnableTrait >> position [
	 ^ position
]

{ #category : #accessing }
GoLPositionnableTrait >> position: aPoint [
	 ^ position := aPoint
]
