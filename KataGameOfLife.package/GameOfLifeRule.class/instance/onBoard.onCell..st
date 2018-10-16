initialization
onBoard: aClass onCell: aGameOfLifeCell 
	self class triggers do: [:annClass |  aGameOfLifeCell announcer when: annClass send: #action: to: self ].