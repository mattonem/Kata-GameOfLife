baselines
baseline: spec
	<baseline>
	Iceberg enableMetacelloIntegration: true.
	spec
		for: #common
		do: [ 
		spec
				baseline: 'Talents'
				with: [ spec
						repository: 'github://tesonep/pharo-talents/';
						loads:  #'default' ].
		spec
				package: 'KataGameOfLife';
				yourself. ]
