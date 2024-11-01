Class {
	#name : 'GoLApp',
	#superclass : 'PjFileBasedWebApp',
	#traits : 'StaticComponentHolder',
	#classTraits : 'StaticComponentHolder classTrait',
	#instVars : [
		'clock',
		'reference',
		'model'
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

	reference deleteAllChildren.
	model cellsDoWithPositon: [ :aCell :position |
		(reference translation: 20 @ 20 * position) addElement:
			(GBGoLCell new
				 model: aCell;
				 yourself) ]
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

	| node orchestrator drawEvent |
	drawEvent := GBDrawSequenceStart new
		             context: (self componentNamed: #plotter) context;
		             yourself.

	orchestrator := GBOchestrator new
		                sequence: {
				                GBCalculate new.
				                drawEvent };
		                yourself.
	clock := GBClock new.
	clock requestedTps: 60.
	node := GBNode new.
	node addElement: (reference := GBDrawingTranslation new
			              position: 0 @ 0;
			              yourself).
	node addElement: clock.
	node addElement: orchestrator.
	node addElement: GBDrawSequencer new.
	node addElement: (GBCaptureMouseClick new
			 onCanvas: (self componentNamed: #plotter);
			 yourself).
	node addElement: (GBCaptureMouseMove new
			 onCanvas: (self componentNamed: #plotter);
			 yourself).
	self prepBoard.
	node addElement: (GBScript new
			 on: GBCalculate;
			 do: [ model step ];
			 yourself).
	node addElement: (GBScript new
			 on: GBMouseGlobalClick;
			 do: [ model announcer announce: drawEvent ];
			 yourself).
	node addElement: (GBScript new
			 on: GBMouseGlobalMove;
			 do: [ node announcer announce: drawEvent ];
			 yourself).
	node announcer announce: drawEvent.
	"	node addElement: GBDebugger new."
	"	clock start."
	^ node
]

{ #category : 'initialize-release' }
GoLApp >> start [
	|scene|
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
