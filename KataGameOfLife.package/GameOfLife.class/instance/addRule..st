as yet unclassified
addRule: aGameOfLifeRule 
	self cellsDo: [ :aCell | aGameOfLifeRule initializeOnCell: aCell inBoard: self ]