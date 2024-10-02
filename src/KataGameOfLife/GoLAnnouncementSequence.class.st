Class {
	#name : 'GoLAnnouncementSequence',
	#superclass : 'Object',
	#instVars : [
		'announcements'
	],
	#category : 'KataGameOfLife',
	#package : 'KataGameOfLife'
}

{ #category : 'copying' }
GoLAnnouncementSequence >> , aGoLAnnouncementSequence [ 
	^ self copyWithAll: aGoLAnnouncementSequence asSequence
]

{ #category : 'accessing' }
GoLAnnouncementSequence >> announcements [
	^ announcements
]

{ #category : 'converting' }
GoLAnnouncementSequence >> asSequence [
	^ self
]

{ #category : 'copying' }
GoLAnnouncementSequence >> copyWithAll: aGoLAnnouncementSequence [

	^ self class new withAll:
		  (announcements copyWithAll: aGoLAnnouncementSequence announcements)
]

{ #category : 'enumerating' }
GoLAnnouncementSequence >> do: aFullBlockClosure [ 
	announcements do: aFullBlockClosure 
]

{ #category : 'initialization' }
GoLAnnouncementSequence >> initialize [

	super initialize.
	announcements := OrderedCollection new
]

{ #category : 'converting' }
GoLAnnouncementSequence >> isSequence [
	^ true
]

{ #category : 'instance creation' }
GoLAnnouncementSequence >> with: aClass [ 
	announcements add: aClass
]

{ #category : 'instance creation' }
GoLAnnouncementSequence >> withAll: aCollection [ 
	announcements addAll: aCollection
]
