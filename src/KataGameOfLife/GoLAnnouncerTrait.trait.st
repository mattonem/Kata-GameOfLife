Trait {
	#name : 'GoLAnnouncerTrait',
	#instVars : [
		'announcer'
	],
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'initialization' }
GoLAnnouncerTrait >> initializeGoLAnnouncerTrait [
	announcer := Announcer new.
]
