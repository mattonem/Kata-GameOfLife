as yet unclassified
newOnCell: aGameOfLifeCell inBoard: aGameOfLife 
	| instance |
	instance := self new cell: aGameOfLifeCell; yourself.
	aGameOfLifeCell addRule: instance for: self status.
	self scopeIn: aGameOfLife do: [ :aRelativeCell | aRelativeCell announcer when: self triggerOn send: #trigger to: instance ]