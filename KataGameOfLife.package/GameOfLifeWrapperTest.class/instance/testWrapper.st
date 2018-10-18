tests
testWrapper
	| instance wrap wrap2 |
	instance := Object new.
	wrap := GameOfLiveSharedWrapperForTest wrap: instance.
	self assert: wrap dummy equals: 42.
	wrap2 := GameOfLiveSharedWrapperForTest wrap: instance.
	self assert: wrap equals: wrap2.