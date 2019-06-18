Class {
	#name : #BaselineOfKataGameOfLife,
	#superclass : #BaselineOf,
	#category : 'BaselineOfKataGameOfLife'
}

{ #category : #baselines }
BaselineOfKataGameOfLife >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				baseline: 'Bloc'
   				with: [ spec
					repository: 'github://pharo-graphics/Bloc/src';
					loads: #default].
			spec
				baseline: 'Talents'
				with: [ spec
						repository: 'github://tesonep/pharo-talents/';
						loads: #test ].
			spec
				package: 'KataGameOfLife' with: [ spec requires: 'Talents' ];
				package: 'KataGameOfLife-Tests' with: [ spec requires: 'KataGameOfLife' ];
				package: 'KataGameOfLife-Bloc' with: [ spec requires: #('KataGameOfLife' 'Bloc') ].
			spec group: 'core'
				with: #('KataGameOfLife');
			     group: 'tests'
			     	with: #('KataGameOfLife-Tests');
			     group: 'bloc'
			     	with: #('KataGameOfLife-Bloc').
]

]

