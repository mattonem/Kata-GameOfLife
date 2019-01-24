as yet unclassified
addRule: aGameOfLifeRule
	aGameOfLifeRule requiredTalents
		do: [ :aTalent | 
			self
				cellsDo: [ :aCell | 
					[ aCell addTalent: aTalent.
					aCell
						perform: ('initializeOnCell' , aTalent name , ':inBoard:') asSymbol
						with: aCell
						with: self ]
						on: Error
						do: [ :e | 
							e messageText = 'Could not include the same traits twice'
								ifFalse: [ e signal ] ] ] ]