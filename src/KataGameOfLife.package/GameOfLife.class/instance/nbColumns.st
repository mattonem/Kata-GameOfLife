accessing
nbColumns
	^ rows ifNotEmpty: [ rows first nbCells ] ifEmpty: 0