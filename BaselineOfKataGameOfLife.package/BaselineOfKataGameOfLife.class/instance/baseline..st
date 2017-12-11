baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'KataGameOfLife';
				yourself.
			spec
				baseline: 'Talent'
				with: [ spec
						repository: 'github://tesonep/pharo-talents/';
						loads: 'default' ] ]
