as yet unclassified
initializeRule: aClass 
	self cellsDo: [ :aCell | aClass initializeOnCell: aCell inBoard: self ]