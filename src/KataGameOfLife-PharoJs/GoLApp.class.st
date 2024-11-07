Class {
	#name : 'GoLApp',
	#superclass : 'PjFileBasedWebApp',
	#traits : 'StaticComponentHolder',
	#classTraits : 'StaticComponentHolder classTrait',
	#instVars : [
		'clock',
		'reference',
		'model',
		'root'
	],
	#classInstVars : [
		'staticComponents'
	],
	#category : 'KataGameOfLife-PharoJs',
	#package : 'KataGameOfLife-PharoJs'
}

{ #category : 'description' }
GoLApp class >> appClasses [

	<pharoJsSkip>
	^ super appClasses , { WCGameBoxCanvas }
]

{ #category : 'description' }
GoLApp class >> bridgeClientClass [
	<pharoJsSkip>
	
	^ PjZnHostedBrowserBridgeClient
]

{ #category : 'description' }
GoLApp class >> exporterClass [
	<pharoJsSkip>
	
	^ PjFileExporterWithIndexHtml
]

{ #category : 'description' }
GoLApp class >> generateHtmlUsing: html [

	<pharoJsSkip>
	html div
		class: 'container';
		with: [
			html div
				class: 'card col-10 mx-auto text-center';
				with: [
					html div
						class: 'card-header';
						with: [
							html heading
								level: 1;
								with: 'Conway''s Game of Life' ].
					html div
						class: 'card-body';
						with: [
							html div with: [
									self addComponent: (WCGameBoxCanvas on: html) named: #plotter ].
							html div with: [
									html label
										for: 'tps';
										class: 'form-label';
										with: 'TPS: '.
									html inputRange
										min: 1;
										max: 240;
										value: 120;
										class: 'form-range';
										id: 'tps' ].

							html div
								id: #start;
								class: 'btn btn-primary';
								with: 'Start Clock'.
							html div
								id: #stop;
								class: 'btn btn-primary';
								with: 'Stop Clock'.
							html div
								id: #step;
								class: 'btn btn-primary';
								with: 'Step' ] ] ]
]

{ #category : 'description' }
GoLApp class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root language: 'en'.
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'
]

{ #category : 'as yet unclassified' }
GoLApp >> prepBoard [

	| manager tempNode tasks loading drawEvent |
	manager := GBTaskSequenceManager new.
	tempNode := GBDrawingTranslation new
		            position: -20 @ -20 * (model height @ model width) / 2;
		            yourself.
	tasks := OrderedCollection new.
	drawEvent := GBDrawFullClearSequenceStart new
		             context: (self componentNamed: #plotter) context;
		             yourself.
	model cellsDoWithPositon: [ :aCell :position |
		tasks add: [
			(tempNode translation: 20 @ 20 * position) addElement:
				(GBGoLCell new
					 model: aCell;
					 yourself) ] ].
	(reference translation: 0 @ 0) addElement:
		(loading := GBLoadingBar new
			            max: tasks size;
			            yourself).
	manager
		sequence: tasks;
		inBetweenDo: [
			loading progressInc.
			root announcer announce: drawEvent ];
		onFinishDo: [
			reference deleteAllChildren.
			reference addElement: tempNode.
			root announcer announce: drawEvent ];
		do
]

{ #category : 'as yet unclassified' }
GoLApp >> randomColor [

	| value r g b |
	value := (0 to: 255) atRandom.
	r := (value asInteger toString: 16) padStart: 2 with: '0'.
	value := (0 to: 255) atRandom.
	g := (value asInteger toString: 16) padStart: 2 with: '0'.
	value := (0 to: 255) atRandom.
	b := (value asInteger toString: 16) padStart: 2 with: '0'.
	^ '#' , r , g , b
]

{ #category : 'as yet unclassified' }
GoLApp >> sceneFactory [

	| orchestrator drawEvent |
	drawEvent := GBDrawNoClearSequenceStart new
		             context: (self componentNamed: #plotter) context;
		             yourself.

	orchestrator := GBOchestrator new
		                sequence: {
				                GBCalculate new.
				                drawEvent };
		                yourself.
	clock := GBClock new.
	clock
		requestedTps: 60;
		waitUntilIsFinished: orchestrator.
	root := GBNode new.
	root addElement: (reference := GBDrawingTranslation new
			              position: 500 @ 500;
			              yourself).
	root addElement: clock.
	root addElement: orchestrator.
	root addElement:
		(GBDrawSequencer new drawingEvent: GBDrawingNowPartial new yourself).
	root addElement: (GBCaptureMouseClick new
			 onCanvas: (self componentNamed: #plotter);
			 yourself).
	root addElement: (GBCaptureMouseMove new
			 onCanvas: (self componentNamed: #plotter);
			 yourself).
	self prepBoard.
	root addElement: (GBScript new
			 on: GBCalculate;
			 do: [ model step ];
			 yourself).
	root addElement: (GBScript new
			 on: GBMouseGlobalClick;
			 do: [ root announcer announce: drawEvent ];
			 yourself).
	root addElement: (GBScript new
			 on: GBMouseGlobalMove;
			 do: [ root announcer announce: drawEvent ];
			 yourself).
	root announcer announce: drawEvent.
	^ root
]

{ #category : 'initialize-release' }
GoLApp >> start [

	| scene |
	super start.
	self initializeComponentHolder.
	model := GameOfLife col: 30 row: 30.
	(self componentNamed: #plotter) scene: (scene := self sceneFactory).
	(document getElementById: #start)
		addEventListener: #click
		block: [ clock start ].
	(document getElementById: #stop)
		addEventListener: #click
		block: [ clock stop ].
	(document getElementById: #tps)
		addEventListener: #input
		block: [ clock requestedTps: (document getElementById: #tps) value ].
	(document getElementById: #step)
		addEventListener: #click
		block: [ clock tick ]
]
