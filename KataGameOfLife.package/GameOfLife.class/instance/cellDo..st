iteration
cellDo: aBlockClosure
	^ rows do: [ :aRow | aRow cellDo: aBlockClosure ]