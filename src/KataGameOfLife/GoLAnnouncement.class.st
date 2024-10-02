Class {
	#name : 'GoLAnnouncement',
	#superclass : 'Object',
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'copying' }
GoLAnnouncement class >> , anotherAnnouncement [

	^ self asSequence , anotherAnnouncement asSequence
]

{ #category : 'converting' }
GoLAnnouncement class >> asSequence [

	^ GoLAnnouncementSequence new
		  with: self;
		  yourself
]

{ #category : 'converting' }
GoLAnnouncement >> asAnnouncement [
	^ self
]

{ #category : 'converting' }
GoLAnnouncement >> isSequence [
	^ false
]
