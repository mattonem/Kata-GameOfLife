accessing
cellAt: aPoint 
	^ (rows at: aPoint x ifAbsent: [^ nil]) cellAt: aPoint y 