tests
testInitialization
| cell |
cell := GameOfLifeCell new.
cell addTalent: GameOfLifeNeighbourTalent.
self assert: cell nbNeighbour equals: 0