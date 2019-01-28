Trait {
	#name : #GoLAnnouncerTrait,
	#instVars : [
		'announcer'
	],
	#category : #KataGameOfLife
}

{ #category : #initialization }
GoLAnnouncerTrait >> initialize [
	super initialize.
	announcer := Announcer new.
]
