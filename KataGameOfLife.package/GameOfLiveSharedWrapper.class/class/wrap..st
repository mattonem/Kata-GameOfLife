instance creation
wrap: anObject 
	^ instanceDictionary at: anObject ifAbsentPut: [self new inst: anObject] 