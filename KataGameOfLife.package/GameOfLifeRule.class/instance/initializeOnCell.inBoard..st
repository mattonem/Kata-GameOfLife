initialization
initializeOnCell: aGameOfLifeCell inBoard: aGameOfLife
	aGameOfLifeCell initializeValues: self requiredValues.
	(self scopeOf: aGameOfLifeCell in: aGameOfLife)
		do: [ :aRelativeCell | 
			aRelativeCell
				ifNotNil: [aRelativeCell announcer
						when: self triggerOn
						do: [self triggerOn: aGameOfLifeCell in: aGameOfLife]
						for: self ] ]