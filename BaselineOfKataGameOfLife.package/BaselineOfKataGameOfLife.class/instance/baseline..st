baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
		spec
				baseline: 'Talent'
				with: [ spec
						repository: 'github://tesonep/pharo-talents/';
						loads: 'default' ].
		spec
				package: 'KataGameOfLife';
				yourself. ]
