Class {
	#name : 'BaselineOfKataGameOfLife',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfKataGameOfLife',
	#package : 'BaselineOfKataGameOfLife'
}

{ #category : 'baselines' }
BaselineOfKataGameOfLife >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Gamebox'
			with: [ spec repository: 'github://mattonem/WCGamebox' ].
		spec
			package: 'KataGameOfLife' with: [  ];
			package: 'KataGameOfLife-Tests'
			with: [ spec requires: 'KataGameOfLife' ];
			package: 'KataGameOfLife-PharoJs'
			with: [ spec requires: #( 'KataGameOfLife' 'Camping' ) ].
		spec
			group: 'core' with: #( 'KataGameOfLife' );
			group: 'tests' with: #( 'KataGameOfLife-Tests' );
			group: 'pharoJs' with: #( 'KataGameOfLife-PharoJs' ) ]
]
