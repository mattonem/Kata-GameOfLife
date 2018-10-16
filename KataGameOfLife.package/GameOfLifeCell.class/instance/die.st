initialize
die
	status := GameOfLifeStatus dead.
	announcer announce: (GameOfLifeCellDieAnnouncement new cell: self)