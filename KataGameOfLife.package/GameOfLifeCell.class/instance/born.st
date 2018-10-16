computation
born
	status := GameOfLifeStatus alive.
	announcer announce: (GameOfLifeCellBirthAnnouncement new cell: self)