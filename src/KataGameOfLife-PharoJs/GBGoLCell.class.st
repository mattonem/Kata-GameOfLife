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
	poly := GBRectangle new
		        color: '#9F9F9F';
		        corner: 20 @ 20;
		        yourself.
	ref := GBDrawingReference new.
	ref
		addElement: poly;
		addElement: (GBMouseOverRectangle new corner: poly corner);
		addElement: (GBMouseClickRectangle new corner: poly corner);
		addElement: (statusLayer := GBNode new);
		addElement: (overLayer := GBNode new);
		addElement: (GBScript new
				 on: GBMouseOverStarted;
				 do: [
					 (overLayer translation: 2 @ 2) addElement: (GBRectangle new
								  color: '#FFFFCC';
								  corner: 16 @ 16;
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
		statusLayer addElement: (GBRectangle new
				 color: '#CCFF99';
				 corner: 20 @ 20;
				 yourself) ]
]