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
						repository: 'github://mattonem/pharo-talents:patch-1/mc';
						loads: 'default' ] ]