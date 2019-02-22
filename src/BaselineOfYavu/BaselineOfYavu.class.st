Class {
	#name : #BaselineOfYavu,
	#superclass : #BaselineOf,
	#category : #BaselineOfYavu
}

{ #category : #baselines }
BaselineOfYavu >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self magritte3: spec.
			"Packages"
			spec package: 'YavuCommon'.
			spec package: 'YavuNutriData' with: [spec requires: 'YavuCommon'].
			spec package: 'YavuInformes' with: [spec requires: #('YavuCommon' 'Magritte3')].
			]
		
]

{ #category : #'as yet unclassified' }
BaselineOfYavu >> magritte3: spec [
	spec
		project: 'Magritte3'
		with: [ 
			spec
				className: 'ConfigurationOfMagritte3';
				loads: #('Core' 'Magritte-Seaside');
				versionString: '3.5.1';
				repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main']
]

{ #category : #accessing }
BaselineOfYavu >> projectClass [
	^ MetacelloCypressBaselineProject
]
