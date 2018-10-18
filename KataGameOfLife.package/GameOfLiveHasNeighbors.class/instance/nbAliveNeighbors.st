initialization
nbAliveNeighbors
	^ neighbors count: [ :aCell | aCell isAlive ]