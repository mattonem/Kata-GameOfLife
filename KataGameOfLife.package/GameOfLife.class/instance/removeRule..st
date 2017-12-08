as yet unclassified
removeRule: aGameOfLifeRule 
	self cellsDo: [ :aCell | aGameOfLifeRule  unsubscribeFrom: aCell ]