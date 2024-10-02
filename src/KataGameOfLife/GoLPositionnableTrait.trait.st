Trait {
	#name : 'GoLPositionnableTrait',
	#instVars : [
		'position'
	],
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'accessing' }
GoLPositionnableTrait >> position [
	 ^ position
]

{ #category : 'accessing' }
GoLPositionnableTrait >> position: aPoint [
	 ^ position := aPoint
]

{ #category : 'accessing' }
GoLPositionnableTrait >> x [
	 ^ position x
]

{ #category : 'accessing' }
GoLPositionnableTrait >> y [
	 ^ position y
]
