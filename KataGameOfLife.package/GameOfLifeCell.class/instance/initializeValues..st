as yet unclassified
initializeValues: aCollection 
	aCollection associationsDo: [:anAssociation | self initializeValue: anAssociation]