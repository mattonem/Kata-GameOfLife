Class {
	#name : 'GBGoLCell',
	#superclass : 'GBNode',
	#instVars : [
		'model',
		'statusLayer',
		'overLayer'
	],
	#category : 'KataGameOfLife-PharoJs',
	#package : 'KataGameOfLife-PharoJs'
}

{ #category : 'adding' }
GBGoLCell >> cellFactory [

	| ref poly |
	ref := GBDrawingReference new.
	ref
		addElement: (poly := GBPolygon new
				         color: '#9F9F9F';
				         points: {
						         (0 @ 0).
						         (0 @ 20).
						         (20 @ 20).
						         (20 @ 0) };
				         yourself);
		addElement: (GBMouseOverPolygon new points: poly points);
		addElement: (GBMouseClickPolygon new points: poly points);
		addElement: (statusLayer := GBNode new);
		addElement: (overLayer := GBNode new);
		addElement: (GBScript new
				 on: GBMouseOverStarted;
				 do: [
					 (overLayer translation: 2 @ 2) addElement: (GBPolygon new
								  color: '#FFFFCC';
								  points: {
										  (0 @ 0).
										  (0 @ 16).
										  (16 @ 16).
										  (16 @ 0) };
								  yourself) ];
				 yourself);
		addElement: (GBScript new
				 on: GBMouseOverEnded;
				 do: [ overLayer deleteAllChildren ];
				 yourself);
		addElement: (GBScript new
				 on: GBMouseElementClicked;
				 do: [
					 model isAlive
						 ifTrue: [ model die ]
						 ifFalse: [ model getBorn ].

					 self updateStatus ];
				 yourself).

	^ ref
]

{ #category : 'adding' }
GBGoLCell >> initialize [

	super initialize.
	self addElement: self cellFactory.
	
]

{ #category : 'adding' }
GBGoLCell >> model: aModel [

	model := aModel.
	self updateStatus.
	model announcer
		when: GameOfLifeStatusChanged
		do: [ self updateStatus ]
		for: self
]

{ #category : 'adding' }
GBGoLCell >> updateStatus [
	statusLayer deleteAllChildren.
	model isAlive ifTrue: [
		statusLayer addElement: (GBPolygon new
				 color: '#CCFF99';
				 points: {
						 (0 @ 0).
						 (0 @ 20).
						 (20 @ 20).
						 (20 @ 0) };
				 yourself) ]
]
