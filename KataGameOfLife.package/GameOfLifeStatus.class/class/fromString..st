instance creation
fromString: aString
	self subclasses ifEmpty: [ self error: 'status should have been implemented.' ].
	^ ((self subclasses collect: [ :subclass | subclass stringValue -> subclass ])
		asDictionary at: aString) new