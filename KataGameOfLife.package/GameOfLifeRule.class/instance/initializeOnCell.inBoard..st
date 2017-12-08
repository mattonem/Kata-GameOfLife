as yet unclassified
initializeOnCell: aGameOfLifeCell inBoard: aGameOfLife 
	aGameOfLifeCell initializeValues: self requiredValues.
	(self scopeOf: aGameOfLifeCell in: aGameOfLife) do: [ :aRelativeCell | aRelativeCell announcer when: self triggerOn do: (MessageSend receiver: self selector: #triggerOn:in: arguments: {aGameOfLifeCell. aGameOfLife}) ]